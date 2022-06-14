import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e9care/Models/ParlourModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ParlourScreen extends StatefulWidget {
  @override
  State<ParlourScreen> createState() => _ParlourScreenState();
}

class _ParlourScreenState extends State<ParlourScreen> {
  List categoryItemList = [];
  late String selectedValue;

  final List<ParlourModel> _doctorslist = [];
  Future<List<ParlourModel>> getDoctorsApi() async {
    final response = await http
        .get(Uri.parse('https://appadmin.e9care.com/public/api/parlorlist'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      _doctorslist.clear();
      for (Map i in data) {
        _doctorslist.add(ParlourModel.fromJson(i));
      }
      return _doctorslist;
    } else {
      throw Exception('Failed to load private doctors list');
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
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getDoctorsApi(),
                  builder:
                      (context, AsyncSnapshot<List<ParlourModel>> snapshot) {
                    return ListView.builder(
                        itemCount: _doctorslist.length,
                        itemBuilder: (context, index) {
                          return Card(
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
                                  // Image.network(
                                  //     snapshot.data![index].image.toString()),

                                  Ink.image(
                                    height: 60,
                                    image: AssetImage('assets/logo.png'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CachedNetworkImage(
                                      imageUrl: "http://appadmin.e9care"
                                              ".com/public/storage/" +
                                          snapshot.data![index].image
                                              .toString()),
                                  ListTile(
                                    title: Center(
                                      child: Text(
                                        "বুকিং নাম্বার",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Text(
                                        snapshot.data![index].contactNumber
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: InkWell(
                                          child: Center(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green, //
                                                // background
                                                onPrimary:
                                                    Colors.white, // foreground
                                              ),
                                              onPressed: () {
                                                launch('tel:01725162682');
                                              },
                                              child: Text("আমাদেরকে কল করুন"),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
