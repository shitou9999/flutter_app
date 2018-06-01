import 'package:flutter/material.dart';

class UcWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
      body:new Text(
          '我是text'
      ),
    );
  }
//Navigator
}