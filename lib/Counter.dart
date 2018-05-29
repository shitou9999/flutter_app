import 'package:flutter/material.dart';

//Widget是临时对象，用于构建当前状态下的应用程序
class Counter extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }

}

//在Flutter中，事件流是“向上”传递的，而状态流是“向下”传递的
//（译者语：这类似于React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态），
//重定向这一流程的共同父元素是State

//State对象在多次调用build()之间保持不变，允许它们记住信息(状态)
class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
     return new Row(
         children:<Widget>[
//           new RaisedButton(
//             onPressed: _increment,
//             child: new Text('计数'),
//           ),
//           new Text('$_counter')
           new CounterIncrementor(onPressed: _increment),
           new CounterDisplay(count: _counter),
         ]
     );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

}

//无状态的--->接受一个值显示
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('组件B中: $count');
  }
}

//事件流是“向上”传递的，而状态流是“向下”传递的！！！！！！！！！！！
//类似于React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('组件A中点击'),
    );
  }
}

