import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//组件状态管理(自己管理自己的状态)
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
          child: TapboxA(),
        )
      ),
    );
  }

}

//组件自己管理自己状态
class TapboxA extends StatefulWidget{

  TapboxA({Key key}) :super(key:key);

  @override
  _TapboxAState createState()=>_TapboxAState();

}
//子类中更改状态
class _TapboxAState extends State<TapboxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active?'Active':'Inactive',
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }

}