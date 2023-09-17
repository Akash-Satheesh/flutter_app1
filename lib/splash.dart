import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // to run an app
  runApp(MaterialApp(
    // default theme of our flutter app
    home: SplashPage(), // initial page to be launched while running an app
  ));
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //backgroundColor: Colors.white,
        body: Container(
      // decoration: BoxDecoration(color: Colors.grey),
      decoration: BoxDecoration(
          //image: DecorationImage(
          //fit: BoxFit.cover,
          //image: NetworkImage(
          // "https://images.unsplash.com/photo-1605217074754-7163c10f5804?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDd8aVVJc25WdGpCMFl8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Colors.amber,
            Colors.grey,
            Colors.blueGrey,
            Colors.black38,
          ])),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(Icons.facebook_outlined, size: 60, color: Colors.blue),
          // Image(
          //   image: AssetImage(
          //       "assets/icons/Simpleicons-Team-Simple-Alwaysdata.512(1).png"),
          //   width: 100,
          //   height: 100,
          // ),
          Image(
            image: NetworkImage(
                "https://icons.iconarchive.com/icons/simpleicons-team/simple/128/alwaysdata-icon.png"),
            width: 100,
            height: 100,
          ),

          Text(
            "ALWAYS DATA",
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Text(
              //"Powered by META",
              //style: TextStyle(
              //fontSize: 20,
              //color: Colors.blue,
              //),
              //),
            ],
          )
        ],
      )),
    ));
  }
}
