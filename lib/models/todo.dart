class Todo {
  late int todoId;
  late String name;
  late String description;
  bool isFinished = false;
  
  Todo({required this.todoId, required this.name, required this.description, required this.isFinished});
  Todo.withName({ required this.name });

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
        todoId: map['id'],
        name: map['name'],
        description: map['description'],
        isFinished: map['isFinished'],
    );
  }
}