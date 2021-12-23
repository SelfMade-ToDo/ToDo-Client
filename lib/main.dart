import 'package:flutter/material.dart';
import 'package:todo_client/screens/login_page.dart';
import 'package:todo_client/screens/main_page.dart';
import 'package:todo_client/screens/menu_page.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      initialRoute: '/login',
      routes: {
        // '/': (context) => MainPage(),
        '/login': (context) => const LoginPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}