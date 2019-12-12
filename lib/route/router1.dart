import 'package:flutter/material.dart';

//跳转并带参数返回
void main() {
  runApp(MaterialApp(
    title: '带参数返回路由',
    home: HomeScreen(),
  ));
}
//第一屏页面
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning with data'),
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    //用result接受第二屏的返回值
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
    //级联操作符 (..) 可以在同一个对象上 连续调用多个函数以及访问成员变量。 使用级联操作符可以避免创建 临时变量
    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result"),));
  }
}

//第二屏页面
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Yep"
                  Navigator.pop(context,'Yep!');
                },
                child: Text('Yep'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Noep"
                  Navigator.pop(context,'Noep!');
                }, child: Text('Noep'),),
            ),
          ],
        ),
      ),
    );
  }
}
