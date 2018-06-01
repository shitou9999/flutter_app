import 'package:flutter/material.dart';

///使用标准ListView构造函数非常适合仅包含少量条目的列表。我们使用内置的ListTile Widget来作为列表项。
class ListViewWidget extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView使用"),
      ),
//      body: _getListBuild(),
      body: _getGridView(context),
    );
  }

  _getListView() {
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('地图'),
        ),
        new ListTile(
          leading: new Icon(Icons.access_alarm),
          title: new Text('闹钟'),
        ),
        new ListTile(
          leading: new Icon(Icons.access_time),
          title: new Text('钟表1'),
        ),
      ],
    );
  }

  _getHListView() {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 20.0),
      padding: new EdgeInsets.symmetric(vertical: 20.0),
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 160.0,
            color: Colors.red,
          ),
          new Container(
            width: 160.0,
            color: Colors.blue,
          ),
          new Container(
            width: 160.0,
            color: Colors.green,
          ),
          new Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  //ListView的构造函数需要一次创建所有项目，
// 但ListView.builder的构造函数不需要，它将在列表项滚动到屏幕上时创建该列表项。
//  items: new List<String>.generate(10000, (i) => "Item $i");
  _getListBuild() {
    return new ListViewBuild(
        items: new List<String>.generate(10000, (i) => "Item $i"));
  }

  _getGridView(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
//      children: <Widget>[
//
//      ],
      children: new List.generate(100, (index) {
        return new Center(
          child: new Text(
            'Item $index',
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}

class ListViewBuild extends StatelessWidget {
  final List<String> items;

  ListViewBuild({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return new Scaffold(
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text('${items[index]}'),
          );
        },
      ),
    );
  }
}
