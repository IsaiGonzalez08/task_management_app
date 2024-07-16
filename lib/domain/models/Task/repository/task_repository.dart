import 'package:task_management_app/domain/models/Task/task.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel> getTaskById(int id);
  Future<void> createTask(String title, int isComplete, String date,
      String comments, String description, String tags);
  Future<void> deleteTask(int id);
}
