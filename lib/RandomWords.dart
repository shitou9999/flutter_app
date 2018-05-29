import 'package:flutter/material.dart';
import 'package:flutter_app/ListViewWidget.dart';
//import 'package:flutter_app/RandomWordsState.dart';

//将有状态的 RandomWords widget 添加到 main.dart。它可以在 MyApp 类之外的任何位置使用

//实现一个有状态的 widget 至少需要两个类：StatefulWidgets类和State类，

class RandomWords extends StatefulWidget{
//Flutter 与 React Native/Weex 本质上是不同的，它并没有使用 WebView、JavaScript
// 解释器或者系统平台自带的原生控件，而是有自己专属的一套 Widget，
// 界面开发使用 Dart 语言，而底层渲染使用自身的高性能 C/C++ 引擎自绘

  @override
  State<StatefulWidget> createState() {
    return new ListViewWidget();
  }

  //当widget的状态发生变化时，widget会重新构建UI，Flutter会对比前后变化的不同，
// 以确定底层渲染树从一个状态转换到下一个状态所需的最小更改
// （译者语：类似于React/Vue中虚拟DOM的diff算法）。


}