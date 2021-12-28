import '../user.dart';

class Plan {
  late int planId;
  late String name;
  late String description;
  late User user;
  late bool isFinished;

  Plan({required this.planId, required this.name, required this.description, required this.user, required this.isFinished });

  factory Plan.fromJson(Map<String, dynamic> map) {
    return Plan(
      planId: map['planId'],
      name: map['name'],
      description: map['description'],
      user: map['user'],
      isFinished: map['isFinished']
    );
  }
}