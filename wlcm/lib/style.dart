import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

const myurl = 'https://warapara.000webhostapp.com/includes/controller.php';

const splash = 'images/signup.png';
const splash1 = 'images/splash1.jpeg';
const signup2 = 'images/signup0.png';
const login = 'images/login.png';
const doctor1 = 'images/doctor1.png';
const patient1 = 'images/patient1.png';
const patientLogin = 'images/patientLogin.png';

var headTxt = TextStyle(
  color: violet, //Color(0xff0490c1),
  fontFamily: 'Comfortaa',
  fontSize: 30.0,
);

var headTxt1 = TextStyle(
  letterSpacing: 2,
  color: Colors.white, //Color(0xff0490c1),
  fontFamily: 'Comfortaa',
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);

const splashTxt = TextStyle(
  color: Colors.orange, //Color(0xff0490c1),
  fontFamily: 'Comfortaa',
  fontSize: 25.0,
);

var btnTxt = TextStyle(
  color: Colors.black, //Color(0xff0490c1),
  fontFamily: 'Comfortaa',
  fontSize: 20.0,
);

var normalTxt = TextStyle(
  color: Colors.black, //Color(0xff0490c1),
  fontFamily: 'Comfortaa',
  fontSize: 20.0,
);

var crossAxis = CrossAxisAlignment.stretch;

var mainAxis = MainAxisAlignment.center;

var blu = Color(0xFF4056C6); //.withOpacity(.15); //Color(0xff374671);
var maroon = Color(0xffd34c59);
var violet = Color(0xff40284a);
const korange = Color(0xFFFF8748);
const sl = GradientColors.skyLine;

const spaceHeight = SizedBox(
  height: 10.0,
);

InputDecoration textField(String hint, Icon iconName) {
  var inputDecor = InputDecoration(
    prefixIcon: iconName,
    hintText: hint,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: korange), //Colors.orange),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: korange), //Colors.orange),
    ),
  );
  return inputDecor;
}

AlertDialog alert(String lin2, [String lin1 = 'Note:']) {
  return AlertDialog(
    title: Icon(
      Icons.error,
      size: 60.0,
      color: maroon,
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: mainAxis,
        children: [
          Text(
            lin1,
            style: btnTxt,
          ),
          Text(
            lin2,
            style: btnTxt,
          ),
        ],
      ),
    ),
  );
}

BoxDecoration curvedTopInterface() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );
}

CircularProgressIndicator orangeCircularIndicator() {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
  );
}

Container gradientAvatar(String imgName, double ht) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF3383CD),
          Color(0xFF11249F),
        ],
      ),
    ),
    child: CircleAvatar(
      radius: 100.0,
      backgroundColor: Colors.transparent, //Color(0xff02a3da),
      child: Image.asset(
        //'images/doctor.png',
        imgName,
        height: ht,
      ),
    ),
  );
}

BoxDecoration blueDecor() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF3383CD),
        Color(0xFF11249F),
      ],
    ),
  );
}
