import 'dart:convert';

import 'package:e9care/Models/EyedentalModel.dart';
import 'package:e9care/Screens/bookingScreen.dart';
import 'package:e9care/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class EyeDentalScreen extends StatefulWidget {
  @override
  State<EyeDentalScreen> createState() => _EyeDentalScreenState();
}

class _EyeDentalScreenState extends State<EyeDentalScreen> {
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
      throw Exception('Failed to load eye and dental list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "E9care - Eye Dental",
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
                      (context, AsyncSnapshot<List<EyedentalModel>> snapshot) {
                    return ListView.builder(
                        itemCount: _doctorslist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                        size: 80.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.health_and_safety_sharp,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                      title: Center(
                                        child: Text(
                                          snapshot.data![index].doctorName
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      subtitle: Center(
                                        child: Text(
                                          snapshot.data![index].designation
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              "রোগী দেখেন " +
                                                  snapshot.data![index].timeDay
                                                      .toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                          child: const Text(
                                            'হোমে ফিরে যাই',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green),
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
                                            'ডাক্তার বুক করুন',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookingScreen()),
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
