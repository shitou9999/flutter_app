import 'package:flutter/material.dart';

class NotifyListView extends StatelessWidget{
//  需要更新适配器并调用notifyDataSetChanged。在Flutter中，如果setState（）中更新widget列表，
//  您会发现没有变化， 这是因为当setState被调用时，Flutter渲染引擎会遍历所有的widget以查看它
//  们是否已经改变。 当遍历到你的ListView时，它会做一个==运算，以查看两个ListView是否相同，
//  因为没有任何改变，因此没有更新数据。

///要更新您的ListView，然后在setState中创建一个新的List（）并将所有旧数据复制到新列表中。
/// 这是实现更新的简单方法（译者语：此时状态改变，ListView被重新构建）
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('如何动态更新ListView'),//推荐的方法是使用ListView.Builder
      ),
      body: new SampleNotifyPage(),
    );
  }
///当您拥有动态列表或包含大量数据的列表时，此方法非常有用。
/// 这实际上相当于在Android上使用RecyclerView，它会自动为您回收列表元素：
}

class SampleNotifyPage extends StatefulWidget {
  SampleNotifyPage({Key key}) : super(key: key);

  @override
  _SampleNotifyPageState createState() => new _SampleNotifyPageState();
}

class _SampleNotifyPageState extends State<SampleNotifyPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView(children: widgets),
    );
  }

  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")),
      onTap: () {
        setState(() {
          ///重新创建列表
          widgets = new List.from(widgets);
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}

///推荐方法更新
class _SampleAppPageState extends State<SampleNotifyPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            ///ItemBuilder函数非常类似于Android适配器中的getView函数，它需要一个位置并返回要为该位置渲染的行。
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }
///我们不是创建一个“新的ListView”，而是创建一个新的ListView.builder，
/// 它接受两个参数，即列表的初始长度和一个ItemBuilder函数。
  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")),
      onTap: () {
        setState(() {
          ///我们不会再重新创建列表，而只是添加新元素到列表！！！！！！！！！
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}