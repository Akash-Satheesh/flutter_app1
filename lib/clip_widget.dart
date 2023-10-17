import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ClipWidget(),
  ));
}

class ClipWidget extends StatelessWidget {
  const ClipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ClipRect(
              child: Container(
                child: Align(
                  widthFactor: .4,
                  heightFactor: .4,
                  alignment: Alignment.center,
                  child: Image.network(
                      'https://images.unsplash.com/photo-1696758011667-346ef53c70d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNjB8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Container(
                // height: 200,
                // width: 200,
                child: Image.network(
                    'https://images.unsplash.com/photo-1504600770771-fb03a6961d33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c3F1YXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipOval(
              child: Image.network(
                  'https://images.unsplash.com/photo-1505299344687-ee45ad431f9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHNxdWFyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60'),
            ),
            SizedBox(
              height: 20,
            ),
            ClipPath(
              clipper: StarClipper(8),
              child: Container(
                child: Image.network(
                    'https://images.unsplash.com/photo-1505299344687-ee45ad431f9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHNxdWFyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
