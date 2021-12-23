import 'package:todo_client/services/main_page_service.dart';

class Session {
  Map<String, String> JSONheaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, String> cookies = {};

  MainPageService mainPageService = MainPageService();
}