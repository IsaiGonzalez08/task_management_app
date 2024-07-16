import 'package:task_management_app/domain/models/Task/repository/task_repository.dart';
import 'package:task_management_app/domain/models/Task/task.dart';

class GetAllTasksUseCase {
  final TaskRepository _taskRepository;
  GetAllTasksUseCase(this._taskRepository);

  Future<List<TaskModel>> getAllTasks() async {
     return await _taskRepository.getAllTasks();
  } 
}

class GetTaskByIdUseCase {
  final TaskRepository _taskRepository;
  GetTaskByIdUseCase(this._taskRepository);

  Future<TaskModel> getTaskById(int id) async {
     return await _taskRepository.getTaskById(id);
  } 
}

class CreateTaskUseCase {
  final TaskRepository _taskRepository;
  CreateTaskUseCase(this._taskRepository);

  Future<void> createTask(String title, int isComplete, String date,
      String comments, String description, String tags) async {
     await _taskRepository.createTask(title, isComplete, date, comments, description, tags);
  } 
}