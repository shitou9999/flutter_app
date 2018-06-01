import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/list/ListViewWidget.dart';
import 'package:flutter_app/list/MultiWidget.dart';
import 'package:flutter_app/shop/ShoppingList.dart';
import 'package:flutter_app/shop/ShoppingListItem.dart';
import 'package:flutter_app/widget/BasicAppBarSample.dart';
import 'package:flutter_app/widget/ButtonWidget.dart';
import 'package:flutter_app/widget/ColumeWidget.dart';
import 'package:flutter_app/widget/ContainerWidget.dart';
import 'package:flutter_app/widget/ImageWidget.dart';
import 'package:flutter_app/widget/IntentWidget.dart';
import 'package:flutter_app/widget/NavigatorWidget.dart';
import 'package:flutter_app/widget/RowWidget.dart';
import 'package:flutter_app/widget/TabbedAppBarSample.dart';
import 'package:flutter_app/widget/TextWidget.dart';
import 'package:flutter_app/Counter.dart';
import 'package:flutter_app/MyButton.dart';
import 'package:flutter_app/MyScaffold.dart';
import 'package:flutter_app/RandomWords.dart';
import 'package:flutter_app/TutorialHome.dart';

void main() => runApp(new MyApp());

//Stateless widgets 是不可改变的，这意味着它们的属性不能改变——所有的值都是 final 的。
//Statefulwidget 在其生命周期保持的状态可能会变化，
// 实现一个有状态的 widget 至少需要两个类：StatefulWidgets类和State类
//StatefulWidget类本身是不可变的，但State类可存在于Widget的整个生命周期中
//Flutter布局Layout的核心就是Widget。在Flutter里，基本上任何东西都是Widget
class MyApp extends StatelessWidget {
  final wordPair = new WordPair.random();

  @override
  Widget build(BuildContext context) {
    //Scaffold必须放在MaterialApp里面，否则会报错
    //非Material下，没有Appbar、背景色和标题等，所有的内容都需要自定义。
    //非Material下Text的textDirection属性是必须的
    return new MaterialApp(
      title: 'FlutterApp',
      theme: new ThemeData(primarySwatch: Colors.purple),
//      home: new RandomWords(),//listview
//      home: new MyScaffold(),//布局
//      home: new TutorialHome(),
//    home: new MyButton(),//处理手势
//      home: new Counter(), //计数
//      home: new ShoppingList(
//        products: <Product>[
//          new Product(name: 'Eggs'),
//          new Product(name: 'Flour'),
//          new Product(name: 'Chocolate chips'),
//        ],
//      ), //购物车
//    home: new TextWidget(),
//    home: new ContainerWidget(),
//    home: new ImageWidget(),
//    home: new RowWidget(),
//    home: new ColumeWidget(),
//    home: new ButtonWidget(),
//    home: new ListViewWidget(),
//    home: new MultiWidget(),
//    home: new NavigatorWidget(),//路由传值
      home: new IntentWidget(),//接收返回值
//    home: new BasicAppBarSample(),
//    home: new TabbedAppBarSample(),
    );
  }

//  new Text(
//  'Hello, $_name! How are you?',
//  textAlign: TextAlign.center,
//  overflow: TextOverflow.ellipsis,
//  style: new TextStyle(fontWeight: FontWeight.bold),
//  )

/*
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterApp',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('AppBarTitle'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }*/

}
