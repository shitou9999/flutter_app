import 'package:flutter/material.dart';

///接收值测试
class IntentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SelectionButton();
  }
//Navigator
}

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

  //启动SelectionScreen并等待结果的方法
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new SelectionScreen()));
    print('$result');
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('我是接收返回值$result')));
  }
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
