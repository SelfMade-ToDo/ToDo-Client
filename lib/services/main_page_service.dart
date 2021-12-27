import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_client/models/dto/plan_list_dto.dart';

class MainPageService {
  Future<PlanList> getPlanList(String url, Map<String, String> headers) async {
    http.Response response = await http.get(
      Uri.parse(url), 
      headers: headers
    );

    if(response.body == '{"statusCode":401,"message":"Unauthorized"}'){
      throw Exception();
    }

    print(response.body);

    print('로직에서 출력');
    print(PlanList.fromJson(json.decode(response.body)));

    return PlanList.fromJson(json.decode(response.body));
  }
}