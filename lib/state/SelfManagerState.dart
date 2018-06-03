import 'package:flutter/material.dart';

class SelfManagerState extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('自身管理状态'),
      ),
      body: new TapboxA(),
    );
  }

}
//如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父widget管理
//如果所讨论的状态是有关界面外观效果的，例如动画，那么状态最好由widget本身来管理.

/////////////////////////自身管理状态////////////////////////////////
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;/// _active确定颜色：绿色为true,灰色为false。

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

/////////////////////////自身管理状态////////////////////////////////