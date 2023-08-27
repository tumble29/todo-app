import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_todo_app/data/datasource/local/todo_db_local_service.dart';
import 'package:simple_todo_app/data/datasource/todo_data_service.dart';
import 'package:simple_todo_app/models/todo.dart';

class TodoFirestoreService implements TodoDataService {
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  @override
  Future<void> addTodo(Todo todo) {
    return todos
        .doc(todo.id.toString())
        .set(todo.toJson())
        .then((value) => print("Todo Added"))
        .catchError((error) => print("Failed to add todo: $error"));
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    return todos
        .doc(todo.id.toString())
        .delete()
        .then((value) => print("Todo deleted"))
        .catchError((error) => print("Failed to add todo: $error"));
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    List<Todo> todoList = [];
    await todos.get().then((QuerySnapshot querySnapshot) {
      todoList = querySnapshot.docs
          .map((element) =>
              Todo.fromJson(element.data() as Map<String, dynamic>))
          .toList();
    });
    return Future.value(todoList);
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return todos
        .doc(todo.id.toString())
        .update(todo.toJson())
        .then((value) => print("Todo Updated"))
        .catchError((error) => print("Failed to update todo: $error"));
  }
}
