import 'package:covid_19/constant.dart';
import 'package:covid_19/screens/prescription_screen.dart';
import 'package:covid_19/screens/rounded_box.dart';
import 'package:covid_19/widgets/cover.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'HOME',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cover(
                  childContent: Column(
                    children: [
                      Text(
                        'Umang Somani',
                        style: kHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Age 21 | Male',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CirclularBox(
                              shadowColor: Colors.orange,
                              textContent: '25',
                              description: 'Height',
                            ),
                            SizedBox(width: 24),
                            CirclularBox(
                              shadowColor: Colors.green,
                              textContent: '25',
                              description: 'Weight',
                            ),
                            SizedBox(width: 24),
                            CirclularBox(
                              shadowColor: Colors.red,
                              textContent: '78',
                              description: 'BMI',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  child: RoundedBox(
                    boxBody: Row(
                      children: [
                        Icon(Icons.arrow_circle_up_outlined),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text('Check your health!'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 16.0, bottom: 16.0),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Ongoing medicines\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Ecosprin AV 75",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PrescriptionScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "See details",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
// blue  header part
// MyHeader(
//   image: "assets/icons/Drcorona.svg",
//   textTop: "All you need",
//   textBottom: "is stay home.",
//   offset: offset,
// ),

// 3 VALUES
// Container(
//   padding: EdgeInsets.all(20),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(20),
//     color: kActiveShadowColor,
//     boxShadow: [
//       BoxShadow(
//         offset: Offset(0, 4),
//         blurRadius: 30,
//         color: kShadowColor,
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Counter(
//         color: kRecovercolor,
//         number: 46,
//         title: "BMI",
//       ),
//       Counter(
//         color: kDeathColor,
//         number: 16,
//         title: "Haemoglobin",
//       ),
//       Counter(
//         color: kInfectedColor,
//         number: 162,
//         title: "B.P",
//       ),
//     ],
//   ),
// ),
