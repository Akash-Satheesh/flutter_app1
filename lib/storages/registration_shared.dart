import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationShared extends StatefulWidget {
  const RegistrationShared({super.key});

  @override
  State<RegistrationShared> createState() => _RegistrationSharedState();
}

class _RegistrationSharedState extends State<RegistrationShared> {
  final username = TextEditingController();
  final password = TextEditingController();
  final usename = TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: usename,
            decoration: const InputDecoration(
                hintText: "Name", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: username,
            decoration: const InputDecoration(
                hintText: "username", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(
                hintText: "Password", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                prefs = await SharedPreferences.getInstance();
                String uname1 = username.text.trim();
                String pass1 = password.text.trim();
                String Name = usename.text.trim();
                if (uname1 != '' && pass1 != '') {
                  prefs.setString('username', uname1);
                  prefs.setString('password', pass1);
                  prefs.setString('Name', Name);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage2()));
                }
              },
              child: const Text('Register'))
        ],
      ),
    );
  }

  // void check_user_already_login() {}
}
