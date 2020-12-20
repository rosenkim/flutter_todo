import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todoitem.dart';

class TodoList extends StatefulWidget {
  // State 를 변수로 두고, FloatingActionButton 에서 호출
  final _TodoListState _statefulWidget = _TodoListState();

  @override
  State<StatefulWidget> createState() {
    return _statefulWidget;
  }

  void increament() {
    _statefulWidget.appendItem();
  }
}

class _TodoListState extends State<TodoList> {
  List<TodoItem> items = [];

  void appendItem() {
    setState(() {
      var item = TodoItem();
      item.datetime = DateTime.now();
      item.title = "Title";
      item.memo = "Memo";

      items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return ListTile(
          title: Text('$index : ${item.title}'),
          subtitle: Text('${item.memo}'),
        );
      },
    );
  }
}
