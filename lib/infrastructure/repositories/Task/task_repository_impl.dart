import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task_management_app/domain/models/Task/repository/task_repository.dart';
import 'package:task_management_app/domain/models/Task/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      final String token = dotenv.env['API_TOKEN'] ?? '';
      final String apiUrl = dotenv.env['API_URL'] ?? '';

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
}
