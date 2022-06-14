import 'dart:convert';

import 'package:e9care/Models/DoctorsModel.dart';
import 'package:e9care/Screens/doctorsdetail_screen.dart';
import 'package:e9care/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class DoctorsDepartmentScreen extends StatefulWidget {
  @override
  State<DoctorsDepartmentScreen> createState() =>
      _DoctorsDepartmentScreenState();
}

class _DoctorsDepartmentScreenState extends State<DoctorsDepartmentScreen> {
  List categoryItemList = [];
  late String selectedValue;

  final List<DoctorsModel> _doctorslist = [];
  Future<List<DoctorsModel>> getDoctorsApi() async {
    final response = await http.get(
        Uri.parse('https://appadmin.e9care.com/public/api/hospitaldoctorlist'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      _doctorslist.clear();
      for (Map i in data) {
        _doctorslist.add(DoctorsModel.fromJson(i));
      }
      return _doctorslist;
    } else {
      throw Exception('Failed to load doctors list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "E9care - Care for Life!",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getDoctorsApi(),
                  builder:
                      (context, AsyncSnapshot<List<DoctorsModel>> snapshot) {
                    return ListView.builder(
                        itemCount: _doctorslist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.person,
                                    size: 75,
                                  ),
                                  title: Text(snapshot.data![index].departmentId
                                      .toString()),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'হোমে ফিরে যাই',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton(
                                      child: const Text(
                                        'ডাক্তার দেখুন',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DoctorsDetailScreen()),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 8),
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
