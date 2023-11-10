import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/firebase_helper.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/login_fire.dart';
//import 'package:flutter_app1/storages/firebase%20ex/email_password_login/login_fire.dart';

//import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterFire(),
  ));
}

class RegisterFire extends StatelessWidget {
  RegisterFire({super.key});
  final R_uname = TextEditingController();
  final R_pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Registration'),
      ),
      body: Column(
        children: [
          Text(
            'Hello !!! Register Here!!',
            style:
                GoogleFonts.habibi(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: R_uname,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "username"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: R_pass,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "password"),
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              final email = R_uname.text.trim();
              final pswd = R_pass.text.trim();
              FireBaseHelper()
                  .register(email: email, password: pswd)
                  .then((value) {
                if (value == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginFire()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value)));
                }
              });
            },
            child: Text('Register'),
            color: Colors.purple,
            height: 70,
            minWidth: 120,
            shape: StadiumBorder(),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
