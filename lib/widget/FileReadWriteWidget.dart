import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileReadWriteWidget extends StatelessWidget {
  ///PathProvider 插件提供了一种平台透明的方式来访问设备文件系统上的常用位置。
  /// 该类当前支持访问两个文件系统位置：

  ///临时目录: 系统可随时清除的临时目录（缓存）。
  //在iOS上，这对应于NSTemporaryDirectory() 返回的值。在Android上，这是getCacheDir()返回的值。
  ///文档目录: 应用程序的目录，用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。
  //在iOS上，这对应于NSDocumentDirectory。在Android上，这是AppData目录。
  //一旦你的Flutter应用程序有一个文件位置的引用，你可以使用dart:ioAPI来执行对文件系统的读/写操作。
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text使用"),
      ),
      body: new FlutterDemo(),
//      body: new Row(
//        children:<Widget>[new Text('')],
//      ),
    );
  }
}

class FlutterDemo extends StatefulWidget {
  FlutterDemo({Key key}) : super(key: key);

  @override
  _FlutterDemoState createState() => new _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  ///获取文件
  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    print("****文件夹路径" + dir); ////data/user/0/com.uc.flutterapp/app_flutter
    File file = new File('$dir/counter.txt');
    print("****File文件路径" + file.path);////data/user/0/com.uc.flutterapp/app_flutter/counter.txt
    return file;
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // write the variable as a string to the file
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('按钮点击的次数: $_counter time${
            _counter == 1 ? '' : 's'
        }.'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
