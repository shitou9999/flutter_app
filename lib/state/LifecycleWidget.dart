import 'package:flutter/material.dart';

class LifecycleWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('生命周期监听'),
        ),
        body: new LifecycleWatcher(),
      );
  }

}

class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => new _LifecycleWatcherState();
}
/// 在Flutter中您可以通过挂接到WidgetsBinding
/// 观察并监听didChangeAppLifecycleState更改事件来监听生命周期事件
class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecyleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  ///resumed - 应用程序可见并响应用户输入。这是来自Android的onResume
  ///inactive - 应用程序处于非活动状态，并且未接收用户输入。此事件在Android上未使用，仅适用于iOS
  ///paused - 应用程序当前对用户不可见，不响应用户输入，并在后台运行。这是来自Android的暂停
  ///suspending - 该应用程序将暂时中止。这在iOS上未使用
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecyleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lastLifecyleState == null)
      return new Text('这个小部件没有观察到任何生命周期的变化', textDirection: TextDirection.ltr);
    return new Text('这个小部件观察到的最近的生命周期状态是: $_lastLifecyleState.',
        textDirection: TextDirection.ltr);
  }
}