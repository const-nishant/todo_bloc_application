/* 

define what the app can do..

*/

import '../../exports.dart';

abstract class TodoServices {
  //get list of todos
  Future<List<Todo>> getTodos();
  //add new todo
  Future<void> addTodo(Todo newTodo);
  //update existing  todo
  Future<void> updateTodo(Todo todo);
  //delete  todo
  Future<void> deleteTodo(Todo todo);
}

/*
Note:
-the service in the domain layer outlines what operatins the app can do, but
 but doesn't worry about the specific implementation details.

- technology agnostics: independent for any technology or framework.

*/