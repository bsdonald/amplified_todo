import 'package:amplified_todo/domain/i_todo_repository.dart';
import 'package:amplified_todo/domain/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify.dart';

class TodoRepository implements ITodoRepository {
  @override
  Future<void> createTodo(String name, String description) async {
    final newTodo = Todo(name: name, isComplete: false);
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> updateTodoisComplete(Todo todo, bool isComplete) async {
    final updatedTodo = todo.copyWith(isComplete: isComplete);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      throw e;
    }
  }
}
