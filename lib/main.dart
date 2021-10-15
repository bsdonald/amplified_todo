import 'package:amplified_todo/presentation/pages/todos_page/todos_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplified Todo',
      home: TodosPage(),
    );
  }
}
