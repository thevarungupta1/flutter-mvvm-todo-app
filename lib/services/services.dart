import 'package:flutter_mvvm_demo_app/helpers/app_url.dart';
import 'package:flutter_mvvm_demo_app/helpers/network_helper.dart';
import 'package:flutter_mvvm_demo_app/models/todo_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceClass {
  static Future<Object> getTodoData(String apiName) async {
    print('jjjj');
    try {
      var url = Uri.parse(appUrl.domain + apiName);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          List<TodoModel> todoList =
              decodedResponse.map((item) => TodoModel.fromJson(item)).toList();
          print(response.statusCode);
          return Success(code: 200, response: todoList);
        } else if (decodedResponse is Map<String, dynamic>) {
          print(response.statusCode);
          TodoModel todoModel = TodoModel.fromJson(decodedResponse);
          return Success(code: 200, response: [todoModel]);
        } else {
          return Failure(
              code: response.statusCode, response: 'invalid response stucture');
        }
      } else {
        return Failure(code: response.statusCode, response: 'invalid response');
      }
    } catch (e) {
      return "invalid response";
    }
  }
}
