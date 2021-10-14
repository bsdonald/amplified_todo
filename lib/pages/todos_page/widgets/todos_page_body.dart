import 'package:amplified_todo/models/ModelProvider.dart';
import 'package:amplified_todo/pages/todos_page/widgets/todos_list.dart';
import 'package:flutter/material.dart';

class TodosPageBody extends StatelessWidget {
  final bool isLoading;
  final List<Todo> todos;
  TodosPageBody({
    required this.isLoading,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: CircularProgressIndicator()) : TodosList(todos: todos);
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => AddTodoForm()),
    //     );
    //   },
    //   tooltip: 'Add Todo',
    //   label: Row(
    //     children: [Icon(Icons.add), Text('Add todo')],
    //   ),
    // ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  }
}
