import 'dart:convert';

class TodoModel {
  List<Todo> todos;
  int total;
  int skip;
  int limit;

  TodoModel({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "todos": List<dynamic>.from(todos.map((e) => e.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Todo {
  int id;
  String todo;
  bool completed;
  int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
      userId: json["userId"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
