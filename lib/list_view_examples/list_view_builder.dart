import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView_Builder(),
  ));
}

class ListView_Builder extends StatelessWidget {
  var icons = [
    Icons.access_alarm,
    Icons.ad_units_rounded,
    Icons.work_off_rounded,
    Icons.wordpress_sharp,
    Icons.add_circle_sharp,
    Icons.wifi_tethering_error_rounded_sharp,
    Icons.add_moderator_rounded,
    Icons.west_outlined,
    Icons.airline_seat_legroom_extra_rounded,
    Icons.airport_shuttle_outlined
  ];
  ListView_Builder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView(children: [
        const ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.insert_link_outlined),
            backgroundColor: Colors.teal,
          ),
          title: Text('Create call link'),
          subtitle: Text('Share a link'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text('Recent'),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('hello'),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.call_missed_rounded,
                        color: Colors.red,
                      ),
                      Text('My data'),
                    ],
                  ),
                  leading: Icon(Icons.ac_unit_outlined),
                  trailing: Icon(Icons.shopping_cart),
                ),
              );
            }),
      ]),
    );
  }
}
