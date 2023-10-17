import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  NetworkImage? image;
  String? text;
  IconData? icon;
  VoidCallback? click;
  VoidCallback? click1;
  CustomCard(
      {required this.image,
      required this.text,
      this.icon,
      required this.click,
      required this.click1});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(children: [
            Image(
              image: image!,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            )
          ]),
          Text(
            text!,
            style: GoogleFonts.satisfy(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          // Icon(
          //   icon!,
          //   size: 15,
          //   color: Colors.white,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: click,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
              ElevatedButton(onPressed: click, child: const Text('Buy now'))
            ],
          )
        ],
      ),
    );
  }
}
