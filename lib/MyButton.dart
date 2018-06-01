import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      body: new Center(child: _gestureDetector(context)),
      body: new Center(child: MyInkWellButton()),
    );
  }

//这种方式不能弹出snackBar?????????
  _gestureDetector(BuildContext context) {
    return new GestureDetector(
      onTap: () {
//        print('MyButton was tapped!');
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
        print('MyButton was tapped!');
      },
      //自定义button
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(38.0),
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(105.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // Our Custom Button!
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Text('Button'),
      ),
    );
  }
}

///添加Material触摸水波效果
///创建一个可点击的Widget。
///将它包裹在一个InkWell中来管理点击回调和水波动画
class MyInkWellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Tap'),
        ));
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Text('Flat Button'),
      ),
    );
  }
}