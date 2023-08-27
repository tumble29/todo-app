import 'package:hive/hive.dart';

part 'todo.g.dart';

////Chạy lệnh này sẽ tạo ra file 'todo.g.dart'
//flutter pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String id;
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  Todo(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        description: json['description'],
        title: json['title'],
        isCompleted: json['isCompleted']);
  }
}
