import 'package:amplified_todo/domain/models/ModelProvider.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> createTodo(String name, String description);
  Future<void> updateTodoisComplete(Todo todo, bool isComplete);
}
