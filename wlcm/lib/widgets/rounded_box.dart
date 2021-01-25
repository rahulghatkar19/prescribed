import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    @required this.boxBody,
    Key key,
  }) : super(key: key);

  final Widget boxBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
      ),
      child: boxBody,
    );
  }
}
