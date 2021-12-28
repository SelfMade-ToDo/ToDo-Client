class GetAddPlan {
  late dynamic plan;

  GetAddPlan({required this.plan});

  factory GetAddPlan.fromJson(Map<String, dynamic> map) {
    return GetAddPlan(
        plan: map['plan'],
    );
  }
}