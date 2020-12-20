import 'package:flutter/material.dart';

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
  List<int> items = [];

  void appendItem() {
    setState(() {
      items.add(items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$index'),
          subtitle: Text('item is ${items[index]}'),
        );
      },
    );
  }
}
