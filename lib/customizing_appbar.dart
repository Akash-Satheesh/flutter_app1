import 'package:flutter/material.dart';
import 'package:flutter_app1/list_view_examples/listview2.dart';
import 'package:flutter_app1/list_view_examples/listview_constructor.dart';
import 'package:flutter_app1/login_page.dart';

//import 'package:flutter_app1/registration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: AppBar1(),
  ));
}

class AppBar1 extends StatelessWidget {
  const AppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
          actions: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 15),
            Icon(Icons.search_rounded),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('New Group'),
                ),
                PopupMenuItem(child: Text('New Boadcast')),
                PopupMenuItem(child: Text('Linked devices')),
                PopupMenuItem(child: Text('Starred Messages')),
                PopupMenuItem(child: Text('Payment')),
                PopupMenuItem(child: Text('Settings'))
              ];
            }),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Container(
                child: TabBar(
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 50),
                    tabs: [
                      Tab(
                        icon: FaIcon(FontAwesomeIcons.users),
                      ),
                      Tab(
                        text: 'Chats',
                      ),
                      Tab(
                        text: 'Status',
                      ),
                      Tab(
                        text: 'Calls',
                      )
                    ]),
              )),
        ),
        body: TabBarView(children: [
          ListView(),
          ListView1(),
          LoginPage(),
          ListView2(),
        ]),
      ),
    );
  }
}
