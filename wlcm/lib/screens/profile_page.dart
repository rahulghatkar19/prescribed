import 'package:wlcm/constant.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kDarkBlueColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/umg.jpg'),
                ),
                SizedBox(height: 12),
                Text(
                  'Umang Somani',
                  style: kTitleTextstyle,
                ),
                SizedBox(height: 12),
                Text(
                  'Student | Age 21',
                  style: kSubTextStyle,
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: kDarkBlueColor,
                    thickness: 1.3,
                    endIndent: 1.0,
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: kPrimaryColor,
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: kPrimaryColor,
                    ),
                    // dense: true,
                    title: Text(
                      '+91-123456789',
                      style: TextStyle(
                        color: kPrimaryColor,
                        // fontFamily: 'Source Sans Pro',
                        // fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: kPrimaryColor,
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: kPrimaryColor,
                    ),
                    // dense: true,
                    title: Text(
                      'umang@usa.com',
                      style: TextStyle(
                        // fontSize: 20.0,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
