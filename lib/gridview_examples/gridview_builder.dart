import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: GridView2(),
  ));
}

class GridView2 extends StatelessWidget {
  const GridView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(child: const Text('hello')),
            );
          }),
    );
  }
}
