import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/example/AirPort.dart';
import 'package:flutter_app/list/ListViewWidget.dart';
import 'package:flutter_app/list/MultiWidget.dart';
import 'package:flutter_app/list/NetWidget.dart';
import 'package:flutter_app/shop/ShoppingList.dart';
import 'package:flutter_app/shop/ShoppingListItem.dart';
import 'package:flutter_app/state/AddRemoveWidget.dart';
import 'package:flutter_app/state/AnimationStudy.dart';
import 'package:flutter_app/state/FavoriteWidget.dart';
import 'package:flutter_app/state/LifecycleWidget.dart';
import 'package:flutter_app/state/MixtureManagerState.dart';
import 'package:flutter_app/state/ParentManagerState.dart';
import 'package:flutter_app/state/SelfManagerState.dart';
import 'package:flutter_app/widget/AnimatedListWidget.dart';
import 'package:flutter_app/widget/AppBarBottomWidget.dart';
import 'package:flutter_app/widget/AxisAlignmentWidget.dart';
import 'package:flutter_app/widget/BasicAppBarSample.dart';
import 'package:flutter_app/widget/ButtonWidget.dart';
import 'package:flutter_app/widget/CardWidget.dart';
import 'package:flutter_app/widget/ColumeWidget.dart';
import 'package:flutter_app/widget/ContainerWidget.dart';
import 'package:flutter_app/widget/FileReadWriteWidget.dart';
import 'package:flutter_app/widget/GridViewWidget.dart';
import 'package:flutter_app/widget/HttpWidget.dart';
import 'package:flutter_app/widget/ImageWidget.dart';
import 'package:flutter_app/widget/IntentWidget.dart';
import 'package:flutter_app/widget/LayoutWidget.dart';
import 'package:flutter_app/widget/NavigatorWidget.dart';
import 'package:flutter_app/widget/RowWidget.dart';
import 'package:flutter_app/widget/StackWidget.dart';
import 'package:flutter_app/widget/TabbedAppBarSample.dart';
import 'package:flutter_app/widget/TextFieldWidget.dart';
import 'package:flutter_app/widget/TextWidget.dart';
import 'package:flutter_app/Counter.dart';
import 'package:flutter_app/MyButton.dart';
import 'package:flutter_app/MyScaffold.dart';
import 'package:flutter_app/RandomWords.dart';
import 'package:flutter_app/TutorialHome.dart';
import 'package:flutter_app/widget/ExpansionTileWidget.dart';
import 'package:flutter_app/widget/WebSocketWidget.dart';

//void main() => runApp(new MyApp());
void main() => runApp(new AirPort());
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
//Stateless widgets 是不可改变的，这意味着它们的属性不能改变——所有的值都是 final 的。
//Statefulwidget 在其生命周期保持的状态可能会变化，
// 实现一个有状态的 widget 至少需要两个类：StatefulWidgets类和State类
//StatefulWidget类本身是不可变的，但State类可存在于Widget的整个生命周期中
//Flutter布局Layout的核心就是Widget。在Flutter里，基本上任何东西都是Widget
class MyApp extends StatelessWidget {
  final wordPair = new WordPair.random();
///请注意，默认情况下，非Material应用程序不包含AppBar，标题或背景颜色。
/// 如果您想在非Material应用程序中使用这些功能，您必须自己构建它们。
  ///
  ///  任何应用程序都可以使用widgets library中的widget，
  /// 但只有Material应用程序可以使用Material Components库。
  ///
  /// 为了获得良好的自动格式化，建议您采用可选的尾部逗号。
  /// 始终在函数、方法和构造函数的参数列表末尾添加尾随逗号，以便保留您的编码格式!
  ///
  /// Flutter使用自己的高性能渲染引擎来绘制widget,Flutter的不同是因为它核心只有一层轻量的C/C++代码
  @override
  Widget build(BuildContext context) {
    //Scaffold必须放在MaterialApp里面，否则会报错
    //非Material下，没有Appbar、背景色和标题等，所有的内容都需要自定义。
    //非Material下Text的textDirection属性是必须的
    return new MaterialApp(
      title: 'FlutterApp',
      theme: new ThemeData(primarySwatch: Colors.purple),//主色

//      this.routes: const <String, WidgetBuilder>{},///页面路由配置
//      routes: <String, WidgetBuilder> {
//        '/a': (BuildContext context) => new MyPage(title: 'page A'),
//        '/b': (BuildContext context) => new MyPage(title: 'page B'),
//        '/c': (BuildContext context) => new MyPage(title: 'page C'),
//      },//可以通过Navigator来切换到命名路由的页面

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
//    home: new GridViewWidget(),
//    home: new ImageWidget(),
//    home: new RowWidget(),
//    home: new ColumeWidget(),
//    home: new ButtonWidget(),
//    home: new ListViewWidget(),
//    home: new StackWidget(),///重叠的widget
//    home: new CardWidget(),///重叠的widget
//    home: new StateWidget(),///状态管理
//    home: new SelfManagerState(),///状态管理
//    home: new ParentManagerState(),///状态管理
//    home: new MixtureManagerState(),///状态管理
//    home: new AddRemoveWidget(),///如何在布局中添加或删除组件
//    home: new AnimationStudy(),///对视图进行动画处理
//    home: new NetWidget(),///获取网络数据ListView显示
//    home: new LifecycleWidget(),///生命周期监听
//    home: new TextFieldWidget(),///表单输入
    home: new FileReadWriteWidget(),///读写文件
//    home: new MultiWidget(),
//    home: new NavigatorWidget(),//路由传值
//      home: new IntentWidget(),//接收返回值
//      home: new HttpWidget(),
//      home: new WebSocketWidget(),
//    home: new BasicAppBarSample(),///带标题、操作和下拉菜单的典型AppBar。
//    home: new TabbedAppBarSample(),///tablayout一个以TabBar作为底部widget的AppBar
//    home: new ExpansionTileWidget(),///折叠展开列表
//    home: new AppBarBottomWidget(),///具有自定义底部widget的AppBar
//    home: new AnimatedListWidget(),///AnimatedList显示与ListModel保持同步的卡片列表
//    home: new LayoutWidget(),
//    home: new AxisAlignmentWidget(),///对齐
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
