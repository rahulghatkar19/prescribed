import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wlcm/doctorLogin.dart';
import 'style.dart';
import 'package:http/http.dart' as http;
import 'checks.dart';

class Doctor extends StatefulWidget {
  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  //TextEditingController fctrl;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //bool pressed = false;
  //bool pressedL = false;
  bool pressedM = false;
  bool pressedF = false;
  bool pressedO = false;
  String username, password, gender, fname, lname, license, phone, email;
  bool indicator = false;
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
          mainAxisAlignment: mainAxis,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  signup2,
                  height: 175.0,
                ),
              ),
            ),
            spaceHeight,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: curvedTopInterface(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.orange,
                              decoration: textField(
                                  'First Name', Icon(Icons.account_box)),
                              onChanged: (value) {
                                fname = value;
                              },
                              validator: check,
                            ),
                            spaceHeight,
                            TextFormField(
                              cursorColor: Colors.orange,
                              decoration: textField(
                                  'Last Name', Icon(Icons.account_box)),
                              onChanged: (value) {
                                lname = value;
                              },
                              validator: check,
                            ),
                            spaceHeight,
                            TextFormField(
                              cursorColor: Colors.orange,
                              decoration: textField(
                                  'Unique Permanent Registration No.',
                                  Icon(Icons.library_books)),
                              onChanged: (value) {
                                license = value;
                              },
                              validator: check,
                            ),
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
                              validator: passwordcheck,
                            ),
                            spaceHeight,
                            spaceHeight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.orange,
                                    ),
                                  ),
                                  color:
                                      pressedM ? Colors.orange : Colors.white,
                                  child: Text(
                                    'Male',
                                    style: btnTxt,
                                  ),
                                  onPressed: () {
                                    gender = 'M';
                                    setState(() {
                                      pressedM = !pressedM;
                                      pressedF = false;
                                      pressedO = false;
                                    });
                                  },
                                ),
                                FlatButton(
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.orange,
                                    ),
                                  ),
                                  color:
                                      pressedF ? Colors.orange : Colors.white,
                                  child: Text(
                                    'Female',
                                    style: btnTxt,
                                  ),
                                  onPressed: () {
                                    gender = 'F';
                                    setState(() {
                                      pressedF = !pressedF;
                                      pressedM = false;
                                      pressedO = false;
                                    });
                                  },
                                ),
                                FlatButton(
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.orange,
                                    ),
                                  ),
                                  color:
                                      pressedO ? Colors.orange : Colors.white,
                                  child: Text(
                                    'Others',
                                    style: btnTxt,
                                  ),
                                  onPressed: () {
                                    gender = 'O';
                                    setState(() {
                                      pressedO = !pressedO;
                                      pressedM = false;
                                      pressedF = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            spaceHeight,
                            spaceHeight,
                            TextFormField(
                              cursorColor: Colors.orange,
                              decoration: textField('Phone', Icon(Icons.phone)),
                              onChanged: (value) {
                                phone = value;
                              },
                              keyboardType: TextInputType.number,
                              validator: phonecheck,
                              maxLength: 10,
                            ),
                            TextFormField(
                              cursorColor: Colors.orange,
                              decoration:
                                  textField('EmailID', Icon(Icons.email)),
                              onChanged: (value) {
                                email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              validator: check,
                            ),
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
                                'SignUp',
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
                                } else if (gender == null) {
                                  stateToggle(false);
                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert('Choose your Gender.');
                                    },
                                  );
                                } else {
                                  stateToggle(true);

                                  var jdata = {
                                    'action': 'storeForm4',
                                    'fname': fname,
                                    'lname': lname,
                                    'license': license,
                                    'user': username,
                                    'pass': password,
                                    'gender': gender,
                                    'phone': phone,
                                    'email': email
                                  };

                                  var response =
                                      await http.post(myurl, body: jdata);
                                  print(
                                      'Response status: ${response.statusCode}');
                                  /*var jbody = jsonDecode(response.body);
                                  print(jbody); //Fname*/

                                  var exists = response.body;
                                  print(exists);
                                  if (exists == '0') {
                                    stateToggle(false);
                                    return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert('Username already taken.',
                                            'Try a different username.');
                                      },
                                    );
                                  } else {
                                    stateToggle(false);
                                    return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DoctorLogin();
                                        },
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                      spaceHeight,
                      spaceHeight,
                      spaceHeight,
                      spaceHeight,
                      spaceHeight,
                      Text(
                        'Already a User?',
                        style: btnTxt,
                      ),
                      spaceHeight,
                      FlatButton(
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
                        onPressed: () {
                          return Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DoctorLogin();
                              },
                            ),
                          );
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
