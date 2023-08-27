import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/providers/todos_provider.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});
  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  late Todo todo;
  @override
  void initState() {
    todo = widget.todo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
      child: Slidable(
        groupTag: '0',
        closeOnScroll: false,
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.edit,
            label: "Edit",
            backgroundColor: Colors.yellow,
            autoClose: false,
          ),
          SlidableAction(
            onPressed: (context) {
              context.read<TodosProvider>().deleteTodo(todo);
            },
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
            autoClose: false,
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            leading: IconButton(
                onPressed: () {
                  setState(() {
                    todo.isCompleted = !todo.isCompleted;
                    context.read<TodosProvider>().updateTodo(todo);
                  });
                },
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: !todo.isCompleted
                      ? const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                        )
                      : const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                )),
            title: Text(
              todo.title,
              style: TextStyle(
                  decoration:
                      todo.isCompleted ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(
              todo.description,
              style: TextStyle(
                  decoration:
                      todo.isCompleted ? TextDecoration.lineThrough : null),
            ),
          ),
        ),
      ),
    );
  }
}
