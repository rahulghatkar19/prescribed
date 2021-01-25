import 'package:wlcm/constant.dart';
import 'package:flutter/material.dart';

class CoverDec extends StatefulWidget {
  CoverDec({@required this.childContent, @required this.height});
  final childContent;
  final double height;
  @override
  _CoverDecState createState() => _CoverDecState();
}

class _CoverDecState extends State<CoverDec> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          height: widget.height,
          child: widget.childContent,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kDarkBlueColor,
                kBlueColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    // path.relativeArcToPoint(Offset.zero);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
