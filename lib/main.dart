import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/data/models/isar_todo.dart';
import 'package:to_do_app/data/repository/isar_todo_repo.dart';
import 'package:to_do_app/domain/repository/todo_repo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  final isarTodoRepo = IsarTodoRepo(isar);

  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {

  final TodoRepo todoRepo;

  const MyApp({super.key ,required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}