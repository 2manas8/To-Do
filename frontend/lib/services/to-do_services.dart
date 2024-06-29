import 'dart:convert';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/providers/error_provider.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart';

class ToDoApiCalls {
  static Future<void> addTask(String task) async {
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
        ErrorProvider.errorMessage = (json.decode(response.body))["message"];
      }
    } catch(error) {
      ErrorProvider.errorMessage = error.toString();
    }
  }

  static Future<void> getTask() async {
    try {
      Response response  = await get(
        Uri.parse(baseUrl + getTasksEndpoint),
        headers: {'Content-Type': 'application/json'}
      );
      if(response.statusCode == 200) {
        ErrorProvider.errorMessage = '';
      }
    } catch(error) {
      ErrorProvider.errorMessage = error.toString();
    }
  }
}