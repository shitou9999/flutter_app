import 'package:flutter/material.dart';

///所有布局widget都有一个child属性（例如Center或Container），或者一个 children属性，
/// 如果他们需要一个widget列表（例如Row，Column，ListView或Stack）
///
class LayoutWidget extends StatelessWidget {
  //Flutter应用本身就是一个widget，大部分widget都有一个build()方法
  @override
  Widget build(BuildContext context) {
    ///使用Scaffold是最容易的，它是 Material Components库中的一个widget，
    /// 它提供了一个默认banner，背景颜色，并且具有添加drawer，snack bar和底部sheet的API
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("布局study"),
      ),
      body: new MyApp(),
    );
  }
//Navigator
}
///使用Center，它可以将内容水平和垂直居中
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          ///将Column（列）放入Expanded中会拉伸该列以使用该行中的所有剩余空闲空间
          new Expanded(
            ///可以控制行或列如何使用mainAxisAlignment和crossAxisAlignment属性来对齐其子项
            ///对于行(Row)来说，主轴是水平方向，横轴垂直方向。
            ///对于列（Column）来说，主轴垂直方向，横轴水平方向。
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,//将将列中的子项左对齐
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//平均的分配每个列占据的行空间
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    /// 将文本放入容器中，以便沿每条边添加32像素的填充。
    /// softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开。
    ///  Container也是一个widget，允许您自定义其子widget。如果要添加填充，
    /// 边距，边框或背景色，请使用Container来设置（译者语：只有容器有这些属性）
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return new ListView(
      children: [
        new Image.asset(
          'images/img001.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,///BoxFit.cover 告诉框架，图像应该尽可能小，但覆盖整个渲染框
        ),
        titleSection,
        buttonSection,
        textSection,
      ],
    );
  }



}
