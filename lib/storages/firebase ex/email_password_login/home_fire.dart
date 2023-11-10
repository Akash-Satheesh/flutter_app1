import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/firebase_helper.dart';
import 'package:flutter_app1/storages/firebase%20ex/email_password_login/login_fire.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeFire extends StatelessWidget {
  const HomeFire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MaterialButton(
        onPressed: () {
          FireBaseHelper().logOut().then((value) => Get.to(LoginFire()));
        },
        color: Colors.green,
        shape: StadiumBorder(),
        height: 50,
        minWidth: 200,
        child: Text('Sign Out'),
      ),
    ));
  }
}
