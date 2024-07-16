import 'package:task_management_app/domain/models/Task/task.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel> getTaskById(int id);
}
