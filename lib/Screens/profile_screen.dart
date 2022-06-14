import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  // profilejson() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var profile_url = url + "view_profile&userid=" + pref.getString('userid');
  //   print(profile_url);
  //   http.Response profileresponse = await http.get(profile_url);
  //   var profile_response_json = json.decode(profileresponse.body);
  //
  //   // the variables you want the layout to be updated with
  //   setState(() {
  //     name = profile_response_json['username'];
  //     userimage = profile_response_json['image'];
  //     birth = profile_response_json['dob'];
  //     c_id = profile_response_json['customerid'];
  //     email = profile_response_json['email'];
  //     mobile_number = profile_response_json['phone'];
  //   })
  // }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ////////////// 1st card///////////
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ////////////  name ////////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Button'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                    userData != null
                                        ? '${userData['Name']}'
                                        : '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ////////////////////// phone ///////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      'My Phone',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                    userData != null
                                        ? '${userData['phone']}'
                                        : '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ////////////  Address ////////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      'My Address',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                    userData != null
                                        ? '${userData['Name']}'
                                        : '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ////////////end  part////////////
                      ],
                    ),
                  ),
                ),

                /////////////// Button////////////
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /////////// Edit Button /////////////

                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: FlatButton(
                      //     child: Padding(
                      //       padding: EdgeInsets.only(
                      //           top: 8, bottom: 8, left: 10, right: 10),
                      //       child: Text(
                      //         'Edit',
                      //         textDirection: TextDirection.ltr,
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 15.0,
                      //           decoration: TextDecoration.none,
                      //           fontWeight: FontWeight.normal,
                      //         ),
                      //       ),
                      //     ),
                      //     color: Color(0xFFFF835F),
                      //     shape: new RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(20.0)),
                      //     onPressed: () {},
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
