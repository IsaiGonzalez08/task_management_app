import 'package:flutter/material.dart';
import 'package:task_management_app/domain/models/Task/repository/task_repository.dart';
import 'package:task_management_app/domain/models/Task/task.dart';
import 'package:task_management_app/infrastructure/repositories/Task/task_repository_impl.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepositoryImpl();

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getAllBusStops() async {
    _loading = true;
    List<TaskModel> tasks = await _taskRepository.getAllTasks();
    _tasks = tasks;
    _loading = false;
    notifyListeners();
  }
}
