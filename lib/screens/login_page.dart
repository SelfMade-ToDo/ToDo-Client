import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_client/Function/session.dart';
import 'package:todo_client/models/dto/get_token.dart';
import 'package:todo_client/models/dto/login_dto.dart';
import 'package:todo_client/screens/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;
  late GetToken userInfo;
  static const storage = FlutterSecureStorage();

  @override
  void initState(){
    super.initState();
    _emailCtrl = TextEditingController(text: '');
    _passwordCtrl = TextEditingController(text: '');

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  @override
  void dispose(){
    _emailCtrl.dispose();
    _passwordCtrl.dispose();

    super.dispose();
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userInfo = (await storage.read(key: "login"))! as GetToken;
    if (kDebugMode) {
      print(userInfo);
    }

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (userInfo != null) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const MainPage()
        )
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailWidget(),
          _passwordWidget(),
          _loginButton(context)
        ],
      ),
    );
  }

  Widget _emailWidget(){
    return TextFormField(
      controller: _emailCtrl,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _passwordWidget(){
    return TextFormField(
      controller: _passwordCtrl,
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password),
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _loginButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () => isLoading ? null : _login(),
        child: Text(
          isLoading ? 'loggin in.....' : 'login',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _login() async {
    GetToken token = await Session().loginPageService.login(
      'https://selfmade-todo.herokuapp.com/auth/login',
      Login(
        email: _emailCtrl.text,
        password: _passwordCtrl.text
      ),
      Session().JSONheaders
    );

    await storage.write(
      key: "login",
      value: token.accessToken,
    );

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
          builder: (context) => const MainPage()
        ),
      );
  }

  // void _loginCheck() async {
  //   if (kDebugMode) {
  //     print('_userEmailCtrl.text : ${_emailCtrl.text}');
  //   }
  //   if (kDebugMode) {
  //     print('_userPasswordCtrl.text : ${_passwordCtrl.text}');
  //   }
  //   const storage = FlutterSecureStorage();
  //   String? storagePass = await storage.read(key: _emailCtrl.text);
  //   if(storagePass != '' && storagePass == _passwordCtrl.text){
  //     if (kDebugMode) {
  //       print('storagePass : $storagePass');
  //     }
  //     String? userNickName = await storage.read(key: '${_emailCtrl.text}_$storagePass');
  //     if(userNickName != null){
  //       storage.write(key: userNickName, value: STATUS_LOGIN);
  //     }
  //     if (kDebugMode) {
  //       print('로그인 성공');
  //     }
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(name: userNickName)));
  //   } else {
  //     if (kDebugMode) {
  //       print('로그인 실패');
  //     }
  //     showToast('아이디가 존재하지 않거나 비밀번호가 맞지않습니다.');
  //   }
  // }
}

