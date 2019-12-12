import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MaterialApp(
    title: 'RouteSettings携参数跳转',
    home: TodosScreen(
        todos: List.generate(
            20,
            (i) => Todo('Todo $i',
                'A description of what needs to be done for Todo $i'))),
  ));
}

// 数据类（要携带的数据）
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                      //通过RouteSettings传递参数
                      settings: RouteSettings(
                        arguments: todos[index]
                      )
                    ));
              },
            );
          }),
    );
  }
}

//构造函数接受传递过来的参数
class DetailScreen extends StatelessWidget {

//  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //通过ModalRoute取参数
    final Todo todo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
