import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text使用"),
      ),
      /*
      body: new Container(
        width: 400.0,
        height: 200.0,
        color: Colors.deepPurpleAccent,
        //TextAlign.justify(两端对齐)TextAlign.center
        //文本方向textDirection
        //textScaleFactor字体显示倍率
        child: new Text(
          "习近平向2018中国国际大数据产业博览会致贺信",
//          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          softWrap: true,
          //是否自动换行，若为false，文字将不考虑容器大小，单行显示，超出屏幕部分将默认截断处理
          overflow: TextOverflow.ellipsis,
          //TextOverflow.fade(渐隐)ellipsis省略号
          maxLines: 1,
          style: new TextStyle(
            color: Colors.red,
            fontSize: 30.0,
          ),
        ),
      ),*/
      body: new Container(
          width: 400.0,
          height: 200.0,
          color: Colors.greenAccent,
          child: new Text.rich(
            new TextSpan(
              text: "one",
              style: new TextStyle(
                fontSize: 40.0,
                color: Colors.green,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
              ),
              children: [
                new TextSpan(
                  text: "TWO",
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                  recognizer: new TapGestureRecognizer()
                    ..onTap =
                        () => Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text("TWO is tapped"),
                            )),
                ),
                new TextSpan(
                  text: "THREE",
                  recognizer: new LongPressGestureRecognizer()
                    ..onLongPress =
                        () => Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text("THREE is longpressed"),
                            )),
                ),
                new TextSpan(
                    text: "four",
                    style: new TextStyle(
                      fontSize: 40.0,
                      color: Colors.green,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.yellowAccent,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        var alert = new AlertDialog(
                          title: new Text("Title"),
                          content: new Text("four is tapped"),
                        );
                        showDialog(context: context, child: alert);
                      })
              ],
              recognizer: new TapGestureRecognizer()
                ..onTap = () => Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("one is tapped"),
                    )),
            ),
          )),
    );
  }
}
