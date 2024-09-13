// this implements the todo services and handles storing, retrieving, update and deleting in the isar db

import 'package:isar/isar.dart';

import '../../exports.dart';

class IsarTodoServices implements TodoServices {
  final Isar db;

  IsarTodoServices(this.db);

  //get todos
  @override
  Future<List<Todo>> getTodos() async {
    //fetch todos from isar db
    final todos = await db.todoIsars.where().findAll();
    //return as a list of todos and give to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  //add new todo
  @override
  Future<void> addTodo(Todo newTodo) {
    //convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);

    //so that we can store it in isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //update todo
  @override
  Future<void> updateTodo(Todo todo) {
    //convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    //so that we can store it in isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //delete todo
  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
