import 'package:flutter/material.dart';

/**
 * 页面的跳转和返回
 */
void main(){
  runApp(MaterialApp(
    title: '基本路由',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Open route'),
            onPressed: (){
//              Navigator.push跳转的页面自带返回键
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
            }
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go back'),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
    );
  }
}

