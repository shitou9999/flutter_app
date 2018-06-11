

///new Text(Strings.welcomeMessage)
class Strings{
  static String welcomeMessage = "访问全局的字符串";
}

///实时模板----还可以在 Settings > Editor > Live Templates 中自定义模板。
///Flutter插件包含以下模板:

//前缀stless: 创建一个StatelessWidget的子类.
//前缀stful: 创建一个StatefulWidget子类并且关联到一个State子类.
//前缀stanim: 创建一个StatefulWidget子类, 并且它关联的State子类包括一个 AnimationController


///‘热重载’ vs ‘完全重启’
//热重载通过将更新的源代码文件注入正在运行的Dart VM（虚拟机）中工作。
// 这不仅包括添加新类，还包括向现有类添加方法和字段以及更改现有函数。
// 尽管有几种类型的代码更改无法热重载：
//
//全局变量初始化器.
//静态字段初始化器.
//app的main()方法.
//对于这些更改，您可以完全重新启动应用程序，而无需结束调试会话：
//
//不要点击停止按钮; 只需重新单击运行按钮（如果在运行会话中）或调试按钮
// （如果在调试会话中），或者按住Shift键并单击“热重载”按钮


//import 'dart:developer';到相关文件顶部。
//debugger()语句插入编程式断点
//debugger(when: offset > 30.0);
//debugger()语句采用一个可选when参数，您可以指定该参数仅在特定条件为真时中断

//print、debugPrint、flutter logs
//如果你一次输出太多，那么Android有时会丢弃一些日志行。为了避免这种情况，您可以使用Flutter的foundation库中的debugPrint()。
// 这是一个封装print，它将输出限制在一个级别，避免被Android内核丢弃。

//一个中间模式可以关闭除Observatory之外所有调试辅助工具的，称为“profile mode”，用--profile替代--release即可
//要关闭调试模式并使用发布模式，请使用flutter run --release运行您的应用程序

//*************Widget 层*************
//正如debugDumpApp()，除布局或绘制阶段外，您可以随时调用此函数
//要转储Widgets库的状态，请调用debugDumpApp()。 只要应用程序已经构建了至少一次
// （即在调用build()之后的任何时间），您可以在应用程序未处于构建阶段
// （即，不在build()方法内调用 ）的任何时间调用此方法（在调用runApp()之后）。

//如果您编写自己的widget，则可以通过覆盖debugFillProperties()来添加信息。
// 将DiagnosticsProperty对象作为方法参数，并调用父类方法。
// 该函数是该toString方法用来填充小部件描述信息的。

//*************调试布局问题*************
//当调试布局问题时，关键是看size和constraints字段。约束沿着树向下传递，尺寸向上传递。!!!
//要调用debugDumpRenderTree()，您需要添加import'package:flutter/rendering.dart';到您的源文件
//当调试布局问题时，关键要看的是size和constraints字段。约束沿着树向下传递，尺寸向上传递。

//*************层*************
//如果您尝试调试合成问题，则可以使用debugDumpLayerTree()

//*************调度*************
//debugPrintScheduleFrameStacks还可以用来打印导致当前帧被调度的调用堆栈
//要找出相对于帧的开始/结束事件发生的位置，可以切换debugPrintBeginFrameBanner和
// debugPrintEndFrameBanner布尔值以将帧的开始和结束打印到控制台

//*************可视化调试*************
//您也可以通过设置debugPaintSizeEnabled为true以可视方式调试布局问题。
// 这是来自rendering库的布尔值。它可以在任何时候启用，并在为true时影响绘制。
// 设置它的最简单方法是在void main()的顶部设置。











