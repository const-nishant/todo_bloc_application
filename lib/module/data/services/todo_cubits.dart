/*
todo cubits - simple state managment 

Each cubit is a list of todos

*/

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exports.dart';

class TodoCubit extends Cubit<List<Todo>> {
//reference to todo
  final TodoServices todoServices;
  TodoCubit(this.todoServices) : super([]) {
    loadTodos();
  }

  //L O A D
  Future<void> loadTodos() async {
    final todoList = await todoServices.getTodos();
    //emit the fetched todos
    emit(todoList);
  }

  //A D D
  Future<void> addTodo(String text) async {
    //create new todo with unique id
    final newTodo = Todo(
      id: DateTime.now().microsecondsSinceEpoch,
      text: text,
    );
    //save to the db
    await todoServices.addTodo(newTodo);
    //reload
    loadTodos();
  }

  //D E L E T E
  Future<void> deleteTodo(Todo todo) async {
    //delete the provided todo from the db
    await todoServices.deleteTodo(todo);
    //reload
    loadTodos();
  }

  //T O G G L E
  Future<void> toggleCompletion(Todo todo) async {
    //toggle the completion of the provided todo
    final updateTodo = todo.tooglecompletion();
    //update the todo
    await todoServices.updateTodo(updateTodo);
    //reload
    loadTodos();
  }
}
