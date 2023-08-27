import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_todo_app/firebase_options.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..initFlutter()
    ..init((await getApplicationSupportDirectory()).path)
    ..registerAdapter(TodoAdapter());

  await Hive.openBox('todos');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
