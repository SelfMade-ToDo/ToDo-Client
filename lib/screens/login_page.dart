import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_client/Function/session.dart';
import 'package:todo_client/models/dto/get_token.dart';
import 'package:todo_client/models/dto/login_dto.dart';
import 'package:todo_client/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;

  @override
  void initState(){
    super.initState();
    _emailCtrl = TextEditingController(text: '');
    _passwordCtrl = TextEditingController(text: '');
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
    GetToken token = await Session().mainPageService.login(
      'http://localhost:3000/auth/login',
      Login(
        email: _emailCtrl.text,
        password: _passwordCtrl.text
      ),
      Session().JSONheaders
    );

    if (kDebugMode) {
      print('reslut:');
      print(_emailCtrl);
      print(_passwordCtrl);
      print(token);
    }
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

