import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget{
///  用于与另一个widget重叠的widget
///  子列表中的第一个widget是base widget; 随后的子widget被覆盖在基础widget的顶部
///  Stack的内容不能滚动
///  您可以选择剪切超过渲染框的子项
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const Alignment(0.2, 0.5),//Alignment
      children: [
        new CircleAvatar(
          backgroundImage: new AssetImage('images/img002.jpg'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text(
            'Mia B',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
      body:stack,
    );
  }
//Navigator
}