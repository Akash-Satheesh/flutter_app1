import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Registration(),
  ));
}

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Image.network(
              'https://icons.iconarchive.com/icons/iconoir-team/iconoir/128/3d-add-hole-icon.png',
              width: 100,
              height: 100,
            ),
            Text(
              'My Application',
              style: GoogleFonts.archivo(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                    hintText: " Name",
                    labelText: " Name",
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    // helperText: 'User name must be an email',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(100.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
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
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      helperText: 'Password must contain 6 characters',
                      prefixIcon: Icon(Icons.password_rounded),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0))))),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Register')),
            TextButton(
                onPressed: () {}, child: Text('Not a user? Signup here!!!'))
          ]),
        ),
      ),
    );
  }
}
