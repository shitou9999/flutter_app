import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/RandomWords.dart';

//这个类保存了 RandomWords widget 的状态!!!!!!!!!
// 这个类将保存随着用户的滑动操作而生成的无限增长的词组，
// 以及保存用户收藏的词组，用户通过触发心形图标来添加或删除收藏的词组列表
class RandomWordsState extends State<RandomWords> {
//_suggestions 变量向 RandomWordsState 类中添加一个数组列表，用来保存推荐词组。
  final _suggestions = <WordPair>[];

//  在 Dart 语言中使用下划线前缀表示强制私有。
  final _biggerFont = const TextStyle(fontSize: 18.0);

//  添加一个 Set 集合 _saved 到 RandomWordsState 类。保存用户收藏的词组。
// Set 集合比 List 更适用于此，因为它不允许重复元素。
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

// itemBuilder 属性，这是一个工厂 builder 并作为匿名函数进行回调
  //它有两个传入参数— BuildContext 上下文和行迭代器 i 。对于每个
  // 推荐词组都会执行一次函数调用，迭代器从 0 开始，每调用一次函数就累加 1
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  //对于每个词组，_buildSuggestions 函数都调用一次 _buildRow 函数。
  Widget _buildRow(WordPair pair) {
    //是否已经添加
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }

// 调用 setState() ，将为 State 对象触发 build() 方法的调用，从而实现对UI的更新

//当用户点击应用栏中的列表图标时，将建立一个新路由并 push 到 Navigator 的
// 路由堆栈中，这个操作将改变界面显示，展示新的路由页面。

//  新页面的内容使用匿名函数在 MaterialPageRoute widget的builder属性中创建。
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
                context: context,
                tiles: tiles,
              )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('点击保存的集合'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}
