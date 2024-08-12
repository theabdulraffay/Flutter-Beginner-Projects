import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:state_management_todo_app/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Breads'),
  ];

  int get taskCount => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks =>
      UnmodifiableListView(_tasks); // this list cannot be modified

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
