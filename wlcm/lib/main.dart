import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlcm/splash.dart';
import 'chooseRole.dart';
import 'doctor.dart';
import 'patient.dart';

//void main() {
//  runApp(Welcome());
//}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ChooseRole(),
        '/doctor': (context) => Doctor(),
        '/patient': (context) => Patient(),
      },
    );
  }
}
