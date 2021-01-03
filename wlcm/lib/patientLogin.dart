import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'style.dart';
import 'package:http/http.dart' as http;
import 'patientDashboard.dart';
import 'checks.dart';

class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  String username;
  bool indicator = false;
  String password;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String validate() {
    if (formkey.currentState.validate()) {
      return "Validated";
    } else {
      return "NotValidated";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blueDecor(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: crossAxis,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  patientLogin,
                  height: 200.0,
                ),
              ),
            ),
            spaceHeight,
            spaceHeight,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: curvedTopInterface(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      spaceHeight,
                      spaceHeight,
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            spaceHeight,
                            TextFormField(
                              cursorColor: Colors.orange,
                              decoration: textField(
                                  'Username', Icon(Icons.fingerprint)),
                              onChanged: (value) {
                                username = value;
                              },
                              validator: check,
                            ),
                            spaceHeight,
                            TextFormField(
                              obscureText: true,
                              cursorColor: Colors.orange,
                              decoration:
                                  textField('Password', Icon(Icons.lock)),
                              onChanged: (value) {
                                password = value;
                              },
                              validator: check,
                            ),
                            spaceHeight,
                            spaceHeight,
                          ],
                        ),
                      ),
                      spaceHeight,
                      spaceHeight,
                      indicator
                          ? orangeCircularIndicator()
                          : FlatButton(
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Colors.orange,
                                ),
                              ),
                              color: Colors.white,
                              child: Text(
                                'LogIn',
                                style: btnTxt,
                              ),
                              onPressed: () async {
                                void stateToggle(bool whatChange) {
                                  setState(() {
                                    indicator = whatChange;
                                  });
                                }

                                String valid = validate();

                                stateToggle(true);

                                if (validate() == "NotValidated") {
                                  stateToggle(false);
                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert('Check Incorrect Inputs.',
                                          'Enter all the details.');
                                    },
                                  );
                                } else {
                                  stateToggle(true);

                                  var jdata = {
                                    'action': 'storeForm51',
                                    'user': username,
                                    'pass': password,
                                  };

                                  var response =
                                      await http.post(myurl, body: jdata);
                                  print(
                                      'Response status: ${response.statusCode}');

                                  var exists = response.body;
                                  print(exists);
                                  if (exists == '0') {
                                    stateToggle(false);
                                    return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert('Incorrect Password.');
                                      },
                                    );
                                  } else if (exists == '1') {
                                    stateToggle(false);
                                    return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert('Create your account.',
                                            'Username does not exist.');
                                      },
                                    );
                                  } else {
                                    stateToggle(false);
                                    return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PatientDashboard(
                                              user: username);
                                        },
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
