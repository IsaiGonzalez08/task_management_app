import 'package:flutter/material.dart';
import 'package:task_management_app/domain/models/Task/repository/task_repository.dart';
import 'package:task_management_app/domain/models/Task/task.dart';
import 'package:task_management_app/infrastructure/repositories/Task/task_repository_impl.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepositoryImpl();

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  TaskModel _task = TaskModel(
      id: 0,
      title: '',
      isCompleted: 0,
      date: '',
      comments: '',
      createDate: '',
      description: '',
      tags: '',
      updateDate: '');
  TaskModel get task => _task;

  bool _loading = false;
  bool get loading => _loading;

  bool _loadingInfoTask = false;
  bool get loadingInfoTask => _loadingInfoTask;

  Future<void> getAllTasks() async {
    _loading = true;
    List<TaskModel> tasks = await _taskRepository.getAllTasks();
    _tasks = tasks;
    _loading = false;
    notifyListeners();
  }

  Future<void> getTaskById(int id) async {
    _loadingInfoTask = true;
    TaskModel task = await _taskRepository.getTaskById(id);
    _task = task;
    _loadingInfoTask = false;
    notifyListeners();
  }

  Future<void> createTask(String title, int isComplete, String date,
      String comments, String description, String tags) async {
    await _taskRepository.createTask(
        title, isComplete, date, comments, description, tags);
  }
}
