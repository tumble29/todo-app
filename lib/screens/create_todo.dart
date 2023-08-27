import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/providers/todos_provider.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  String? errorText;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
        title: const Text("Create Todo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
                child: Column(children: [
                  TextField(
                    controller: titleController,
                    maxLines: null,
                    // expands: true,
                    decoration: InputDecoration(
                        labelText: 'Title', errorText: errorText),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: null,
                    // expands: true,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isEmpty) {
                        setState(() {
                          errorText = "Title can't be empty";
                        });
                      } else {
                        context.read<TodosProvider>().addTodo(Todo(
                              id: DateTime.now().toString(),
                              title: titleController.text,
                              description: descriptionController.text,
                              isCompleted: false,
                            ));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
