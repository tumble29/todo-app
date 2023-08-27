import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/providers/todos_provider.dart';
import 'package:simple_todo_app/screens/create_todo.dart';
import 'package:simple_todo_app/widgets/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosProvider>(
        create: (_) => TodosProvider(),
        child: Consumer<TodosProvider>(builder: ((context, provider, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarOpacity: 0,
              centerTitle: true,
              title: const Text(
                'Todos',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                            value: context.read<TodosProvider>(),
                            child: const CreateTodo())));
              },
              child: const Icon(Icons.add),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<TodosProvider>().init();
              },
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpeg'),
                          fit: BoxFit.fill)),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SafeArea(
                        child: provider.todos.isNotEmpty
                            ? SlidableAutoCloseBehavior(
                                child: ListView.builder(
                                    itemCount: provider.todos.length,
                                    itemBuilder: (context, index) => TodoCard(
                                          todo: provider.todos[index],
                                        )),
                              )
                            : const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No Todos added yet"),
                                ],
                              ),
                      ))),
            ),
          );
        })));
  }
}
