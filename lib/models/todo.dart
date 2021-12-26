class Todo {
  late int todoId;
  late String name;
  bool isFinished = false;
  
  Todo({required this.todoId, required this.name, required this.isFinished});
  Todo.withName({ required this.name });

  factory Todo.fromJson(Map<String, dynamic> userMap) {
    return Todo(
        todoId: userMap['id'],
        name: userMap['name'],
        isFinished: userMap['isFinished'],
    );
  }
}