import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/database/hivedb.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/model/users.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/views/home_hive.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/views/reg_hive.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('users');

  runApp(GetMaterialApp(
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
              onPressed: () async {
                final users = await HiveDB.instance.getUsers();
                validateLogin(users);
              },
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

  Future<void> validateLogin(List<Users> users) async {
    final email = email_controller.text.trim();
    final pwd = pwd_controller.text.trim();
    bool userFound = false;
    if (email != "" && pwd != "") {
      await Future.forEach(users, (user) {
        if (user.email == email && user.password == pwd) {
          userFound = true;
        } else {
          userFound = false;
        }
      });
      if (userFound == true) {
        Get.offAll(() => HiveHome(email: email));
        Get.snackbar('Success', 'Login success', backgroundColor: Colors.green);
      } else {
        Get.snackbar('Error', 'Login failed,no users exists',
            backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar('Error', 'Fields Must not be empty',
          backgroundColor: Colors.red);
    }
  }
}
