import 'package:flutter/material.dart';
import 'package:flutter_app1/login_page.dart';
//import 'package:flutter_app1/login_page.dart';
//import 'package:flutter_app1/login_page1.dart';
//import 'package:flutter_app1/login_page1.dart';
//import 'package:flutter_app1/login_page1.dart';

void main() {
  runApp(MaterialApp(
    home: Registration_stateful(),
  ));
}

class Registration_stateful extends StatefulWidget {
  const Registration_stateful({super.key});

  @override
  State<Registration_stateful> createState() => _Registration_statefulState();
}

class _Registration_statefulState extends State<Registration_stateful> {
  final formkey = GlobalKey<FormState>();
  String? pass;
  bool passwordhidden = true;
  bool cpasshidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Username'),
                  validator: (uname) {
                    if (uname!.isEmpty ||
                        !uname.contains('@') ||
                        !uname.contains('.com')) {
                      return 'username must not be empty/ or invalid';
                    } else {
                      return null;
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Phone Number'),
                validator: (num) {
                  if (num!.isEmpty || num.length != 10) {
                    return 'Phone number shoud have 10 digits / field must not be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscuringCharacter: "*",
                obscureText: passwordhidden,
                validator: (password) {
                  pass = password;
                  if (password!.isEmpty || password.length < 6) {
                    return 'Password must not be empty/ password lengthmust be <6';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (passwordhidden == true) {
                            passwordhidden = false;
                          } else {
                            passwordhidden = true;
                          }
                        });
                      },
                      icon: Icon(passwordhidden == true
                          ? Icons.visibility_off_sharp
                          : Icons.visibility)),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: cpasshidden,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (cpasshidden == true) {
                              cpasshidden = false;
                            } else {
                              cpasshidden = true;
                            }
                          });
                        },
                        icon: Icon(cpasshidden == true
                            ? Icons.visibility_off_sharp
                            : Icons.visibility))),
                validator: (cpassword) {
                  if (cpassword!.isEmpty || cpassword != pass) {
                    return 'Password must be same / field must not be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final valid = formkey.currentState!.validate();
                  if (valid) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid datas')));
                  }
                },
                child: Text('Login'))
          ]),
        ),
      ),
    );
  }
}
