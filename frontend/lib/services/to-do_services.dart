import 'dart:convert';
import 'package:frontend/models/tasks.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/providers/error_provider.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart';

class ToDoApiCalls {
  static Future<void> addTask(String task) async {
    if(task == '') {
      ErrorProvider.errorMessage = 'Empty task provided';
      return;
    }

    Map<String, dynamic> data = {
      "task" : task
    };
    
    try {
      Response response = await post(
        Uri.parse(baseUrl + addTaskEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data)
      );
      if(response.statusCode == 200) {
        ErrorProvider.errorMessage = '';
        CommonControllers.clearControllers();
      } else {
        ErrorProvider.errorMessage = (json.decode(response.body))['message'];
      }
    } catch(error) {
      ErrorProvider.errorMessage = error.toString();
    }
  }

  static Future<List<Task>?> getTask() async {
    try {
      Response response  = await get(Uri.parse(baseUrl + getTasksEndpoint));
      if(response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body))['task'];
        return jsonData.map((json) => Task.fromJson(json)).toList();
      } else {
        ErrorProvider.errorMessage = (json.decode(response.body))['message'];
      }
    } catch(error) {
      ErrorProvider.errorMessage = error.toString();
    }
    return null;
  }

  static Future<void> taskComplete(String id) async {
    try {
      Response response = await put(Uri.parse(baseUrl + taskCompleteEndpoint + id));
      if(response.statusCode != 200) {
        ErrorProvider.errorMessage = jsonDecode(response.body)['message'];
      }
    } catch(error) {
      ErrorProvider.errorMessage = error.toString();
    }
  }

  static Future<void> deleteTask(String id) async {
    try {
      Response response = await delete(Uri.parse(baseUrl + deleteTaskEndpoint + id));
      if(response.statusCode != 200) {
        ErrorProvider.errorMessage = (json.decode(response.body))['message'];
      }
    } catch(error) {
      ErrorProvider.errorMessage = error.toString();
    }
  }
}