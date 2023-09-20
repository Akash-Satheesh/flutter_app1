import 'package:flutter/material.dart';
//import 'package:flutter_app1/login_page1.dart';

void main() {
  runApp(MaterialApp(
    home: Login_stateful(),
  ));
}

class Login_stateful extends StatefulWidget {
  const Login_stateful({super.key});

  @override
  State<Login_stateful> createState() => _Login_statefulState();
}

class _Login_statefulState extends State<Login_stateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Username'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
            validator: (uname) {
              if (uname!.isEmpty ||
                  !uname.contains('@') ||
                  !uname.contains('.com')) {
                return 'username must not be empty/ or invalid';
              } else {
                return null;
              }
            },
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Login'))
      ]),
    );
  }
}
