import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/todocontroller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodoDialog extends StatefulWidget {
  TodoDialog({Key key}) : super(key: key);

  @override
  _TodoDialogState createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  TextEditingController _memoTextEditController =
      TextEditingController(text: "Todo memo");
  DateTime _dateTimePicked;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mm");

    TodoController c = Get.find();

    return SimpleDialog(
      titlePadding: EdgeInsets.all(12.0),
      title: Text("Todo", textAlign: TextAlign.center),
      contentPadding: EdgeInsets.all(12.0),
      children: <Widget>[
        Text("Memo"),
        TextField(controller: _memoTextEditController),
        Padding(padding: EdgeInsets.all(4.0)),
        Text("Date and time"),
        DateTimeField(
          format: format,
          initialValue: DateTime.now(),
          resetIcon: null,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));

            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );

              _dateTimePicked = DateTimeField.combine(date, time);
              return _dateTimePicked;
            } else {
              return currentValue;
            }
          },
        ),
        Padding(padding: EdgeInsets.all(4.0)),
        RaisedButton(
          child: Text("Submit"),
          onPressed: () {
            c.appendItem(_memoTextEditController.text, DateTime.now());
            Navigator.of(context).pop(); // 다이얼로그를 닫음.
          },
        )
      ],
    );
  }
}
