import 'package:get/get.dart';
import 'package:flutter_todo/model/todoitem.dart';

class TodoController extends GetxController {
  var todoItems = [];

  TodoItem appendItem() {
    var item = TodoItem();
    item.datetime = DateTime.now();
    item.title = "Title";
    item.memo = "Memo";
    item.isDone = false;

    todoItems.add(item);
    update();

    return item;
  }
}
