import 'package:flutter/material.dart';
//RaisedButton只有onPressed不为null的情况下才会显示设置的颜色否则显示灰色

//注意⚠：它有个参数onPressed，如果没有定义回调函数，则无论你怎么设置，
// 该按钮的状态都是失效状态，而且其他所有的属性，只要是和disable无关的，
// 无论怎么设置都不会起作用。

//Icon是不响应事件的，IconButton可以
class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text使用"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
              onPressed: _buttonPressed,
              color: Colors.green,
              child: new Text(
                '我是一个Button',
              ),
              textColor: Colors.white, // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
              // highlightColor: Colors.yellow,  // 高亮时的背景色
              disabledColor: Colors.deepOrange, // 失效时的背景色
              disabledTextColor: Colors.grey, // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会 起作用
              splashColor: Colors.purple, // 点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
              colorBrightness: Brightness.dark, // 这个我也不知道
              elevation: 15.0, // 正常情况下浮动的距离
              highlightElevation: 5.0, // 高亮时的浮动距离（可以尝试将该值设置的比elevation小，看看体验）
              disabledElevation: 50.0,
              padding: const EdgeInsets.all(20.0),
              shape: new Border.all(
                // 设置边框样式
                color: Colors.blue,
                width: 4.0,
                style: BorderStyle.solid,
              ),
              animationDuration: new Duration(
                // 过程时间，最容易观察的是从elevation到highlightElevation，或者相反过程，但是前提是要彻底的按下去，注意其影子的变化
                seconds: 5,
              ),
              onHighlightChanged: _hightLightChanged, // 可以用来监听按钮的按下和放开过程
              textTheme: ButtonTextTheme.accent,  // 搞不懂这
          ),
          new IconButton(
            icon: new Icon(Icons.mic),
            tooltip: 'Navigation menu', //描述按下按钮时将发生的操作的文本
            onPressed: null, // null disables the button
          ),
          new RaisedButton(
            child: new Text("999999999999999999"),
            color: Colors.red,
            onPressed: _buttonPressed,
            shape: new Border.all(
              color: Colors.blue,
              width: 4.0,
              style: BorderStyle.solid,
            ),
          ),
          new Container(
            width: 300.0,
            margin: const EdgeInsets.only(top: 30.0),
            child: new Placeholder( //占位的Widget
              fallbackWidth: 100.0,
              fallbackHeight: 100.0,
              color: Colors.red,
            ),
          ),
          raisedButtonWithIcon(),
          _addWidgetToContainer(),
          _noWidgetToContainer(),
          _foregroundDecoration(),
          _baseRow(),
        ],
      ),
    );
  }

  raisedButtonWithIcon() {
    return new Center(
      child: new RaisedButton.icon(
        onPressed: _buttonPressed,
        icon: new Icon(Icons.star),
        label: new Text('RaisedButton'),
        color: Colors.indigoAccent,
      ),
    );
  }

  //如果限制了高度，高度如果足够，则会正常展示，但是如果高度不够的时候就会出现越界的现象
  _addWidgetToContainer() {
    return new Container(
      color: Colors.red,
      width: 300.0,//限制高度
      padding: const EdgeInsets.all(30.0),
      child: new Text("我是********************************************************Container"),
    );
  }

  _noWidgetToContainer() {
    return new Container(
      color: Colors.deepPurpleAccent,
    );
  }

  //它会堵在Container的所有子Widget的前面，另外还有一些圆角和背景的问题
  //会堵住子Widget和切角
  //Container的color和decoration该属性不能共存!!!!!!!!!!
   _foregroundDecoration() {
    return new Center(
      child: new Container(
//        color: Colors.red,// 不能和decoration共存
        constraints: new BoxConstraints.expand(width: 100.0, height: 100.0,),
        //foregroundDecoration会盖住子widget，decoration不会盖住！！！！！
        decoration: new BoxDecoration(
          color: Colors.blue,
          border: new Border.all(color: Colors.yellow, width: 5.0,),
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          gradient: new LinearGradient(colors: [Colors.blue, Colors.green]),
        ),
        alignment: Alignment.center,
        child: new Text("Container"),
      ),
    );
  }

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
          new Expanded(child: new Container(width: 20.0, color: Colors.green,)),
          new Expanded(child: new Container(width: 100.0, color: Colors.blue,)),
          new Expanded(child: new Container(width: 100.0, color: Colors.cyan,)),
        ],
      ),
    );
  }


  void _hightLightChanged(bool value) {

  }

  void _buttonPressed() {
    print('Clicked***********************');
  }




}
