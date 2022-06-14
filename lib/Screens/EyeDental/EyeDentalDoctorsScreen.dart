import 'dart:convert';

import 'package:e9care/Models/EyedentalModel.dart';
import 'package:e9care/Screens/bookingScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class EyeDentalDoctorsScreen extends StatefulWidget {
  @override
  State<EyeDentalDoctorsScreen> createState() => _EyeDentalDoctorsScreenState();
}

class _EyeDentalDoctorsScreenState extends State<EyeDentalDoctorsScreen> {
  List categoryItemList = [];
  late String selectedValue;

  final List<EyedentalModel> _doctorslist = [];
  Future<List<EyedentalModel>> getDoctorsApi() async {
    final response = await http
        .get(Uri.parse('https://appadmin.e9care.com/public/api/eyedentallist'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      _doctorslist.clear();
      for (Map i in data) {
        _doctorslist.add(EyedentalModel.fromJson(i));
      }
      return _doctorslist;
    } else {
      throw Exception('Failed to load eye dental doctors list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "E9care - Eye and Dental ",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getDoctorsApi(),
                  builder:
                      (context, AsyncSnapshot<List<EyedentalModel>> snapshot) {
                    return ListView.builder(
                        itemCount: _doctorslist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.person,
                                    size: 75,
                                  ),
                                  title: Text(snapshot.data![index].doctorName
                                      .toString()),
                                  subtitle: Text(snapshot
                                      .data![index].designation
                                      .toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text("রোগী দেখেন: " +
                                      snapshot.data![index].timeDay.toString()),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: FlatButton(
                                        textColor: const Color(0xFF6200EE),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookingScreen()),
                                          );
                                        },
                                        child: const Center(
                                            child: Text('Book Now')),
                                      ),
                                    ),
                                  ],
                                ),
                                // Image.asset('assets/card-sample-image.jpg'),
                              ],
                            ),
                          );
                          // return Card(
                          //   child: Column(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       ListTile(
                          //         leading: Icon(
                          //           Icons.person,
                          //           color: Colors.green,
                          //           size: 60,
                          //         ),
                          //         title: Text(snapshot.data![index].doctorName
                          //             .toString()),
                          //         subtitle: Text(snapshot
                          //             .data![index].designation
                          //             .toString()),
                          //       ),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.end,
                          //         children: [
                          //           TextButton(
                          //             child: const Text("View Details"),
                          //             onPressed: () {
                          //               Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         DoctorsdetailScreen),
                          //               );
                          //             },
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
