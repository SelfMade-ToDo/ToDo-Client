import 'package:flutter/material.dart';
import 'package:todo_client/models/todo.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_client/screens/menu_page.dart';
import 'package:todo_client/widgets/main_page_widgets.dart';

class MainPage extends StatefulWidget{
  late String name;

  MainPage({ required this.name});

  @override
  _MainPageState createState() => _MainPageState(name: name);
}

class _MainPageState extends State<MainPage>{
  // final storage = const FlutterSecureStorage();
  final _items = <Todo>[];
  late TextEditingController _todoCtrl;
  String name;

  _MainPageState({required this.name});

  @override
  void initState(){
    super.initState();
    _todoCtrl = TextEditingController(text: '');
  }

  @override
  void dispose(){
    _todoCtrl.dispose();
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
              children: _items.map((todo) => MainPageWidgets().buildItemWidget(todo)).toList(),
            )
          )
        ],
      ),
      // 일정 추가 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // addPlan 때문에 MainPage()를 써야 하는데 생성자가 MainPage(name: name)밖에 없는데 MainPage() 만들어 써도 될라나?
            // builder: (BuildContext context) => MainPageWidgets().buildBottomSheet(context, _todoCtrl)
            builder: (BuildContext context) => buildBottomSheet(context),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // 플러스 버튼 눌렀을떄 밑에서 나오는 창
  Widget buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _todoCtrl,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '이름',
          ),
        ),
        ElevatedButton(
          child: const Text('확인'),
          onPressed: () => addPlan(Todo.withName(name: _todoCtrl.text)),
        ),
        ElevatedButton(
          child: const Text('Close BottomSheet'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  // todo 목록에 추가
  void addPlan(Todo todo){
    setState(() {
      _items.add(todo);
    });
  }

  // todo 목록에서 삭제
  void deletePlan(Todo todo){
    setState(() {
      _items.remove(todo);
    });
  }

  // todo 상태 변경
  void changeState(Todo todo){
    setState(() {
      todo.isFinished = !todo.isFinished;
    });
  }

}