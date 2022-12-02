import 'package:flutter/widgets.dart';
import 'package:todo_app/model/task_model.dart';

class AddTask extends ChangeNotifier {
  List<TaskModel> _tasks = [];
  List<TaskModel> get tasksList => _tasks;

  void addTasks({
    String taskName,
    String duration,
    bool isDone: false,
  }) {
    final addTask = TaskModel(taskName, duration, isDone);
    _tasks.insert(0, addTask);
    notifyListeners();
  }

  void setStatus(index) {
    _tasks[index].isDone = true;
    notifyListeners();
  }
}
