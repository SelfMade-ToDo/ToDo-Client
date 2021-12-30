import 'package:http/http.dart';

class DeletePlan {
  late List raw;
  late int affected;

  DeletePlan({required this.raw, required this.affected});

  factory DeletePlan.fromJson(Map<String, dynamic> map) {
    return DeletePlan(
        raw: map['raw'],
        affected: map['affected'],
    );
  }
}