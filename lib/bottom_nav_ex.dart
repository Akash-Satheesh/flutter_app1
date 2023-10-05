import 'package:flutter/material.dart';
import 'package:flutter_app1/fi_atm_card.dart';
import 'package:flutter_app1/gridview_examples/gridview1.dart';
import 'package:flutter_app1/gridview_examples/gridview3.dart';
import 'package:flutter_app1/gridview_examples/gridview_builder.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: BottomBarEx(),
  ));
}

class BottomBarEx extends StatefulWidget {
  BottomBarEx({super.key});

  @override
  State<BottomBarEx> createState() => _BottomBarExState();
}

class _BottomBarExState extends State<BottomBarEx> {
  int index = 0;
  var screens = [FiAtm(), GridView1(), GridView2(), GridView3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.yellow,
          currentIndex: index,
          onTap: (tappedindex) {
            setState(() {
              index = tappedindex;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded), label: 'Reels'),
            BottomNavigationBarItem(
                icon: Icon(Icons.park_rounded), label: 'notify'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'profile'),
          ]),
      body: screens[index],
    );
  }
}
