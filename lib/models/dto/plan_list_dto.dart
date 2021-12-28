class PlanList {
  late List<dynamic> planList;


  PlanList({required this.planList});

  factory PlanList.fromJson(Map<String, dynamic> map) {
    return PlanList(
        planList: map['planList'],
    );
  }
}