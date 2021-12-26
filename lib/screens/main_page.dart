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
  final _items = <String>[];
  late TextEditingController _todoName;
  String name;

  _MainPageState({required this.name});

  @override
  void initState(){
    super.initState();
    _todoName = TextEditingController(text: '');
  }

  @override
  void dispose(){
    _todoName.dispose();
    super.dispose();
  }
  
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 유저 이름
          Text('hello $name'),
          // 사진
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("Assets/images/bart.jpeg", width:250),  
          ),
          // todo 목록
          Expanded(
            child: ListView(
              children: _items.map((todo) => _buildItemWidget(name)).toList(),
            )
          )
        ],
      ),
      // 일정 추가 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: buildBottomSheet
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildItemWidget(String name){
    return ListTile(
      trailing: IconButton(
        onPressed: () {

        },
        icon: const Icon(Icons.delete)
      ),
    );
  }

  // 플러스 버튼 눌렀을떄 밑에서 나오는 창
  Widget buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _todoName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '이름',
          ),
        ),
        ElevatedButton(
          child: const Text('Close BottomSheet'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}