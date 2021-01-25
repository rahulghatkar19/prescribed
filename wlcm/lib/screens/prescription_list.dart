import 'package:wlcm/constant.dart';
import 'package:wlcm/screens/prescription_screen.dart';
import 'package:flutter/material.dart';

class PrescriptionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
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

class PrescriptionList extends StatefulWidget {
  @override
  _PrescriptionListState createState() => _PrescriptionListState();
}

class _PrescriptionListState extends State<PrescriptionList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PRESCRIPTIONS',
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
                clipper: PrescriptionClipper(),
                child: Container(
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/doctor.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Consultations',
                      style: kTitleTextstyle,
                    ),
                    PrescriptionTile(
                        name: 'Dr. Himanshu Salagare', date: '30/12/2021'),
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
                      child: PrescriptionTile(
                          name: 'Dr. Umang Somani', date: '20/11/2021'),
                    ),
                    PrescriptionTile(
                        name: 'Dr Harshad Mehta', date: '12/08/2021'),
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

class PrescriptionTile extends StatelessWidget {
  const PrescriptionTile({
    Key key,
    @required this.name,
    @required this.date,
  }) : super(key: key);
  final String name;
  final String date;
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
            Icons.album_outlined,
            color: kBlueColor,
          ),
          trailing: Icon(
            Icons.edit,
            color: kBlueColor,
          ),
          title: Text(name),
          subtitle: Text('$date'),
          dense: true,
        ),
      ),
    );
  }
}
