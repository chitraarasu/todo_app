import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTask;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTask = value;
                },
                onSubmitted: (value) {
                  Provider.of<AddData>(context, listen: false)
                      .AddNewTask(value);
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextButton(
                onPressed: () {
                  Provider.of<AddData>(context, listen: false)
                      .AddNewTask(newTask);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.lightBlueAccent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
