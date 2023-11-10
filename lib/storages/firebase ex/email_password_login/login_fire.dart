import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/firebase_helper.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/home_fire.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/reg_fire.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? LoginFire() : HomeFire(),
  ));
}

class LoginFire extends StatelessWidget {
  LoginFire({super.key});
  final L_name = TextEditingController();
  final L_pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Login'),
      ),
      body: Column(
        children: [
          Text(
            'Hello !!! Login Here!!',
            style:
                GoogleFonts.habibi(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: L_name,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "username"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: L_pass,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "password"),
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              final email = L_name.text.trim();
              final pswd = L_pass.text.trim();
              FireBaseHelper()
                  .login(email: email, password: pswd)
                  .then((value) => {
                        if (value == null)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeFire()))
                          }
                        else
                          {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('value')))
                          }
                      });
            },
            child: Text('Login'),
            color: Colors.purple,
            height: 70,
            minWidth: 120,
            shape: StadiumBorder(),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterFire()));
              },
              child: const Text('Not a user? Register here')),
        ],
      ),
    );
  }
}
