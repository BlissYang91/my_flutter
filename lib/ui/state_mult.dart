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

//父组件管理子组件部分状态
class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState()=>_ParentWidgetState();

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
      child: TapboxC(active:_active,onChanged: _handleTapboxChanged),
    );
  }

}
// 子组件也管理部分自身状态 继承StatefulWidget
class TapboxC extends StatefulWidget{
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key,this.active:false,@required this.onChanged}):super(key:key);

  @override
  _TapboxCState createState()=> _TapboxCState();

}
class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;
//自己处理状态改变
  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }
//自己处理状态改变
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }
  //自己处理状态改变
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }
  //将自己的状态回调给父类进行处理
  void _handleTap(){
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ?'active':'inactive',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
        border:_highlight?Border.all(color: Colors.teal[700],width: 10.0):null,
      ),
      ),
    );
  }

}

