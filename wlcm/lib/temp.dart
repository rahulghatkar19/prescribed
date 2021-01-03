//Text(
//'Already a User?',
//style: headTxt,
//),
//SizedBox(
//height: 40.0,
//),
//
//child: FlatButton(
//shape: StadiumBorder(
//side: BorderSide(
//color: Colors.orange,
//),
//),
//child: Ink(
//decoration: BoxDecoration(
//gradient: LinearGradient(colors: [
//Colors.purple,
//Colors.indigo,
//Colors.blue,
//]),
//),
//),
//),
//TextField(
//decoration: InputDecoration(
//border: OutlineInputBorder(),
//labelText: 'Username',
//),
//onChanged: (value) {
//username = value;
////              print(username);
//},
//),
//SizedBox(
//height: 20.0,
//),
//TextField(
//obscureText: true,
//decoration: InputDecoration(
//border: OutlineInputBorder(),
//labelText: 'Password',
//),
//onChanged: (value) {
//password = value;
//},
//),
//RaisedButton(
//child: Text('Login'),
//onPressed: () async {
//var url =
//    'https://warapara.000webhostapp.com/includes/controller.php?action=storeForm1&text=$username&id=3&';
//var response = await http.post(url, body: {
//'action': 'storeForm1',
//'text': 'RAHULLL',
//'id': '3',
//});
//print('Response status: ${response.statusCode}');
//print('Response body: ${response.body}');
//},
//)
//],

//  CAPSULE TEXTFIELD
//enabledBorder: OutlineInputBorder(
//borderRadius: BorderRadius.circular(45.0),
//borderSide: BorderSide(color: Colors.orange),
//),
//border: OutlineInputBorder(
//borderRadius: new BorderRadius.circular(45.0),
//borderSide: new BorderSide(
//color: Colors.orange,
//),
//),
//focusedBorder: OutlineInputBorder(
//borderRadius: new BorderRadius.circular(45.0),
//borderSide: BorderSide(color: violet),
//),

//SCAFFOLD GRADIENT BG COLOR
//return Container(
//decoration: BoxDecoration(
//gradient: LinearGradient(
//colors: [Colors.orange[900], Colors.orange[800], Colors.orange[400]],
//)),
//child: Scaffold(
////resizeToAvoidBottomInset: false,
//backgroundColor: Colors.transparent,
