import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/model/users.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/views/reg_hive.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Users>('users');
  runApp(MaterialApp(
    home: LoginHive(),
  ));
}

class LoginHive extends StatelessWidget {
  LoginHive({super.key});

  final email_controller = TextEditingController();
  final pwd_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Page'),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: email_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'User Name'),
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
              child: const Text('Login Here'),
            ),
            TextButton(
                onPressed: () {
                  Get.to(HiveReg());
                },
                child: Text('Not a user? Register Here!!!'))
          ],
        ),
      ),
    );
  }
}
