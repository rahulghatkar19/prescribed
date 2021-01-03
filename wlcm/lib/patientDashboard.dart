import 'package:flutter/material.dart';
import 'package:wlcm/dbmodel.dart';

class PatientDashboard extends StatelessWidget {
  final String user;

  // receive data from the FirstScreen as a parameter
  PatientDashboard({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FlatButton(
              child: Text('INSERT'),
              onPressed: () async {
                print(user);
                int id1 = await DatabaseHelper.instance.insert({
                  DatabaseHelper.title: user,
                  DatabaseHelper.description: "BYE"
                });
                print(id1);
              },
              color: Colors.orange,
            ),
          ),
          FlatButton(
            child: Text('Select'),
            onPressed: () async {
              List<Map<String, dynamic>> rows =
                  await DatabaseHelper.instance.select();
              print(rows[5]);
            },
          ),
        ],
      ),
    );
  }
}
