import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo_app/helpers/app_url.dart';
import 'package:flutter_mvvm_demo_app/helpers/network_helper.dart';
import 'package:flutter_mvvm_demo_app/models/todo_model.dart';
import 'package:flutter_mvvm_demo_app/services/services.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todoModel = [];
  List<TodoModel> get todoModel => _todoModel;

  setTodoModel(List<TodoModel> todoModel) {
    _todoModel = todoModel;
    notifyListeners();
  }

  getTodoResponse() async {
    var finalResponse = await ServiceClass.getTodoData(appUrl.todo);
    if (finalResponse is Success) {
      print(finalResponse.toString());
      setTodoModel(finalResponse.response as List<TodoModel>);
    }
    if (finalResponse is Failure) {
      print(finalResponse.code);
    }
  }
}
