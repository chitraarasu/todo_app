import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoey/screens/edit_task_tree.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  Function checkBoxDelete;

  TaskTile({
    required this.taskTitle,
    required this.checkBoxDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => editTaskTree(taskTitle),
            );
          },
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () {
            checkBoxDelete();
            final snackBar = SnackBar(
              content: Text("$taskTitle removed successfully"),
              duration: Duration(milliseconds: 500),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: Icons.delete,
        )
      ],
      child: ListTile(
        title: Text(
          taskTitle,
        ),
        trailing: PopupMenuButton<String>(
          padding: EdgeInsets.zero,
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => editTaskTree(taskTitle),
                  );
                },
                leading: const Icon(Icons.mode_edit),
                title: Text("Edit"),
              ),
            ),
            PopupMenuItem<String>(
              child: ListTile(
                onTap: () {
                  final snackBar = SnackBar(
                    content: Text("Text copied"),
                    duration: Duration(milliseconds: 500),
                  );
                  Clipboard.setData(ClipboardData(text: taskTitle)).then(
                      (value) =>
                          ScaffoldMessenger.of(context).showSnackBar(snackBar));
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.content_copy),
                title: Text("Copy"),
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              child: ListTile(
                onTap: () {
                  checkBoxDelete();
                  final snackBar = SnackBar(
                    content: Text("$taskTitle removed successfully"),
                    duration: Duration(milliseconds: 500),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.delete),
                title: Text("Remove"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
