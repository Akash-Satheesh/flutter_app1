import 'package:flutter/material.dart';
import 'package:flutter_app1/passing%20data%20between%20screens/using%20constructor/tostateful_page.dart';
import 'package:flutter_app1/passing%20data%20between%20screens/using%20constructor/tostateless_page.dart';
import 'package:flutter_app1/passing%20data%20between%20screens/using%20navigator/dummy_data.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: MainPage2(),
  ));
}

class MainPage2 extends StatelessWidget {
  const MainPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Passing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DataStateless(
                        name: "Luminar",
                        location: "Kakkanad",
                        phone: 9645511065,
                        img: products[0]['image']))),
                child: Text('To Stateless')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DataStateful(
                        name: "Luminar",
                        location: "Kakkanad",
                        phone: 9645511065,
                        img: products[0]['image']))),
                child: Text('To Statefull'))
          ],
        ),
      ),
    );
  }
}
