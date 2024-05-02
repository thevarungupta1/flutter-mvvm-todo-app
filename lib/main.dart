import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo_app/view_models/todo_vm.dart';
import 'package:flutter_mvvm_demo_app/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewModel()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
