import 'dart:ffi';

import 'package:todo_client/models/todo.dart';

class PlanList {
  late List<Todo> planList;


  PlanList({required this.planList});

  factory PlanList.fromJson(Map<String, dynamic> map) {
    return PlanList(
        planList: map['planList'],
    );
  }
}