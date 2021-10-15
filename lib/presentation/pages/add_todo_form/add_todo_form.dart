import 'package:amplified_todo/presentation/pages/add_todo_form/widgets/add_todo_form_body.dart';
import 'package:flutter/material.dart';

class AddTodoForm extends StatefulWidget {
  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        body: AddTodoFormBody(context: context));
  }
}
