import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_todo/controller/todocontroller.dart';

class TodoList extends StatelessWidget {
  // https://stackoverflow.com/questions/55777213/flutter-how-to-use-confirmdismiss-in-dismissible
  // 를 참고하여 아래 함수 및 Dismissible의 confirmDismiss 이벤트를 구현
  Future<bool> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to $action this?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TodoController c = Get.find();

    return GetBuilder<TodoController>(
        builder: (controller) => ListView.builder(
            itemCount: c.todoItems.length,
            itemBuilder: (context, index) {
              var item = c.todoItems[index];
              var textStyle = item.isDone
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : null;

              return Dismissible(
                  key: Key(item.key),
                  confirmDismiss: (DismissDirection direction) async {
                    switch (direction) {
                      case DismissDirection.endToStart:
                        break;
                      case DismissDirection.startToEnd:
                        return await _showConfirmationDialog(
                                context, 'Delete') ==
                            true;
                      case DismissDirection.horizontal:
                      case DismissDirection.vertical:
                      case DismissDirection.up:
                      case DismissDirection.down:
                        assert(false);
                        break;

                      case DismissDirection.none:
                        // 아무것도 하지 않음.
                        break;
                    }
                    return false;
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    color: Colors.redAccent,
                    alignment: Alignment.centerLeft,
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      if (item != null) {
                        c.todoItems.remove(item);
                        c.update();
                      }
                    }
                  },
                  child: ListTile(
                      title: Text('$index : ${item.memo}', style: textStyle),
                      subtitle: Text('${item.datetime}', style: textStyle),
                      onTap: () {
                        item.isDone = !item.isDone;
                        c.update();
                      }));
            }));
  }
}
