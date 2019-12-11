import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget{
  final int  count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('count:$count');
  }

}

class CounterIncrementor extends StatelessWidget{
  final VoidCallback onPressed;
  CounterIncrementor({this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}


class Counter extends StatefulWidget{
  @override
  _CounterState createState() {
    // TODO: implement createState
    return _CounterState();
  }

}

class _CounterState extends State<Counter>{
  int _counter = 0;
  void _increment(){
    setState(() {
      ++_counter;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        CounterIncrementor(onPressed: _increment),
        CounterDisplay(count: _counter,)
      ],
    );
  }

}
