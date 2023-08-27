import 'package:flutter/material.dart';
import 'package:simple_todo_app/data/datasource/local/todo_db_local_service.dart';
import 'package:simple_todo_app/data/datasource/remote/todo_firestore_service.dart';
import 'package:simple_todo_app/data/repository/todo_repository.dart';
import 'package:simple_todo_app/models/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDBService _todoDBService;
  final TodoFirestoreService _todoFirestoreService;
  TodoRepositoryImpl(
      {TodoDBService? todoDBService,
      TodoFirestoreService? todoFirestoreService})
      : _todoDBService = todoDBService ?? TodoDBService(),
        _todoFirestoreService = todoFirestoreService ?? TodoFirestoreService();

  @override
  Future<void> addTodo(Todo todo) {
    return _todoFirestoreService.addTodo(todo).then((value) {
      debugPrint("Todo added");
      _todoDBService.addTodo(todo);
    }).catchError((e) => debugPrint('Error adding todo'));
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    return _todoFirestoreService
        .deleteTodo(todo)
        .then((value) => debugPrint('Todo deleted'))
        .catchError((e) => _todoDBService.deleteTodo(todo));
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    return await _todoFirestoreService
        .getAllTodos()
        .then((value) => value)
        .catchError((e) {
      debugPrint('Get all Todos error: $e');
      _todoFirestoreService.getAllTodos();
    });
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return _todoFirestoreService
        .updateTodo(todo)
        .then((value) => debugPrint('Todo updated'))
        .catchError((e) => _todoDBService.updateTodo(todo));
  }
}
