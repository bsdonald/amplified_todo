import 'package:amplified_todo/models/ModelProvider.dart';
import 'package:amplified_todo/presentation/pages/todos_page/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  TodosList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return todos.length >= 1
        ? ListView(
            padding: EdgeInsets.all(8),
            children: todos.map((todo) => TodoItem(todo: todo)).toList(),
          )
        : Center(
            child: Text('Tap button below to add a todo!'),
          );
  }
}
