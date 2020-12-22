import 'package:flutter/cupertino.dart';

class TodoItem {
  TodoItem() {
    _key = UniqueKey().toString();
  }

  String _key; // 키
  String get key {
    return _key;
  }

  String memo; // 메모
  DateTime datetime; // 날짜
  bool isDone; // 완료
}
