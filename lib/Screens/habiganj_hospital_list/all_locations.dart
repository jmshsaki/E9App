import 'package:e9care/Screens/habiganj_hospital_list/habiganj_hospital_list_page.dart';
import 'package:e9care/Screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllLocations extends StatefulWidget {
  const AllLocations({Key? key}) : super(key: key);

  @override
  State<AllLocations> createState() => _AllLocationsState();
}

class _AllLocationsState extends State<AllLocations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'হবিগঞ্জ সদর',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HabiganjHospitalListPage()),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'লাখাই উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HabiganjHospitalListPage()),
                                // );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'শায়েস্তাগঞ্জ উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'মাধবপুর উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HabiganjHospitalListPage()),
                                // );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'চুনারুঘাট উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HabiganjHospitalListPage()),
                                // );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'নবীগঞ্জ উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'বাহুবল উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HabiganjHospitalListPage()),
                                // );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'আজমিরিগঞ্জ উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HabiganjHospitalListPage()),
                                // );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: const ListTile(
                            title: Center(
                              child: Text(
                                'বানিয়াচং উপজেলা',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Ink.image(
                          height: 75,
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                'হোমে ফিরে যান',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'হাসপাতাল দেখুন',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg:
                                        "আমরা শীঘ্রই এই এলাকায় সেবা শুরু করবো",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           HabiganjHospitalListPage()),
                                // );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
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
