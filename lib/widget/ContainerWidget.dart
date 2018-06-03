import 'package:flutter/material.dart';

////Container：矩形控件，可与BoxDecoration配合来装饰 background, a border, or a shadow，
//对于一个没有子Widget的Container，在没有一些约束的条件时，它会尽可能的大；
// 而一旦有了约束或者子Widget，它就会变得尽可能小。
//Container布局或放widget

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    添加padding, margins, borders
//    改变背景颜色或图片
//    包含单个子widget，但该子widget可以是Row，Column，甚至是widget树的根
    var container = new Container(
        height: 200.0,
        width: 400.0,
        child: new Container(
          color: Colors.purple,
          child: new Text("hello", style: new TextStyle(fontSize: 40.0)),
          padding: const EdgeInsets.all(60.0), //内边距
        ),
        alignment: Alignment.center,
        ///是Container内child的对齐方式,并不是Container在其父Widget中的对齐方式。
        decoration: new BoxDecoration(
            gradient: const LinearGradient(colors: [
              Colors.lightBlue,
              Colors.greenAccent,
              Colors.purple
            ])),
///          foregroundDecoration前景边框会挤压占据包裹内容的区域
        foregroundDecoration: new BoxDecoration(
          border: new Border.all(
              color: Colors.redAccent, width: 30.0, style: BorderStyle.solid),
        ),
        margin: const EdgeInsets.all(10.0),
//布局约束
        constraints: new BoxConstraints.loose(new Size(500.0, 400.0)),
        transform: new Matrix4.rotationZ(0.5));

    var gallery = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/img002.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  ///边框
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/img002.jpg'),
                ),
              ),
            ],
          ),
          container,
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text使用"),
      ),
      body: gallery,
    );
  }
}
