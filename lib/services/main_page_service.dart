import 'dart:convert';

import 'package:todo_client/models/dto/get_token.dart';
import 'package:todo_client/models/dto/login_dto.dart';
import 'package:http/http.dart' as http;

class MainPageService {
  Future<GetToken> login(String url, Login data, Map<String, String> headers) async {
    http.Response response = await http.post(
      Uri.parse(url), 
      body: json.encode(data.toJson()), headers: headers
    );

    return GetToken.fromJson(json.decode(response.body));
  }
}