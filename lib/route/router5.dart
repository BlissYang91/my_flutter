import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //通过 onGenerateRoute() 函数提取参数，然后把参数传递给组件,和routes是两种方式
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments arguments = settings.arguments;

          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
              title: arguments.title,
              message: arguments.message,
            );
          });
        }
        return null;
      },
      title: '给特定路由传参',
      home: HomeScreen(),
      routes: {
        //把组件注册到路由表中
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, ExtractArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      '秦时明月',
                      '沧海横流',
                    ));
              },
              child: Text('Navigate to screen that extracts arguments'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, PassArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                        '九歌·少司命',
                        '悲莫悲兮生别离，乐莫乐兮新相知'
                    )
                );
              },
              child: Text('Navigate to a named that accepts arguments'),
            ),
          ],
        ),
      ),
    );
  }
}

//ModalRoute接受参数
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
//    ModalRoute.of() 方法返回的是当前路由及其携带的参数
    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Center(
        child: Text(arguments.message),
      ),
    );
  }
}

//构造方法接受参数
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  PassArgumentsScreen({Key key, @required this.title, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
