import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(MaterialApp(
    home: FiAtm(),
  ));
}

class FiAtm extends StatelessWidget {
  const FiAtm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.teal)),
            Positioned(
              top: 80,
              left: 30,
              child: Row(
                children: [
                  Transform.rotate(
                    angle: 1800 * pi / 90,
                    child: Image.network(
                      'https://icons.iconarchive.com/icons/fatcow/farm-fresh/32/card-chip-silver-icon.png',
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Transform.rotate(
                      angle: 90 * pi / 180,
                      child: FaIcon(
                        FontAwesomeIcons.wifi,
                        color: Colors.grey,
                        size: 40,
                      ))
                ],
              ),
            ),
            Positioned(
                top: 190,
                left: 20,
                child: Text(
                  'Akash S Nair',
                  style: GoogleFonts.charm(fontSize: 28, color: Colors.grey),
                )),
            Positioned(
                top: 190,
                right: 20,
                child: Text(
                  'VISA',
                  style: GoogleFonts.cutive(fontSize: 20, color: Colors.grey),
                )),
            Positioned(
                top: 20,
                right: 30,
                child: GradientText(
                  'Fi',
                  style: GoogleFonts.cutive(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  colors: [Colors.black38, Colors.white, Colors.black26],
                ))
          ],
        ),
      ),
    );
  }
}
