import 'package:flutter/material.dart';
import 'package:flutter_app1/home.dart';
import 'package:flutter_app1/registration.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  String username = "admin@gmail.com";
  String password = 'abc123';
  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();

  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Image.network(
              'https://cdn0.iconfinder.com/data/icons/leto-ui-generic-1/64/leto-04-128.png',
              width: 100,
              height: 100,
            ),
            Text(
              'My App July',
              style: GoogleFonts.cabinSketch(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                controller: uname_controller,
                decoration: InputDecoration(
                    hintText: "User Name",
                    labelText: "User Name",
                    helperText: 'User name must be an email',
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: pass_controller,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      helperText: 'Password must contain 6 characters',
                      prefixIcon: Icon(Icons.password_rounded),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0))))),
            ),
            ElevatedButton(
                onPressed: () {
                  if (username == uname_controller.text &&
                      password == pass_controller.text) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Invalid username / password or the fields are empty'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text('Login')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: Text('Not a user? Signup here!!!'))
          ]),
        ),
      ),
    );
  }
}
