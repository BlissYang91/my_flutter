import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter layout demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter layout demo"),
        ),
        body: Center(
          child: buildRow(),
        ),
      ),
    );
  }

}
Widget buildRow()=>
 Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children: <Widget>[
     Image.asset('images/pic1.jpg'),
     Image.asset('images/pic2.jpg'),
     Image.asset('images/pic3.jpg')
   ],
 );
Widget buildColumn() =>
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic2.jpg'),
        Image.asset('images/pic3.jpg')
      ],
    );
