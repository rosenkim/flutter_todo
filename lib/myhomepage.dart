import 'package:flutter/material.dart';
import 'package:flutter_todo/tododialog.dart';
import 'package:flutter_todo/todolist.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final TodoList todoListWidget = TodoList();

  MyHomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: todoListWidget,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              builder: (context) {
                return TodoDialog();
              },
              context: context);
          //c.appendItem();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
