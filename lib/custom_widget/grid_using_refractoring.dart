import 'package:flutter/material.dart';
import 'package:flutter_app1/custom_widget/refratoring_widget.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: GridWithRefractoring(),
  ));
}

class GridWithRefractoring extends StatelessWidget {
  const GridWithRefractoring({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid with refractoring widget'),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
          children: [
            CustomCard(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1696774690902-6e2057307e20?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDN8UzRNS0xBc0JCNzR8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
              ),
              text: "Analog Watch",
              click: () {},
              click1: () {},
            ),
            CustomCard(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1695831440805-1b623520e70e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIzfFM0TUtMQXNCQjc0fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60'),
              text: "Casual Shoe",
              click: () {},
              click1: () {},
            ),
          ]),
    );
  }
}
