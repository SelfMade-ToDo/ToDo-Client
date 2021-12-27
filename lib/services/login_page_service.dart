import 'dart:convert';

import 'package:todo_client/models/dto/get_token.dart';
import 'package:todo_client/models/dto/login_dto.dart';
import 'package:http/http.dart' as http;

class LoginPageService {
  Future<GetToken> login(String url, Login data, Map<String, String> headers) async {
    http.Response response = await http.post(
      Uri.parse(url), 
      headers: headers,
      body: json.encode(data.toJson()),
    );

    return GetToken.fromJson(json.decode(response.body));
  }
}