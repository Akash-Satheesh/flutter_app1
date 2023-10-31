import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/shared%20preferences/home.dart';
import 'package:flutter_app1/storages/shared%20preferences/registration_shared.dart';
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
  final username = TextEditingController();

  final password = TextEditingController();

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
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                prefs = await SharedPreferences.getInstance();
                String uname = userName.text.trim();
                String pass = passWord.text.trim();

                String uname1 = username.text.trim();

                String pass1 = password.text.trim();

                if (uname == uname1 && pass == pass1) {
                  prefs.setString('username', uname);
                  prefs.setString('password', pass);
                  prefs.setBool('firstlogin', false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeShared()));
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Invalid username or password')));
                }
              },
              child: const Text('Login')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationShared()));
              },
              child: Text('Register here'))
        ],
      ),
    );
  }

  // void check_user_already_login() {}
}
