import 'package:amplified_todo/presentation/pages/add_todo_form/add_todo_form.dart';
import 'package:amplified_todo/presentation/pages/todos_page/widgets/todos_page_body.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo List'),
      ),
      body: TodosPageBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoForm()),
          );
        },
        tooltip: 'Add Todo',
        label: Row(
          children: [Icon(Icons.add), Text('Add todo')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
