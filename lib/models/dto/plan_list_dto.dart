import 'dart:ffi';

import 'package:todo_client/models/todo.dart';

class PlanList {
  late List<dynamic> planList;


  PlanList({required this.planList});

  factory PlanList.fromJson(Map<String, dynamic> map) {
    return PlanList(
        planList: map['planList'],
    );
  }
}