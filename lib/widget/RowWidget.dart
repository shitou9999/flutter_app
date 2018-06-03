import 'package:flutter/material.dart';
///
/// 标准 widgets
///Container添加 padding, margins, borders, background color, 或将其他装饰添加到widget.
///GridView
///ListView
///Stack将widget重叠在另一个widget之上.
///Material Components
///Card 将相关内容放到带圆角和投影的盒子中。
///ListTile 将最多3行文字，以及可选的行前和和行尾的图标排成一行
///
/// RelativeLayout在Flutter中等价于什么
/// https://stackoverflow.com/questions/44396075/equivalent-of-relativelayout-in-flutter
/// 您可以通过使用Column、Row和Stack的组合来实现RelativeLayout的效果。
/// 您可以为widget构造函数指定相对于父组件的布局规则。
class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Text使用"),
        ),
        ///在Flutter中，您可以使用Row或Co​​lumn来实现相同的结果。
        ///
        //MainAxisAlignment表示主轴方向（水平方向）
        // CrossAxisAlignment表示副轴方向（和主轴垂直，即垂直方向）
        body: new Column(
          children: <Widget>[
            ///LinearLayout来使您的控件呈水平或垂直排列
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text('爱情公寓', textAlign: TextAlign.center),
                ),
                new Expanded(
                  child:
                      new Text('爱尔兰 堕胎禁令杨幂霍建华开机', textAlign: TextAlign.center),
                ),
                new Expanded(
                  child: new FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: const FlutterLogo(),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                const FlutterLogo(),
                const Text(
                    'Flutter\'s习近平贺信表明中国构建网络空间命运共同体的新内涵习近平贺信表明中国构建网络空间命运共同体的新内涵'),
                const Icon(Icons.sentiment_very_satisfied),
              ],
            ),
            new Row(
              children: <Widget>[
                const FlutterLogo(),
                const Expanded(
                  child: const Text(
                      'Flutter\'s习近平贺信表明中国构建网络空间命运共同体的新内涵习近平贺信表明中国构建网络空间命运共同体的新内涵'),
                ),
                const Icon(Icons.sentiment_very_satisfied),
              ],
            ),
          ],
        ));
  }

//最主要注意的一点就是内容不能超过边界，否则会出错误。
//  这里补充的是如果使用了Expanded，那么其中的Widget的尺寸就不再起作用
   _baseRow() {
    return new Container(
      color: Colors.red,
      height: 300.0,
      child: new Row(
        // 会超出去，展示错误
//          children: <Widget>[
//            new Container(width: 200.0, color: Colors.green,),
//            new Container(width: 200.0, color: Colors.blue,),
//            new Container(width: 200.0, color: Colors.cyan,),
//          ],
        children: <Widget>[
          // 使用了Expanded后，尺寸不再起作用
          new Expanded(child: new Container(width: 50.0, color: Colors.green,)),
          new Expanded(child: new Container(width: 100.0, color: Colors.blue,)),
          new Expanded(child: new Container(width: 100.0, color: Colors.cyan,)),
        ],
      ),
    );
  }

}
