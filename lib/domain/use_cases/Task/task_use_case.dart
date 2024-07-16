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