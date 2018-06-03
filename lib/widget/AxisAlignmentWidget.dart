import 'package:flutter/material.dart';

class AxisAlignmentWidget extends StatelessWidget{
///对齐 widgets
  ///可以控制行或列如何使用mainAxisAlignment和crossAxisAlignment属性来对齐其子项！！！！！
///调整 widget
  ///也许你想要一个widget占据其兄弟widget两倍的空间。
  ///您可以将行或列的子项放置在Expandedwidget中， 以控制沿着主轴方向的widget大小
///聚集 widgets

  Center center = new Center(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//1:1:1
      children: <Widget>[
        //flex设置平分的比例，默认为1均分
        new Expanded(child: new Image.asset('images/img001.jpg',width: 200.0,),),
        new Expanded(child: new Image.asset('images/img001.jpg',width: 200.0,),flex: 1,),
        new Expanded(child: new Image.asset('images/img001.jpg',width: 100.0,),),

//        new Image.asset('images/img001.jpg',width: 100.0,),
//        new Image.asset('images/img001.jpg',width: 100.0,),
      ],
    ),
  );

  Center center01 = new Center(
    child: new Column(
      ///spaceEvenly，它会在每个图像之间，上方和下方均匀分配空闲的垂直空间
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//1:1:1
      children: <Widget>[
        new Image.asset('images/img001.jpg',width: 100.0,),
        new Image.asset('images/img001.jpg',width: 100.0,),
        new Image.asset('images/img001.jpg',width: 100.0,),
      ],
    ),
  );
///如果布局太大而不适合设备，则会在受影响的边缘出现红色条纹,
  ///通过使用Expanded widget，可以将widget的大小设置为适和行或列，


  /// 默认情况下，行或列沿着其主轴会尽可能占用尽可能多的空间，
  /// 但如果要将孩子紧密聚集在一起，可以将mainAxisSize设置为MainAxisSize.min。
  var packedRow = new Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      new Icon(Icons.star, color: Colors.green[500]),
      new Icon(Icons.star, color: Colors.green[500]),
      new Icon(Icons.star, color: Colors.green[500]),
      new Icon(Icons.star, color: Colors.black),
      new Icon(Icons.star, color: Colors.black),
    ],
  );


  ///
  @override
  Widget build(BuildContext context) {
    var titleText = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Text(
        'Strawberry Pavlova',
        style: new TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30.0,
        ),
      ),
    );

    var subTitle = new Text(
      '''
Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
''',
      textAlign: TextAlign.center,
      style: new TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25.0,
      ),
    );

    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    // DefaultTextStyle.merge allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    var iconList = DefaultTextStyle.merge(
      // ignore: implicit_this_reference_in_initializer
      style: descTextStyle,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new Icon(Icons.kitchen, color: Colors.green[500]),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.timer, color: Colors.green[500]),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.restaurant, color: Colors.green[500]),
                new Text('FEEDS:'),
                new Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    var mainImage = new Image.asset(
      'images/img001.jpg',
      fit: BoxFit.cover,
    );

    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
          height: 600.0,
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  width: 440.0,
                  child: leftColumn,
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }


}