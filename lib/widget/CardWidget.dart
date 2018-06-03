import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget{
//  实现了一个 Material Design card
//  接受单个孩子，但该孩子可以是Row，Column或其他包含子级列表的widget
//  显示圆角和阴影
//  Card内容不能滚动
//  Material Components 库的一个widget
///默认情况下，Card将其大小缩小为0像素。您可以使用SizedBox来限制Card的大小。
  ///Card具有圆角和阴影，这使它有一个3D效果。更改Card的eelevation属性允许您控制投影效果。
  ///如果指定不支持的值将会完全禁用投影 。
  @override
  Widget build(BuildContext context) {
    var card = new SizedBox(
      height: 230.0,
      child: new Card(
        child: new Column(
          children: [
            new ListTile(
              title: new Text('1625 Main Street',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('My City, CA 99984'),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
      body:card,
    );
  }
//Navigator
}