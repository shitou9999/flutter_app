import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget{

  // The images are saved with names pic1.jpg, pic2.jpg...pic30.jpg.
// The List.generate constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) {
    List<Container> containers = new List<Container>.generate(
        count,
            (int index) =>
//        new Container(child: new Image.asset('images/pic${index+1}.jpg')));
        new Container(child: new Image.asset('images/img002.jpg')));
    return containers;
  }

  Widget buildGrid() {
    ///使用GridView.extent 创建最大宽度为150像素的网格
    return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(18.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(7));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
      body:buildGrid(),
    );
  }
//Navigator
}