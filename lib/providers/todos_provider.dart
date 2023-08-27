import 'package:flutter/material.dart';
import 'package:simple_todo_app/data/repository/todo_repository.dart';
import 'package:simple_todo_app/data/repository/todo_repository_implement.dart';

import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  late TodoRepository _todoRepository;
  TodosProvider() {
    _todoRepository = TodoRepositoryImpl();
    init();
  }

  init() async {
    _todos = await _todoRepository.getAllTodos();
    notifyListeners();
  }

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void addTodo(Todo todo) async {
    await _todoRepository.addTodo(todo);
    await init();
    notifyListeners();
  }

  void deleteTodo(Todo todo) async {
    await _todoRepository.deleteTodo(todo);
    await init();
  }

  void updateTodo(Todo todo) async {
    await _todoRepository.updateTodo(todo);
    await init();
  }
}
