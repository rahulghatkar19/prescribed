import 'package:flutter/material.dart';

class CirclularBox extends StatelessWidget {
  const CirclularBox({
    Key key,
    @required this.shadowColor,
    @required this.textContent,
    @required this.description,
  }) : super(key: key);
  final String textContent;
  final Color shadowColor;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 54,
          width: 54,
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  // offset: Offset(0.0, 5.0),
                ),
              ],
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                textContent,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
