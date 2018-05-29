import 'package:flutter/material.dart';

class ColumeWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
      ),
//      body: new Column(
//        children: <Widget>[
//          new Text('Deliver features faster'),
//          new Text('Craft beautiful UIs'),
//          new Expanded(
//            child: new FittedBox(
//              fit: BoxFit.contain, // otherwise the logo will be tiny
//              child: const FlutterLogo(),
//            ),
//          ),
//        ],
//      ),
    body:  new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text('We move under cover and we move as one'),
        new Text(
            'Through the night, we have one shot to live another day'),
        new Text('We cannot let a stray gunshot give us away'),
        new Text(
            'We will fight up close, seize the moment and stay in it'),
        new Text(
            'It’s either that or meet the business end of a bayonet'),
        new Text('The code word is ‘Rochambeau,’ dig me?'),
        new Text('Rochambeau!',
            style: DefaultTextStyle
                .of(context)
                .style
                .apply(fontSizeFactor: 1.0)),
      ],
    ),
    );
  }

}