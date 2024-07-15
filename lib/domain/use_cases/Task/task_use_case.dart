import 'package:task_management_app/domain/models/Task/repository/task_repository.dart';
import 'package:task_management_app/domain/models/Task/task.dart';

class GetAllTasksUseCase {
  final TaskRepository _taskRepository;
  GetAllTasksUseCase(this._taskRepository);

  Future<List<TaskModel>> getAllTasks() async {
     return await _taskRepository.getAllTasks();
  } 
}