import 'package:flutter/material.dart';
import 'package:flutter_app1/stateful_splash.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: IntroScreen(),
  ));
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageDecoration decorationPage = PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        bodyTextStyle: TextStyle(
            fontSize: 20, fontStyle: FontStyle.italic, color: Colors.brown),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.yellow, Colors.orangeAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)));
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: decorationPage,
          title: "First Page",
          body:
              "Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.",
          image: IntroImage(
              "https://images.unsplash.com/photo-1697017669892-45ed5ed77161?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
        ),
        PageViewModel(
          decoration: decorationPage,
          title: "Second Page",
          body:
              "Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.",
          image: IntroImage(
              "https://images.unsplash.com/photo-1693801873499-0b870dfca80a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
        ),
        PageViewModel(
          decoration: decorationPage,
          title: "Third Page",
          body:
              "Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.",
          image: IntroImage(
              "https://images.unsplash.com/photo-1696827926099-c4eab4331e51?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
        ),
      ],
      onSkip: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Splash2())),
      onDone: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Splash2())),
      showSkipButton: true,
      skip: Text('Skip'),
      // showBackButton: true,
      //back: Text('Back'),
      next: Icon(Icons.arrow_forward_sharp),
      done: Text('Done'),
      dotsDecorator: DotsDecorator(
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))),
          size: Size(12, 10),
          activeSize: Size(22, 10),
          activeColor: Colors.green),
    );
  }

  Widget IntroImage(String imgpath) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imgpath))),
      ),
    );
  }
}
