import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpWidget extends StatelessWidget {
  /// new FutureBuilder<String>(
  ///   future: _calculation, // a Future<String> or null
  ///   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
  ///     switch (snapshot.connectionState) {
  ///       case ConnectionState.none: return new Text('Press button to start');
  ///       case ConnectionState.waiting: return new Text('Awaiting result...');
  ///       default:
  ///         if (snapshot.hasError)
  ///           return new Text('Error: ${snapshot.error}');
  ///         else
  ///           return new Text('Result: ${snapshot.data}');
  ///     }
  ///   },
  /// )
  ///
  // Map data = JSON.decode(responseBody);
// Assume the response body is something like: ['foo', { 'bar': 499 }]
  //int barValue = data[1]['bar']; // barValue is set to 499
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Http获取数据"),
      ),
      body: new Center(
        child: new FutureBuilder<Post>(
          ///future参数是一个异步的网络请求,调用fetchPost()函数的返回值(一个future)
          future: fetchPost(),
          ///一个 builder 函数，这告诉Flutter在future执行的不同阶段应该如何渲染界面
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

//var url = "http://example.com/whatsit/create";
//http.post(url, body: {"name": "doodle", "color": "blue"})
//.then((response) {
//print("Response status: ${response.statusCode}");
//print("Response body: ${response.body}");
//});
//
//http.read("http://example.com/foobar.txt").then(print);
///3. 将响应转换为自定义Dart对象
///01创建一个Post类
///我们需要创建一个Post类，它包含我们网络请求的数据。
/// 它还将包括一个工厂构造函数，它允许我们可以通过json创建一个Post对象。
/// 手动转换JSON只是一种选择。
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

//  Future<http.Response> fetchPost() {
//    return http.get('https://jsonplaceholder.typicode.com/posts/1');
//  }

///将http.Response 转换成一个Post对象
//1.使用dart:convert package将响应内容转化为一个json Map。
//2.使用fromJson工厂函数，将json Map 转化为一个Post对象
Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final jsons = json.decode(response.body);
  return new Post.fromJson(jsons);
}
