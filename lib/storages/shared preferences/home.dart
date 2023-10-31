import 'package:flutter/material.dart';
import 'package:flutter_app1/storages/shared%20preferences/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomeShared extends StatefulWidget {
  @override
  State<HomeShared> createState() => _HomeSharedState();
}

class _HomeSharedState extends State<HomeShared> {
  //const HomeShared({super.key});
  late SharedPreferences prefs;
  String? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString('username');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome $user'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  prefs.setBool('firstlogin', true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage2(),
                      ));
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
