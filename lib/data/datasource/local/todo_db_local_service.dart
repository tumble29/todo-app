import 'package:hive/hive.dart';
import 'package:simple_todo_app/data/datasource/todo_data_service.dart';
import 'package:simple_todo_app/models/todo.dart';

class TodoDBService implements TodoDataService {
  late Box box;
  TodoDBService() {
    _initHive();
  }

  _initHive() {
    box = Hive.box('todos');
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await box.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await box.delete(todo.id);
  }

  @override
  Future<List<Todo>> getAllTodos() => Future.value(List<Todo>.from(box.values));

  @override
  Future<void> updateTodo(Todo todo) async {
    await box.put(todo.id, todo);
  }
}
