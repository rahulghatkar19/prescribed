import 'package:flutter/material.dart';

TextStyle kNrxStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    fontFamily: 'Comfortaa');
TextStyle kNormalStyle = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontFamily: 'Comfortaa',
);

class Medicine extends StatelessWidget {
  const Medicine({
    Key key,
    @required this.medColor,
    @required this.medName,
    @required this.isNrx,
  }) : super(key: key);

  final Color medColor;
  final String medName;
  final bool isNrx;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: isNrx ? Colors.red : medColor,
                width: isNrx ? 3.0 : 1.5,
              ),
            )),
            child: Text(medName, style: isNrx ? kNrxStyle : kNormalStyle),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: isNrx ? Colors.red : medColor,
                width: isNrx ? 3.0 : 1.5,
              ),
            )),
            child: Text('2 x 15 days', style: isNrx ? kNrxStyle : kNormalStyle),
          ),
        ],
      ),
    );
  }
}
