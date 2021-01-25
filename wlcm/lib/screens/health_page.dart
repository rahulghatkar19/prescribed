import 'package:wlcm/constant.dart';
import 'package:wlcm/screens/prescription_list.dart';
import 'package:wlcm/widgets/circular_box.dart';
import 'package:wlcm/widgets/cover_dec.dart';
import 'package:wlcm/widgets/rounded_box.dart';
import 'package:flutter/material.dart';
class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  List<String> doctorList = [
    "Dr Umang Somani",
    "Dr Harshad Mehta",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoverDec(
                height: 260,
                childContent: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your Health Stats',
                        style: kHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
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
                    ],
                  ),
                ),
              ),
              RoundedBox(
                boxBody: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search record'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 28.0, right: 28.0),
                child: Row(
                  children: [
                    Text(
                      'Recent Consultations',
                      style: kTitleTextstyle,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PrescriptionList();
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
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: doctorList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kBlueColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.album_outlined,
                              color: kBlueColor,
                            ),
                            title: Text(doctorList[index]),
                            subtitle: Text('20/02/21'),
                            dense: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
