class Todo {
  final int todoId;
  final String name;
  final bool isFinished;
  
  Todo({required this.todoId, required this.name, required this.isFinished});

  factory Todo.fromJson(Map<String, dynamic> userMap) {
    return Todo(
        todoId: userMap['id'],
        name: userMap['name'],
        isFinished: userMap['isFinished'],
    );
  }
}