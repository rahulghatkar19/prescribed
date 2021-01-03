import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wlcm/main.dart';
import 'package:wlcm/style.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: blueDecor(),
          child: AnimatedSplashScreen(
            splash: Column(
              children: [
                Image.asset(
                  splash,
                  height: 200.0,
                ),
                spaceHeight,
                Text(
                  'Prescribed',
                  style: splashTxt,
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            splashIconSize: 250,
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            duration: 1500,
            nextScreen: Welcome(),
          ),
        ),
      ),
    );
  }
}
