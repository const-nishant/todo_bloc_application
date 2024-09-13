/*
it will include 
- id
- text
- isCompleted

Methods:
  -tooglecompletion on & off

 */

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  Todo tooglecompletion() {
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted,
    );
  }

}
