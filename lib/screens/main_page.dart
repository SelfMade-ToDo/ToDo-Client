import 'package:flutter/material.dart';
import 'package:todo_client/Function/session.dart';
import 'package:todo_client/models/dto/add_plan.dart';
import 'package:todo_client/models/dto/plan_list_dto.dart';
import 'package:todo_client/models/todo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_client/screens/menu_page.dart';
import 'package:todo_client/services/main_page_service.dart';

class MainPage extends StatefulWidget{

  const MainPage({Key? key, }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final storage = const FlutterSecureStorage();
  late TextEditingController _nameCtrl;
  late TextEditingController _descriptionCtrl;
  
  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: '');
    _descriptionCtrl = TextEditingController(text: '');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
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
          const Text('hello User'),
          // 사진
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("Assets/images/bart.jpeg", width:250),  
          ),
          // todo 목록
          Expanded(
            child: FutureBuilder(
              future: buildPlans(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  }
                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    );
                  }
                  // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                  else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: snapshot.data,
                    );
                  }
                },
            )
          )
        ],
      ),
      // 일정 추가 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 5),
            child: TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이름',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
            child: TextField(
              controller: _descriptionCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '설명',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 10),
            child: ElevatedButton(
            child: const Text('확인'),
            onPressed: () {
              addPlan(AddPlan(name: _nameCtrl.text, description: _descriptionCtrl.text));
              _nameCtrl.text = '';
              _descriptionCtrl.text = '';
              Navigator.pop(context);
            },
          ),
          ),
        ],
      ),
    );
  }

  Future<ListView> buildPlans() async {

    PlanList plans = await Session().mainPageService.getPlanList(
      "https://selfmade-todo.herokuapp.com/todo",
      Session().JSONheadersWithToken((await storage.read(key: "login"))!)
    );

    return ListView(
      // children: _items.map((todo) => MainPageWidgets().buildItemWidget(todo)).toList(),
      children: plans.planList.map((todo) => buildItemWidget(todo)).toList(),
    );
  }

  // todo 한 개
  Widget buildItemWidget(dynamic todo){
    Todo newTodo = Todo.fromJson(todo);

    return ListTile(
      onTap: () => changeState(newTodo),
      trailing: IconButton(
        onPressed: () {
          deletePlan(newTodo.todoId);
        },
        icon: const Icon(Icons.delete)
      ),
      title: Text(
        newTodo.name,
        style: newTodo.isFinished ? const TextStyle(
          decoration: TextDecoration.lineThrough,
          color: Colors.red,
        ) : null ,
      ),
    );
  }

  // todo 목록에 추가
  void addPlan(AddPlan addPlan) async {
    String token = (await storage.read(key: "login"))!;
    setState(() {
      MainPageService().addPlan(
        'https://selfmade-todo.herokuapp.com/todo',
        addPlan,
        Session().JSONheadersWithToken(token) 
      );
    });
  }

  // todo 목록에서 삭제
  void deletePlan(int planId) async {
    String token = (await storage.read(key: "login"))!;
    setState(() {
      MainPageService().deletePlan(
        'https://selfmade-todo.herokuapp.com/todo/$planId',
        Session().JSONheadersWithToken(token)
      );
    });
  }

  // ModifyPlan isn't a type. Try correcting the name to match an existing type.
  // todo 수정
  // void ModifyPlan(ModifyPlan modifyPlan) async {
  //   String token = (await storage.read(key: "login"))!;
  //   setState(() {
  //     MainPageService().modifyPlan(
  //       'https://selfmade-todo.herokuapp.com/todo',
  //       modifyPlan,
  //       Session().JSONheadersWithToken(token)
  //     );
  //   });
  // }

  // todo 상태 변경
  void changeState(Todo todo){
    setState(() {
      todo.isFinished = !todo.isFinished;
    });
  }
}