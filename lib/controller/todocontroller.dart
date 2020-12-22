import 'package:get/get.dart';
import 'package:flutter_todo/model/todoitem.dart';

class TodoController extends GetxController {
  var todoItems = [];

  TodoItem appendItem(String memo, DateTime datetime) {
    var item = TodoItem();
    item.datetime = datetime;
    item.memo = memo;
    item.isDone = false;

    todoItems.add(item);
    update();

    return item;
  }
}
