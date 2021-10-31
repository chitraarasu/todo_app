import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task,
              checkBoxCallBack: (value) {
                // taskData.UpdateTask(task);
              },
              checkBoxDelete: () {
                taskData.DeleteTask(index);
              },
            );
          },
          itemCount: taskData.length,
        );
      },
    );
  }
}
