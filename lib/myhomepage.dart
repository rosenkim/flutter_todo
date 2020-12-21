import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/todocontroller.dart';
import 'package:get/get.dart';
import 'package:flutter_todo/todolist.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final TodoList todoListWidget = TodoList();

  MyHomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    final TodoController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: todoListWidget,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          c.appendItem();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
