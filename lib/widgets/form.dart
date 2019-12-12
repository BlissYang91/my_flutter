import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }

}

class MyStatefulWidget extends StatefulWidget{
  MyStatefulWidget({Key key}):super(key:key);

  @override
  _MyStatefulWidgetState createState()=>_MyStatefulWidgetState();

}
class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){

                      }
                    },
                  child: Text('summit'),
                ),
            )
          ],

        ),
    );
  }

}