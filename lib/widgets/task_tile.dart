import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  Function checkBoxCallBack;
  Function checkBoxDelete;

  TaskTile({
    required this.taskTitle,
    required this.checkBoxCallBack,
    required this.checkBoxDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
        ),
        trailing: TextButton(
          onPressed: () {
            checkBoxDelete();
          },
          child: Icon(
            Icons.delete,
            color: Colors.lightBlueAccent,
          ),
        ));
  }
}
