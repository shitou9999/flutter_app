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
//      body: _getGridView(context),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }

  List<Widget> list = <Widget>[
    new ListTile(
      title: new Text('CineArts at the Empire',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('85 W Portal Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
    ),
    new ListTile(
      title: new Text('The Castro Theater',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('429 Castro St'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
    ),
    new Divider(),
    new ListTile(
      title: new Text('K\'s Kitchen',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('757 Monterey Blvd'),
      leading: new Icon(
        Icons.restaurant,
        color: Colors.blue[500],
      ),
    ),
  ];

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

  ///怎么知道哪个列表项被点击??????????????通过传入的处理回调来进行操作
  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new GestureDetector(
        child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i"),
        ),
        onTap: () {
          print('row tapped');
        },
      ));
    }
    return widgets;
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
