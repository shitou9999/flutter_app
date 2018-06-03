import 'package:flutter/material.dart';

///如何在布局中添加或删除组件
///
class AddRemoveWidget extends StatelessWidget {
//  在Android中，您可以从父级控件调用addChild或removeChild以动态添加或删除View。
//  在Flutter中，因为widget是不可变的，所以没有addChild。相反，您可以传入一个函数，
//  该函数返回一个widget给父项，并通过布尔值控制该widget的创建。

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('如何在布局中添加或删除组件'),
      ),
      body: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text(
        'Toggle One',
        style: new TextStyle(fontSize: 20.0),
      );
    } else {
      return new MaterialButton(
          onPressed: () {},
          child: new Text(
            'Toggle Two',
            style: new TextStyle(fontSize: 20.0),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
