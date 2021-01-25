// import 'package:flutter/material.dart';
// import 'package:wlcm/dbmodel.dart';

// class PatientDashboard extends StatelessWidget {
//   final String user;

//   // receive data from the FirstScreen as a parameter
//   PatientDashboard({Key key, @required this.user}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: FlatButton(
//               child: Text('INSERT'),
//               onPressed: () async {
//                 print(user);
//                 int id1 = await DatabaseHelper.instance.insert({
//                   DatabaseHelper.title: user,
//                   DatabaseHelper.description: "BYE"
//                 });
//                 print(id1);
//               },
//               color: Colors.orange,
//             ),
//           ),
//           FlatButton(
//             child: Text('Select'),
//             onPressed: () async {
//               List<Map<String, dynamic>> rows =
//                   await DatabaseHelper.instance.select();
//               print(rows[5]);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:wlcm/constant.dart';
import 'package:wlcm/screens/health_page.dart';
import 'package:wlcm/screens/prescription_screen.dart';
import 'package:wlcm/widgets/circular_box.dart';
import 'package:wlcm/widgets/cover.dart';
import 'package:wlcm/widgets/medicine_pill.dart';
import 'package:wlcm/widgets/rounded_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'HOME',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kDarkBlueColor,
        ),
        body: Container(
          // padding: EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Cover(
                  coverAvatar: Image.asset('assets/images/umg.jpg'),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CirclularBox(
                              shadowColor: Colors.orange,
                              textContent: '6.8',
                              description: 'Rating',
                            ),
                            SizedBox(width: 24.0),
                            CirclularBox(
                              shadowColor: Colors.red,
                              textContent: '9',
                              description: 'Medicines',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HealthPage();
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
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.only(top: 16.0, left: 28.0, right: 28.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Upcoming Medicine',
                          style: kTitleTextstyle,
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
                            "See all",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Medicine(
                      medColor: kDeathColor,
                      medName: 'Ecosprin AV 75',
                      isNrx: false,
                    ),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 24.0, right: 24.0, top: 16.0, bottom: 16.0),
              //   child: Row(
              //     children: <Widget>[
              //       RichText(
              //         text: TextSpan(
              //           children: [
              //             TextSpan(
              //               text: "Upcoming medicine\n",
              //               style: kTitleTextstyle,
              //             ),
              //             TextSpan(
              //               text: "Ecosprin AV 75",
              //               style: TextStyle(
              //                 color: kTextLightColor,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Spacer(),
              //       GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) {
              //                 return PrescriptionScreen();
              //               },
              //             ),
              //           );
              //         },
              //         child: Text(
              //           "See details",
              //           style: TextStyle(
              //             color: kPrimaryColor,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
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
