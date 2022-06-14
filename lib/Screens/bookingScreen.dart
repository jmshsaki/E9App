import 'dart:io';

import 'package:e9care/Screens/home_screen.dart';
import 'package:e9care/radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool _obscureText = true;

  IconData _iconVisible = Icons.visibility_off;

  final Color _gradientTop = const Color(0xff50a113);
  final Color _gradientBottom = const Color(0xff429d21);
  final Color _mainColor = const Color(0xff2b7d1c);
  final Color _underlineColor = const Color(0xFFCCCCCC);

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _name = '';
  String _age = '';
  String _address = '';
  String _mobile = '';
  String _doctorName = '';

  postBooking() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
          title: const Center(
            child: Text(
              "E9care",
            ),
          ),
          gradient: const LinearGradient(
              colors: [Color(0xff5ba52a), Color(0xff367d06)]),
        ),
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Platform.isIOS
              ? SystemUiOverlayStyle.light
              : const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light),
          child: Stack(
            children: <Widget>[
              // top blue background gradient
              Container(
                height: MediaQuery.of(context).size.height / 3.8,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [_gradientTop, _gradientBottom],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              // set your logo here
              Container(
                  margin: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 35, 0, 0),
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/logo.png', height: 90)),
              ListView(
                children: <Widget>[
                  // create form login
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(32,
                        MediaQuery.of(context).size.height / 3.5 - 72, 32, 0),
                    color: Colors.white,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Text(
                                'Booking',
                                style: TextStyle(
                                    color: _mainColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /// NAME FIELD
                            TextField(
                              onChanged: (value) {
                                _name = value;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: _underlineColor),
                                  ),
                                  labelText: 'Name',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[700])),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            ///AGE FIELD
                            TextField(
                              onChanged: (value) {
                                _age = value;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: _underlineColor),
                                  ),
                                  labelText: 'Age',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[700])),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /// ADDRESS FIELD
                            TextField(
                              onChanged: (value) {
                                _address = value;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: _underlineColor),
                                  ),
                                  labelText: 'Address',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[700]!)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            TextField(
                              // onChanged: (value) {
                              //   _name = value;
                              // },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: _underlineColor),
                                  ),
                                  labelText: 'Mobile Number',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[700])),
                            ),

                            const SizedBox(
                              height: 40,
                            ),

                            ///BOOKING BUTTON
                            SizedBox(
                              width: double.maxFinite,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) => _mainColor,
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => MainPage()),
                                    // );

                                    Fluttertoast.showToast(
                                        msg: "বুকিং সম্পন্ন হয়েছে, ধন্যবাদ!"
                                            "আমরা শীঘ্রই আপনাকে কল করব",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // create sign up link
                  Center(
                    child: Wrap(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
