class GetDeletePlan {
  late dynamic result;

  GetDeletePlan({required this.result});

  factory GetDeletePlan.fromJson(Map<String, dynamic> map) {
    return GetDeletePlan(
        result: map['result'],
    );
  }
}