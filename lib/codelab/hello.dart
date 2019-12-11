import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Weclcome to Flutter",
      home: Scaffold(
        appBar: new AppBar(
          title: const Text("Welcome to Flutter again"),
        ),
        body: const Center(
          child: const Text("Hello World"),
        ),
      ),
    );
  }

}