import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/example/SearchPage.dart';
import 'package:flutter_app/example/modle/AirResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API.dart' as API;

class AirPort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //如果平台上不支持特定的样式，那么选择它
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: AQIView(),
      routes: <String, WidgetBuilder>{
        '/searchPage': (BuildContext context) => SearchPage(),
      },
    );
  }
}

class AQIView extends StatefulWidget {
  @override
  _AQIViewState createState() => new _AQIViewState();
}

class _AQIViewState extends State<AQIView> {
  final String mAirResponse = "AirResponse";
  var aqi = 0;
  var place = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    getFromLocal().then((airResponse) {
      if (airResponse != null) {
        setState(() {
          aqi = airResponse.data.aqi;
          place = airResponse.data.city.name;
        });
      }
    });
    Future response = API.getAirReprot();
    response.then((response) {
      ///JSON.decode()仅返回一个Map<String, dynamic>，这意味着我们直到运行时才知道值的类型。
      final responseJson = json.decode(response.body);
      final airResponse = new AirResponse.fromJson(responseJson);
      saveToLocal(airResponse);
      setState(() {
        aqi = airResponse.data.aqi;
        place = airResponse.data.city.name;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  Color _getColor(int aqi) {
    Color color = Color.fromARGB(255, 43, 153, 102);
    if (aqi > 300) {
      color = Color.fromARGB(255, 126, 2, 35);
    } else if (aqi > 201) {
      color = Color.fromARGB(255, 102, 0, 153);
    } else if (aqi > 150) {
      color = Color.fromARGB(255, 203, 5, 50);
    } else if (aqi > 100) {
      color = Color.fromARGB(255, 248, 153, 52);
    } else if (aqi > 50) {
      color = Color.fromARGB(255, 251, 222, 50);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _getColor(aqi),
        body: Stack(
          alignment: const Alignment(0.0, 0.8),
          children: <Widget>[
            new Center(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    place,
                    style: new TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    aqi.toString(),
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Future future = Navigator.of(context).pushNamed("/searchPage");
                future.then((value) {
                  API.setCityUid(value);
                  getData();
                });
              },
              iconSize: 50.0,
              color: Color.fromARGB(125, 255, 255, 255),
            )
          ],
        ));
  }


  void saveToLocal(AirResponse airResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ///String json = JSON.encode(user);
    String jsonStr = json.encode(airResponse);
    prefs.setString(mAirResponse, jsonStr); //存json
  }


  Future<AirResponse> getFromLocal() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final jsonStr = preferences.getString(mAirResponse);
    if (jsonStr == null) {
      return null;
    }
    return AirResponse.fromJson(json.decode(jsonStr));
  }


}
