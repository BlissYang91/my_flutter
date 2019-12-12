import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '命名路由',
    //当使用 initialRoute 时，需要确保你没有同时定义 home 属性
    initialRoute: '/',
    routes: {
      // 当我们跳转到“/”时，构建 FirstScreen
      '/':(context) => FirstScreen(),
      // 当我们跳转到“/second”时，构建 SecondScreen
      '/second':(context) =>SecondScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
//          点击时跳转到第二个界面
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Launch screen'),),
      ),
    );
  }

}
class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          // 点击时跳转回第一个界面！
          Navigator.pop(context);
        },child: Text('Go back!'),),
      ),
    );
  }
  
}