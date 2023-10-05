import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LottieEx(),
  ));
}

class LottieEx extends StatelessWidget {
  const LottieEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://lottie.host/dfe11ccc-bc3b-4ea2-90e6-0a1704e6958d/Pgs7lOZuvt.json"),
        // child: Lottie.asset(
        //     "flutter_app1/assets/animation/animation_ln2onajt.json"),
      ),
    );
  }
}
