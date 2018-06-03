import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class WebSocketWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("WebSocket使用"),
      ),
      body:new WebSocketPage(
        title: 'WebSocket',
        ///1.创建一个WebSocketChannel连接到一台服务器
        channel: new IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
    );
  }
//Navigator
}

///WebSocketChannel允许我们既可以监听来自服务器的消息，又可以将消息发送到服务器的方法
///
class WebSocketPage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  WebSocketPage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _WebSocketPageState createState() => new _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            ///2. 监听来自服务器的消息并显示它们
            new StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(snapshot.hasData ? '${snapshot.data}' : '2222'),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ),
    );
  }

  ///3.将数据发送到服务器
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    ///4. 关闭WebSocket连接
    widget.channel.sink.close();
    super.dispose();
  }
}