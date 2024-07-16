import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task_management_app/domain/models/Task/repository/task_repository.dart';
import 'package:task_management_app/domain/models/Task/task.dart';

class TaskRepositoryImpl implements TaskRepository {

  final String token = dotenv.env['API_TOKEN'] ?? '';
  final String apiUrl = dotenv.env['API_URL'] ?? '';

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      final Uri uri = Uri.parse('$apiUrl/tasks').replace(queryParameters: {
        'token': token,
      });

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> decodedResponse = json.decode(response.body);
        final List<TaskModel> tasks =
            decodedResponse.map((json) => TaskModel.fromJson(json)).toList();
        return tasks;
      } else {
        throw Exception('Error con el servidor: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error con el servidor: $error');
    }
  }

  @override
  Future<TaskModel> getTaskById(int id) async {
    try {
      final Uri uri = Uri.parse('$apiUrl/tasks/$id').replace(queryParameters: {
        'token': token,
      });
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> decodedResponse = json.decode(response.body);
        if (decodedResponse.isEmpty) {
          throw Exception(
              'No se encontró ninguna tarea con el ID proporcionado');
        }
        final TaskModel task = TaskModel.fromJson(decodedResponse.first);
        return task;
      } else {
        throw Exception('Error con el servidor: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error con el servidor: $error');
    }
  }

  @override
  Future<void> createTask(String title, int isComplete, String date,
      String comments, String description, String tags) async {
    try {
      final Uri uri = Uri.parse('$apiUrl/tasks');
      final Map<String, dynamic> params = {
        'token': token,
        'title': title,
        'is_completed': isComplete.toString(),
        'due_date': date,
        'comments': comments,
        'description': description,
        'tags': tags,
      };
      final response = await http.post(
        uri.replace(queryParameters: params),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 201) {
        print('Tarea creada con éxito');
      } else {
        throw Exception('Error con el servidor: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error con el servidor: $error');
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      final Uri uri = Uri.parse('$apiUrl/tasks/$id');
      final Map<String, dynamic> params = {
        'token': token,
        'task_id': id.toString(),
      };
      final response = await http.delete(
        uri.replace(queryParameters: params),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 201) {
        print('Tarea eliminada con éxito');
      } else {
        throw Exception('Error con el servidor: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error con el servidor: $error');
    }
  }

  @override
  Future<void> updateTask(int id, String title, int isComplete, String date,
      String comments, String description, String tags) async {
    try {
      final Uri uri = Uri.parse('$apiUrl/tasks/$id');
      final Map<String, dynamic> params = {
        'token': token,
        'title': title,
        'is_completed': isComplete.toString(),
        'due_date': date,
        'comments': comments,
        'description': description,
        'tags': tags,
      };
      final response = await http.put(
        uri.replace(queryParameters: params),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      if (response.statusCode == 201) {
        print('Tarea actualizada con éxito');
      } else {
        throw Exception('Error con el servidor: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error con el servidor: $error');
    }
  }
}
