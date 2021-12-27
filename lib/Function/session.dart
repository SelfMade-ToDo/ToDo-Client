import 'package:todo_client/services/login_page_service.dart';
import 'package:todo_client/services/main_page_service.dart';

class Session {
  Map<String, String> JSONheaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, String> JSONheadersWithToken (String token) {
    JSONheaders['Authorization'] = token;
    return JSONheaders;
  }

  Map<String, String> cookies = {};

  LoginPageService loginPageService = LoginPageService();
  MainPageService mainPageService = MainPageService();
}