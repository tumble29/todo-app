import 'package:simple_todo_app/models/todo.dart';

abstract class TodoDataService {
  Future<List<Todo>> getAllTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
}
