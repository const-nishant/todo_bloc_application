// convert todo model to isar model so we can store it in isar db

import 'package:isar/isar.dart';
import '../../exports.dart';
//to generate isar todo object , run dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //covert isar object to todo object to use in the app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  //convert todo object to isar object to store in isar db
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}