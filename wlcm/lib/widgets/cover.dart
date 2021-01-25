import 'package:wlcm/constant.dart';
import 'package:wlcm/widgets/cover_dec.dart';
import 'package:flutter/material.dart';

class Cover extends StatefulWidget {
  Cover({@required this.childContent, @required this.coverAvatar});
  final childContent;
  final coverAvatar;

  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> {
  final double circleRadius = 90.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Padding(
                padding: EdgeInsets.only(top: circleRadius / 2.0),
                child: Container(
                  padding: EdgeInsets.only(top: circleRadius / 1.8),
                  height: 280,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        kDarkBlueColor,
                        kBlueColor,
                      ],
                    ),
                  ),
                  child: widget.childContent,
                ),
              ),
            ),

            // avatar
            Container(
              width: circleRadius,
              height: circleRadius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 280,
                    backgroundImage: AssetImage('assets/images/umg.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
