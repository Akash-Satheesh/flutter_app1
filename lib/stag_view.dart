import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: StaggeredGridd(),
  ));
}

class StaggeredGridd extends StatelessWidget {
  const StaggeredGridd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered grid view'),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 5,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.green,
                  child: Center(
                    child: Icon(Icons.account_balance),
                  ),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: Icon(Icons.account_circle_rounded),
                  ),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Card(
                  color: Colors.yellow,
                  child: Center(
                    child: Icon(Icons.spa),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
