import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{
//  Image()	通用方法，使用ImageProvider实现，如下方法本质上也是使用的这个方法
//  Image.asset	加载资源图片
//  Image.file	加载本地图片文件
//  Image.network	加载网络图片
//  Image.memory	加载Uint8List资源图片

//   final ImageProvider image;, 抽象类，需要自己实现获取图片数据的操作
//  ExactAssetImage
//  AssetImage
//  NetworkImage
//  FileImage
//  MemoryImage

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Text使用"),
        centerTitle: true,
      ),
      body:new ListView(
        children: <Widget>[
          //当引用图片的时候，需要在pubspec.yaml的文件中的flutter下添加assets
          // 资源图片 但是不同的手机有不同的像素比率，这时就需要根据手机的像素比率来加载不同图片
          // 做法很简单，只需要在图片同级目录下创建2.0x/…和3.0/…的目录就可以了
          new Image.asset('images/img001.jpg'),
          new Image.asset('images/img002.jpg'),
          //网络图片
          new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527398023561&di=9be1e7cef0277adc7fa21ef047ec5087&imgtype=0&src=http%3A%2F%2Fpic9.photophoto.cn%2F20081017%2F0034034814668420_b.jpg',
            height: 300.0,
            width: 300.0,
//            fit: BoxFit.fill,//全图显示，显示可能拉伸，充满
//            fit: BoxFit.contain,//全图显示，显示原比例，不需充满
            fit: BoxFit.contain,//显示可能拉伸，可能裁剪，高度充满
            //color和colorBlendMode一般配合使用，BlendMode, 为混合模式的意思
//            color: Colors.pink,
//            colorBlendMode: BlendMode.colorBurn,
            alignment: Alignment.bottomRight,
          ),
          // 本地文件图片
//          new Image.file(new File("/Users/gs/Downloads/1.jpeg")),
          // Uint8List图片
//          new Image.memory(bytes),
          //使用ImageProvider加载图片
//          new Image(image: new NetworkImage(
//              "https://flutter.io/images/homepage/screenshot-2.png"),)
        ],
      ),
    );
  }

}