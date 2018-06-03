import 'package:flutter/material.dart';
///标准 widgets:
///Form
///FormField
///Material Components:
///Checkbox
///DropdownButton
///FlatButton
///FloatingActionButton
///IconButton
///Radio
///RaisedButton
///Slider
///Switch
///TextField
class MixtureManagerState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('混合管理状态'),
      ),
      body: new ParentWidget(),
    );
  }
}
//如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父widget管理
//如果所讨论的状态是有关界面外观效果的，例如动画，那么状态最好由widget本身来管理.
///如果一个widget发生了变化（例如用户与它交互），它就是有状态的。
/// 但是，如果一个子widget对变化做出反应，而其父widget对变化没有反应，
/// 那么包含的父widget仍然可以是无状态的widget。
/////////////////////////混合管理状态////////////////////////////////
class ParentWidget extends StatefulWidget {
  //state对象可以跨帧存储状态数据并恢复它
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
//  管理_active 状态.
//  实现 _handleTapboxChanged(), 当盒子被点击时调用.
//  当点击盒子并且_active状态改变时调用setState()更新UI
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

/////////////////////////混合管理状态////////////////////////////////

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
//  管理_highlight state.
//  GestureDetector监听所有tap事件。当用户点下时，它添加高亮（深绿色边框）；当用户释放时，会移除高亮。
//  当按下、抬起、或者取消点击时更新_highlight状态，调用setState()更新UI。
//  当点击时，将状态的改变传递给父widget.
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
