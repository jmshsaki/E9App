import 'package:e9care/Screens/Auth/login_screen.dart';
import 'package:e9care/controllers/databasehelpers.dart';
import 'package:e9care/main.dart';
import 'package:e9care/radio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  late String title;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  //Radio Button Properties
  String radioButtonItem = 'Male';
  int id = 1;

  //Date Time for DOB properties
  var selectedDate;
  var timeStamp;
  var anotherDateTime;

  SingingCharacter? _character = SingingCharacter.lafayette;
  DataBaseHelper databaseHelper = DataBaseHelper();

  String msgStatus = '';

  //All registration fields controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        databaseHelper
            .registerUserData(
                _nameController.text.trim(),
                _emailController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status) {
            _showDialog();
            msgStatus = 'Check mobile number or password';
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => const MainPage()),
                (Route<dynamic> route) => false);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New User Registration',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text('New User Registration')),
        ),
        body: ListView(
          padding: const EdgeInsets.only(
              top: 62, left: 12.0, right: 12.0, bottom: 12.0),
          children: <Widget>[
            SizedBox(
                height: 90, child: Image.asset('assets/logo.png', height: 90)),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Name Here',
                  hintText: '',
                  icon: Icon(Icons.person),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text('Select your Gender',
                        style: TextStyle(fontSize: 18))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'Male';
                          id = 1;
                        });
                      },
                    ),
                    Text(
                      'Male',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'Female';
                          id = 2;
                        });
                      },
                    ),
                    Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text('${DateFormat('dd/MM/yyyy').format(selectedDate)}'),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text("Select your date of birth"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: '',
                  icon: Icon(Icons.phone),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
              child: TextField(
                // controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Write Address',
                  hintText: '',
                  icon: Icon(Icons.text_fields),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: '',
                  icon: Icon(Icons.vpn_key),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 44.0),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                onPressed: _onPressed,
                color: Colors.green,
                child: const Text(
                  'Register Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Wrap(
                  children: <Widget>[
                    const Text(
                      'Are You a Registered User? ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Click Here to Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF000000),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 44.0),
            ),
            Container(
              height: 50,
              child: Text(
                '$msgStatus',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 44.0),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Failed!'),
            content: const Text('Check your mobile number or password!'),
            actions: <Widget>[
              RaisedButton(
                child: const Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

// SizedBox(
// height: 50,
// child: ListTile(
// title: const Text('Male'),
// leading: Radio<SingingCharacter>(
// value: SingingCharacter.lafayette,
// groupValue: _character,
// onChanged: (SingingCharacter? value) {
// setState(() {
// _character = value;
// });
// },
// ),
// ),
// ),
// SizedBox(
// height: 50,
// child: ListTile(
// title: const Text('Female'),
// leading: Radio<SingingCharacter>(
// value: SingingCharacter.lafayette,
// groupValue: _character,
// onChanged: (SingingCharacter? value) {
// setState(() {
// _character = value;
// });
// },
// ),
// ),
// ),
