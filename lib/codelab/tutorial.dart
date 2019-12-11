import 'package:bliss/codelab/counter.dart' as prefix0;
import 'package:flutter/material.dart';
//import 'package:bliss/codelab/state.dart';//引入外部自定义组件
import 'package:bliss/codelab/counter.dart';
void main(){
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}
class TutorialHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu
          ),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: Center(
//        child: Text('Hello World'),
//        child: MyButton(),
          child: Counter(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "add",
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }

}
class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: Center(
          child: Text("Engage"),
        ),

      ),
    );
  }

}