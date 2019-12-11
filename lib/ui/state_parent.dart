import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

//组件状态管理(父 widget 管理 widget 的 state)
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
          appBar: AppBar(
            title: Text('状态管理'),
          ),
          body: Center(
            child: ParentWidget(),
          )
      ),
    );
  }

}

//管理状态的父组件
class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() => _ParentWidgetState();

}
class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //onChanged回调方法调用的时候执行setstate方法
      child: TapboxB(active:_active,onChanged: _handleTapboxChanged),
    );
  }

}

//子组件，状态由父组件管理，继承StatelessWidget
class TapboxB extends StatelessWidget{
  final bool active;
  final ValueChanged<bool> onChanged;//标记基本值更改的回调方法

  TapboxB({Key key,this.active:false,@required this.onChanged}):super(key:key);

  void _handleTap(){
    //把状态改变的值通过回调方法传给父类去处理setstate方法
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active?'active':'inactive',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }

}
