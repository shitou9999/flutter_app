import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

///异步UI
///runOnUiThread 在Flutter中等价于什么
///Dart代码将在主UI线程中运行，并由事件循环驱动!!!!!!!!
class NetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("获取网络数据ListView显示"),
      ),
//      body: new SampleAppPage(),
      body: new SampleIsolatePage(),
    );
  }
//Navigator
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}
///Dart是单线程执行模型，支持Isolates（在另一个线程上运行Dart代码的方式）、事件循环和异步编程。
/// 除非您启动一个Isolate，否则您的Dart代码将在主UI线程中运行，并由事件循环驱动（译者语：和JavaScript一样）。
class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}"));
  }

  ///您可以在UI线程上运行网络请求代码而不会导致UI挂起(译者语：因为网络请求是异步的)
  ///要异步运行代码---->可以将函数声明为异步函数，并在该函数中等待这个耗时任务!!!!!!!!!!
  ///这就是典型的进行网络或数据库调用的方式
  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    ///要更新UI，您可以调用setState，这会触发build方法再次运行并更新数据
    setState(() {
      widgets = JSON.decode(response.body);
    });
  }
}

///////////简单的Isolate的例子,以及如何与主线程通信和共享数据以更新UI///////////
///但是，有时您可能需要处理大量数据，导致UI可能会挂起。
///在这种情况下，与AsyncTask一样，在Flutter中，可以利用多个CPU内核来执行耗时或计算密集型任务。这是通过使用Isolates来完成的。
///是一个独立的执行线程，它运行时不会与主线程共享任何内存。这意味着你不能从该线程访问变量或通过调用setState来更新你的UI。
class SampleIsolatePage extends StatefulWidget {
  SampleIsolatePage({Key key}) : super(key: key);

  @override
  _SampleIsolatePageState createState() => new _SampleIsolatePageState();
}

class _SampleIsolatePageState extends State<SampleIsolatePage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }
  // 通过布尔值通知Flutter在耗时任务发起之前更新其状态。
  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends it's SendPort as the first message
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });
  }
///“dataLoader”是在它自己的独立执行线程中运行的隔离区，您可以在其中执行CPU密集型任务，
/// 例如解析大于1万的JSON或执行计算密集型数学计算。
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = new ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(JSON.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

}
