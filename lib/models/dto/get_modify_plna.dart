class GetModifyPlan {
  late dynamic result;

  GetModifyPlan({required this.result});

  factory GetModifyPlan.fromJson(Map<String, dynamic> map) {
    return GetModifyPlan(
        result: map['result'],
    );
  }
}