import 'package:flutter/material.dart';
import 'package:flutter_app1/home.dart';
import 'package:flutter_app1/storages/login_sqflite/screens/register_sql.dart';

class LoginPage4 extends StatefulWidget {
  const LoginPage4({super.key});

  @override
  State<LoginPage4> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage4> {
  var formkey = GlobalKey<FormState>();
  final TextEditingController conemail = TextEditingController();
  final TextEditingController conpass = TextEditingController();

  Widget build(BuildContext context) {
    bool hidepass = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Login page',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: conemail,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.drive_file_rename_outline),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (text) {
                    if (text!.isEmpty ||
                        !text.contains('@') ||
                        !text.contains('.')) {
                      return "Enter valid Email!!!";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: conpass,
                  obscureText: hidepass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (hidepass)
                            hidepass = false;
                          else
                            hidepass = true;
                        });
                      },
                      icon: Icon(
                          hidepass ? Icons.visibility : Icons.visibility_off),
                    ),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return "Password lenght should be greater than 6";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: const Text("LOGIN"),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: const Text('Not a user? Register here'))
            ],
          )),
    );
  }
}
