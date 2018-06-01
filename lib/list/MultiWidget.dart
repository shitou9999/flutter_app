import 'package:flutter/material.dart';

class MultiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("MultiListView使用"),
        ),
        body: new GenerateList(
            items: new List<ListItem>.generate(
          1000,
          (i) => i % 6 == 0
              ? new HeadingItem("Heading $i")
              : new MessageItem("Sender $i", "Message body $i"),
        )));
  }
}

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class GenerateList extends StatelessWidget {
  final List<ListItem> items;

  GenerateList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
    return new Scaffold(
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is HeadingItem) {
              return new ListTile(
                title: new Text(
                  item.heading,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            } else if (item is MessageItem) {
              return new ListTile(
                title: new Text(item.sender),
                subtitle: new Text(item.body),
              );
            }
          }),
    );
  }
}
