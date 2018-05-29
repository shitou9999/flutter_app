import 'package:flutter/material.dart';
import 'package:flutter_app/shop/ShoppingListItem.dart';

//商品列表widget
class ShoppingList extends StatefulWidget {

  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products; //组件接受值

  @override
  _ShoppingListState createState() => new _ShoppingListState();

}

//状态widget。。。。通常命名State子类时带一个下划线，这表示其是私有的
//如果希望在widget属性更改时收到通知，则可以覆盖didUpdateWidget函数，以便将旧的oldWidget与当前widget进行比较。
class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

//  在StatefulWidget调用createState之后，框架将新的状态对象插入树中，然后调用状态对象的initState。
//  子类化State可以重写initState，以完成仅需要执行一次的工作。
//  例如，您可以重写initState以配置动画或订阅platform services。initState的实现中需要调用super.initState。
  void initState(){
    super.initState();
  }

//  当一个状态对象不再需要时，框架调用状态对象的dispose。 您可以覆盖该dispose方法来执行清理工作。
//  例如，您可以覆盖dispose取消定时器或取消订阅platform services。 dispose典型的实现是直接调用super.dispose。
  void dispose(){
    super.dispose();
  }

  //当父项收到onCartChanged回调时，父项将更新其内部状态，这将触发父项使用新inCart值重建ShoppingListItem新实例。
  //虽然父项ShoppingListItem在重建时创建了一个新实例，但该操作开销很小。仅将差异部分应用于底层RenderObject
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  //事件流是“向上”传递的，而状态流是“向下”传递的！！！！！！！！！！！
//类似于React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物列表'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}


//您可以使用key来控制框架将在widget重建时与哪些其他widget匹配。
//默认情况下，框架根据它们的runtimeType和它们的显示顺序来匹配。
//使用key时，框架要求两个widget具有相同的key和runtimeType。
//Key在构建相同类型widget的多个实例时很有用。例如，ShoppingList构建足够的ShoppingListItem实例以填充其可见区域：
//
//如果没有key，当前构建中的第一个条目将始终与前一个构建中的第一个条目同步，即使在语义上，
//列表中的第一个条目如果滚动出屏幕，那么它将不会再在窗口中可见。
//
//通过给列表中的每个条目分配为“语义” key，无限列表可以更高效，因为框架将同步条目与匹配的语义key并因此具有相似
//（或相同）的可视外观。 此外，语义上同步条目意味着在有状态子widget中，保留的状态将附加到相同的语义条目上，
//而不是附加到相同数字位置上的条目。


//您可以使用全局(GlobalKey)key来唯一标识子widget。全局key在整个widget层次结构中必须是全局唯一的
//这与局部key不同，后者只需要在同级中唯一。由于它们是全局唯一的，因此可以使用全局key来检索与widget关联的状态。







