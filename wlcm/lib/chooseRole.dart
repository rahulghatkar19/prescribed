import 'package:flutter/material.dart';
import 'style.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class ChooseRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white, //Color(0xff758ed0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: crossAxis,
          mainAxisAlignment: mainAxis,
          children: [
            Spacer(
              flex: 1,
            ),
            Center(
              child: Text(
                "- Choose your Role -",
                style: headTxt,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/doctor');
              },
              child: CircleAvatar(
                backgroundColor: korange, //Colors.orange,
                radius: 105.0,
                child: gradientAvatar(doctor1, 175.0),
              ),
            ),
            Center(
              child: Text(
                "Doctor",
                style: normalTxt,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/patient');
              },
              child: CircleAvatar(
                backgroundColor: korange, //Colors.orange,
                radius: 105.0,
                child: gradientAvatar(patient1, 150.0),
              ),
            ),
            Center(
              child: Text(
                "Patient",
                style: normalTxt,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
