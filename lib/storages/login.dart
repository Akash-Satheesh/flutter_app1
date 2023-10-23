import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage2(),
  ));
}

// ignore: must_be_immutable
class LoginPage2 extends StatefulWidget {
  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  //const LoginPage2({super.key});
  final userName = TextEditingController();

  final passWord = TextEditingController();

  late bool newuser;

  late SharedPreferences prefs;
  @override
  void initState() {
    check_user_already_login();
    // TODO: implement initState
    super.initState();
  }

  void check_user_already_login() async {
    prefs = await SharedPreferences.getInstance();
    newuser = prefs.getBool('firstlogin')!;
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeShared()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: userName,
            decoration: const InputDecoration(
                hintText: "Username", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passWord,
            decoration: const InputDecoration(
                hintText: "Password", border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () async {
                prefs = await SharedPreferences.getInstance();
                String uname = userName.text.trim();
                String pass = passWord.text.trim();
                
                if (uname = uname1 && pass = pass1) {
                  prefs.setString('username', uname);
                  prefs.setString('password', pass);
                  prefs.setBool('firstlogin', false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeShared()));
                }
              },
              child: const Text('Login'))
        ],
      ),
    );
  }

  // void check_user_already_login() {}
}
