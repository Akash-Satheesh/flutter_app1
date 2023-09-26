import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView2(),
  ));
}

// ignore: must_be_immutable
class ListView2 extends StatelessWidget {
  var title = [
    "data 1",
    'data 2',
    'data 3',
    'data 4',
    'data 5',
    'data 6',
    'data 7',
    'data 8',
    'data 9',
    'data 10',
  ];
  var subti = [20, 30, 40, 50, 60, 70, 80, 90, 110, 120];
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
  ListView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List View 2'),
        ),
        body: ListView(
          children: List.generate(
              10,
              (index) => Card(
                    child: ListTile(
                      title: Text(title[index]),
                      subtitle: Text('${subti[index]}'),
                      leading: Icon(icons[index]),
                      trailing: Icon(Icons.shopping_cart),
                    ),
                  )),
        ));
  }
}
