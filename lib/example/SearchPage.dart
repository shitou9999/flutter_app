import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/example/modle/Place.dart';
import 'package:flutter_app/example/modle/PlaceResponse.dart';
import 'API.dart' as API;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Place> citys = [];

  ///手动JSON序列化是指使使用dart:convert中内置的JSON解码器。
  /// 它将原始JSON字符串传递给JSON.decode() 方法，然后在返回的Map<String, dynamic>中查找所需的值。
  getCitys(String str) {
    API.getCities(str).then((response) {
      final responseJson = json.decode(response.body);
      final laceResponse = new PlaceResponse.fromJson(responseJson);
      setState(() {
        citys = laceResponse.data;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('搜索'),
          elevation: 1.0,
        ),
        body: new Stack(
          alignment: const Alignment(0.0, -1.0),
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: '************',
                  ),
                  onChanged: (str) {
                    getCitys(str);
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: ListView.builder(
                itemCount: citys.length,
                itemBuilder: (context, index) => EntryItem(citys[index]),
              ),
            )
          ],
        ));
  }
}

class EntryItem extends StatelessWidget {
  final Place place;

  const EntryItem(this.place);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(place.uid);
      },
      child: ListTile(
        title: new Text(place.station.name),
      ),
    );
  }
}
