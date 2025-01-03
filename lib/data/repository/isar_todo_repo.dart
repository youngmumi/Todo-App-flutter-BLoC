import 'package:isar/isar.dart';
import 'package:to_do_app/data/models/isar_todo.dart';
import 'package:to_do_app/domain/models/todo.dart';
import 'package:to_do_app/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo{
  final Isar db;

  IsarTodoRepo(this.db);

  //get todos
  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  //add todo
  @override
  Future<void> addTodo(Todo newTodo) async{
   final todoIsar = TodoIsar.fromDomain(newTodo);

   return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //update todo
  @override
  Future<void> updateTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);

   return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //delete todo
  @override
  Future<void> deleteTodo(Todo todo) async{
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}