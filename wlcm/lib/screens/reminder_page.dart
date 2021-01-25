import 'package:wlcm/constant.dart';
import 'package:wlcm/screens/prescription_screen.dart';
import 'package:wlcm/widgets/rounded_box.dart';
import 'package:flutter/material.dart';

class ReminderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    // path.relativeArcToPoint(Offset.zero);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ALARM',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kDarkBlueColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_alarm),
          backgroundColor: kDarkBlueColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipPath(
                clipper: ReminderClipper(),
                child: Container(
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/reminder.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your reminders',
                      style: kTitleTextstyle,
                    ),
                    AlarmTile(
                      medicine: 'Ivermectin 10',
                      time: 7,
                      specification: 'After breakfast',
                    ),
                    AlarmTile(
                      medicine: 'Almox 250',
                      time: 12,
                      specification: 'After lunch',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmTile extends StatelessWidget {
  const AlarmTile({
    Key key,
    @required this.medicine,
    @required this.time,
    @required this.specification,
  }) : super(key: key);
  final String medicine;
  final String specification;
  final int time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kBlueColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: Icon(
            Icons.notifications_active,
            color: kBlueColor,
          ),
          trailing: Icon(
            Icons.edit,
            color: kBlueColor,
          ),
          title: Text(medicine),
          subtitle: Text('7$time - $specification'),
          dense: true,
        ),
      ),
    );
  }
}
