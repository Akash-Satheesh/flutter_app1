import 'package:flutter/material.dart';

void main() {
  // to run an app
  runApp(MaterialApp(
    // default theme of our flutter app
    home: SplashPage(), // initial page to be launched while running an app
  ));
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 94, 212, 15),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book, size: 60, color: Colors.red),
            Text(
              "My Application",
              style: TextStyle(fontSize: 20, color: Colors.red),
            )
          ],
        )));
  }
}
