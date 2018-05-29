import 'package:flutter/material.dart';


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterApp',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(
        title: '我是HomePage的title',
      ),
    );
  }


//  return new MaterialApp(
//  title: 'FlutterApp',
//  theme: new ThemeData(primarySwatch: Colors.blue),
//  home:new Scaffold(
//  appBar:new AppBar(
//  title: new Text('AppBarTitle'),
//  ),
//  body:new Center(
//  child: new Text(wordPair.asPascalCase),
//  ),
//  ),
//  );

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title:new Text(widget.title) ,
      ),
      body:new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            new Text('哈哈哈哈我是Text'),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          foregroundColor:Colors.red,
          child: new Icon(Icons.add)
      ),
    );
  }

}
