import 'package:flutter/material.dart';

///在Flutter中，添加触摸监听器有两种方法:
///
class OnClickWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("事件监听"),
      ),
      body:new Text(
          '我是text'
      ),
    );
  }

  ///1.如果Widget支持事件监听，则可以将一个函数传递给它并进行处理。
  Widget _setOnClick(){
    return new RaisedButton(
        onPressed: () {
          print("click");
        },
        child: new Text("Button"));
  }

  ///2.如果Widget不支持事件监听，则可以将该Widget包装到GestureDetector中，并将处理函数传递给onTap参数
  Widget _GesClick(){
    return new Scaffold(
        body: new Center(
          child: new GestureDetector(
            child: new FlutterLogo(
              size: 200.0,
            ),
            onTap: () {
              print("tap");
            },
          ),
        ));
  }


  ///如何处理widget上的其他手势
///使用GestureDetector，可以监听多种手势!!!!!!!!!!!
//  Tap
//  onTapDown
//  onTapUp
//  onTap
//  onTapCancel
//  Double tap
//  onDoubleTap 用户快速连续两次在同一位置轻敲屏幕.
//  长按
//  onLongPress
//  垂直拖动
//  onVerticalDragStart
//  onVerticalDragUpdate
//  onVerticalDragEnd
//  水平拖拽
//  onHorizontalDragStart
//  onHorizontalDragUpdate
//  onHorizontalDragEnd
}