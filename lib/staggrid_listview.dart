import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: StaggeredGrid2(),
  ));
}

// ignore: must_be_immutable
class StaggeredGrid2 extends StatelessWidget {
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
  var cac = [2, 2, 2, 2, 3, 2, 2, 3, 2, 2];
  var mac = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2];
  StaggeredGrid2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered grid view'),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          children: List.generate(
              10,
              (index) => StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Card(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Icon(icons[index]),
                  ))),
        ),
      ),
    );
  }
}
