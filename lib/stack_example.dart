import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackEx(),
  ));
}

class StackEx extends StatelessWidget {
  const StackEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Ex')),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
            ),
            Positioned(
              top: 180,
              left: 180,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.green,
              ),
            ),
            Container(
              height: 150,
              width: 150,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
