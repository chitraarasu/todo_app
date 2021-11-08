import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends ChangeNotifier {
  List<String> _tasks = [];
  late final List<String>? prevlist;

  get length => _tasks.length;

  UnmodifiableListView<String> get tasks {
    return UnmodifiableListView(_tasks);
  }

  getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prevlist = prefs.getStringList('todolist');
    if (prevlist == null) {
      _tasks = [
        'Welcome to the todo list!',
        'Scroll right to edit item -->',
        '<-- Scroll left to delete the item',
      ];
    } else {
      _tasks = prevlist!;
    }
    notifyListeners();
  }

  AddNewTask(String newTask) async {
    _tasks.add(
      '$newTask',
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todolist', _tasks);
    notifyListeners();
  }

  editNewTask(String editTask, String eT) async {
    var index = _tasks.indexOf(eT);
    _tasks.replaceRange(index, index + 1, [editTask]);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todolist', _tasks);
    notifyListeners();
  }

  DeleteTask(int index) async {
    _tasks.removeAt(index);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todolist', _tasks);
    notifyListeners();
  }
}
