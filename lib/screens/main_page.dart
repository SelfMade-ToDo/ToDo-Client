import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_client/screens/menu_page.dart';

class MainPage extends StatefulWidget{
  late String name;
  MainPage({ required this.name});

  @override
  _MainPageState createState() => _MainPageState(name: name);
}

class _MainPageState extends State<MainPage>{
  // final storage = const FlutterSecureStorage();
  String name;

  _MainPageState({required this.name});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute( builder: (context) => const MenuPage())
              )
            },
            icon: const Icon(Icons.menu)
          ),
        ],
      ),
      body: Column(
        children: [
          Text('hello $name'),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("Assets/bart.jpeg", width:250),  
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(),
        ElevatedButton(
          child: const Text('Close BottomSheet'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}