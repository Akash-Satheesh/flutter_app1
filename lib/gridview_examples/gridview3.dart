import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: GridView3(),
  ));
}

class GridView3 extends StatelessWidget {
  const GridView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
              15,
              (index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1692071097529-320eb2b32292?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQzfHhqUFI0aGxrQkdBfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
                          height: 80,
                        ),
                        const Text(
                          'Food 1',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          '120 \$',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
