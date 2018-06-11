import 'package:flutter/material.dart';

///一个route是一个屏幕或页面的抽象，Navigator是管理route的Widget
///接收值测试
class IntentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SelectionButton();
  }

  /// Route是应用程序的“屏幕”或“页面”的抽象（可以认为是Activity），
  /// Navigator是管理Route的Widget。Navigator可以通过push和pop route以实现页面切换。
}
/// Flutter不具有Intents的概念，但如果需要的话，Flutter可以通过Native整合来触发Intents。
///
/// Intents的另一个主要的用途是调用外部组件！！！！！如Camera或File picker。
/// 为此，您需要和native集成（或使用现有的库）
///
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('测试接收返回值'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            _navigateAndDisplaySelection(context);
          },
          child: new Text('进入下一个界面选择接收返回值'),
        ),
      ),
    );
  }

  ///启动SelectionScreen并等待结果的方法
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new SelectionScreen()));
    print('$result');
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('我是接收返回值$result')));
  }
  ///startActivityForResult 在Flutter中等价于什么
///这可以通过等待push返回的Future来完成。
/// 例如，如果您要启动让用户选择其位置的位置的路由，则可以执行以下操作
///Map coordinates = await Navigator.of(context).pushNamed('/location');
/// 然后在你的位置路由中，一旦用户选择了他们的位置，你可以将结果”pop”出栈
///Navigator.of(context).pop({"lat":43.821757,"long":-79.226392});
///
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('选择返回传值到上一个页面'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, '对的');
                },
                child: new Text('对的'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pop(context, '错的');
                },
                child: new Text('错误'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
