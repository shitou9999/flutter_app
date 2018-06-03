import 'package:flutter/material.dart';

class StateWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("State使用"),
      ),
      body:new FavoriteWidget(),
    );
  }
//Navigator
}


class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;///已经选中
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        ///将文本放在SizedBox中并设置其宽度可防止出现明显的“跳跃”，因为这些值具有不同的宽度。
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
