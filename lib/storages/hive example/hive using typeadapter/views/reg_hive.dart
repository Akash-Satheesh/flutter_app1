import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: HiveReg(),
  ));
}

class HiveReg extends StatelessWidget {
  HiveReg({super.key});
  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final pwd_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registration Page'),
            TextField(
              controller: name_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: email_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: pwd_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'passsword'),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {},
              shape: const StadiumBorder(),
              color: Colors.purple,
              child: const Text('Register Here'),
            )
          ],
        ),
      ),
    );
  }
}
