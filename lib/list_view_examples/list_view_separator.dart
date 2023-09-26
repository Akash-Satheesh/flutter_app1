import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView_Separator(),
  ));
}

class ListView_Separator extends StatelessWidget {
  const ListView_Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.Separator"),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, i) {
            return const Card(
              child: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.teal,
              ),
            );
          },
          separatorBuilder: (ctx, i) {
            if (i % 4 == 0) {
              return Divider(
                color: Colors.primaries[i % Colors.primaries.length],
                thickness: 3,
              );
            } else {
              return SizedBox();
            }
          },
          itemCount: 15),
    );
  }
}
