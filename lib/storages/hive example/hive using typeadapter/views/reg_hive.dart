import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/database/hivedb.dart';
import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/model/users.dart';
import 'package:get/get.dart';

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
              onPressed: () async {
                final userList = await HiveDB.instance.getUsers();
                validateSignUp(userList);
                name_controller.clear();
                email_controller.clear();
                pwd_controller.clear();
              },
              shape: const StadiumBorder(),
              color: Colors.purple,
              child: const Text('Register Here'),
            )
          ],
        ),
      ),
    );
  }

  void validateSignUp(List<Users> userList) async {
    final name = name_controller.text;
    final email = email_controller.text;
    final pswrd = pwd_controller.text;
    bool userExist = false;
    final validateEmail = EmailValidator.validate(email);
    if (name != "" && email != "" && pswrd != "") {
      if (validateEmail == true) {
        await Future.forEach(userList, (user) {
          if (user.email == email) {
            userExist = true;
          } else {
            userExist = false;
          }
        });
        if (userExist == true) {
          Get.snackbar('Error!', 'User already exists');
        } else {
          final validatePassword = checkPassword(pswrd);
          if (validatePassword == true) {
            final user = Users(email: email, password: pswrd, name: name);
            await HiveDB.instance.addUser(user);
            Get.back();
            Get.snackbar('Success', 'User registration success');
          }
        }
      } else {
        Get.snackbar('Error', 'Enter a valid email');
      }
    } else {
      Get.snackbar('Error', 'Please fill all the field');
    }
  }

  bool checkPassword(String pswrd) {
    if (pswrd.length < 6) {
      Get.snackbar('Error', 'Password length must be > 6');
      return false;
    } else {
      return true;
    }
  }
}
