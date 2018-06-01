import 'package:flutter/material.dart';
//使用主题共享颜色和字体样式
//为了在整个应用中共享颜色和字体样式，我们可以使用主题。
// 定义主题有两种方式：全局主题或使用Theme来定义应用程序局部的颜色和字体样式。 事实上，全局主题只是由应用程序根MaterialApp创建的Theme ！
//定义一个主题后，我们可以在我们自己的Widgets中使用它。
// 另外，Flutter提供的Material Widgets将使用我们的主题为AppBars、Buttons、Checkboxes等设置背景颜色和字体样式。
class ThemeWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
      body:new Text(
          '我是text'
      ),
    );
  }

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom Themes';

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new MyHomePage(
        title: appName,
      ),
    );
  }
}
/*
局部主题
如果我们想在应用程序的一部分中覆盖应用程序的全局的主题，我们可以将要覆盖得部分封装在一个Theme Widget中。

有两种方法可以解决这个问题：创建特有的ThemeData或扩展父主题。

创建特有的 ThemeData
如果我们不想继承任何应用程序的颜色或字体样式，我们可以通过new ThemeData()创建一个实例并将其传递给Theme Widget。

new Theme(
// Create a unique theme with "new ThemeData"
data: new ThemeData(
accentColor: Colors.yellow,
),
child: new FloatingActionButton(
onPressed: () {},
child: new Icon(Icons.add),
),
);
扩展父主题
扩展父主题时无需覆盖所有的主题属性，我们可以通过使用copyWith方法来实现。

new Theme(
// Find and Extend the parent theme using "copyWith". Please see the next
// section for more info on `Theme.of`.
data: Theme.of(context).copyWith(accentColor: Colors.yellow),
child: new FloatingActionButton(
onPressed: null,
child: new Icon(Icons.add),
),
);
*/

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}