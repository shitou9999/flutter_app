import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldWidget extends StatelessWidget{
///获取用户输入
  ///处理 onChanged回调------》每当用户输入时，TextField会调用它的onChanged回调。 您可以处理此回调以查看用户输入的内容。
  /// 例如，如果您正在输入搜索字段，则可能需要在用户输入时更新搜索结果。
  ///
  /// 提供一个TextEditingController.

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("表单输入"),///Input的”hint”在flutter中相当于什么
      ),
//      body:_getTextHint(),
//      body:new TextFieldPage(),
      body:new TextEditingControlleridget(),
    );
  }

  Widget _getTextHint(){
    return new Center(
        child: new TextField(
          decoration: new InputDecoration(hintText: "This is a hint"),
        )
    );
  }

  Widget _getCenterSP(){
    return new Center(
      child: new RaisedButton(
        onPressed: _incrementCounter,
        child: new Text('Increment Counter'),
      ),
    );
  }

  _incrementCounter() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    int counter = (prefs.getInt('counter') ?? 0) + 1;
//    print('Pressed $counter times.');
//    prefs.setInt('counter', counter);
  }

}

///TextEditingController读取TextField中用户输入的值的示例
class TextEditingControlleridget extends StatefulWidget {
  TextEditingControlleridget({Key key}) : super(key: key);

  @override
  _TextEditingControlleridgetState createState() => new _TextEditingControlleridgetState();
}

/// State for [ExampleWidget] widgets.
class _TextEditingControlleridgetState extends State<TextEditingControlleridget> {
  final TextEditingController _controller = new TextEditingController();
  ///要在这些属性更改时得到通知，请使用controller的addListener方法监听控制器 。
  ///如果你添加了一个监听器，记得在你的State对象的dispose方法中删除监听器 ）。
  ///
  /// 该TextEditingController还可以让您控制TextField的内容。如果修改controller的text或selection的属性，
  /// TextField将更新，以显示修改后的文本或选中区间。 例如，您可以使用此功能来实现推荐内容的自动补全。
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,// 在用户输入时，controller的text和selection属性不断的更新
          decoration: new InputDecoration(
            hintText: '我是hint',
          ),
        ),
        new RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text('What you typed'),
                content: new Text(_controller.text),
              ),
            );
          },
          child: new Text('完成'),
        ),
      ],
    );
  }
}

///如何显示验证错误
class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key}) : super(key: key);

  @override
  _TextFieldPageState createState() => new _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new TextField(
          onSubmitted: (String text) {
            setState(() {
              if (!isEmail(text)) {
                _errorText = 'Error: This is not an email';
              } else {
                _errorText = null;
              }
            });
          },
          decoration: new InputDecoration(hintText: "This is a hint", errorText: _getErrorText()),
        ),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}