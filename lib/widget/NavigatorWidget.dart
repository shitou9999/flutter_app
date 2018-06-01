import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return new FirstScreen();
    return new TodosScreen(
        todos:
            new List.generate(10, (i) => new Todo('我是待办事项$i', '我是代办事项$i的详情')));
  }
}

//请记住：页面只是Widgets™
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FirstScreen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new SecondScreen()));
          },
          child: new Text('开启新页面！！'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SecondScreen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('返回！！！'),
        ),
      ),
    );
  }
}

//测试页面传值
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('todo列表'),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return new ListTile(
                title: new Text(todos[index].title),
                leading: new Icon(Icons.add_shopping_cart),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            new DetailScreen(todo: todos[index]),
                      ));
                });
          }),
    );
  }
}
//详情显示页
class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我是详情页'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${todo.description}'),
      ),
    );
  }
}
