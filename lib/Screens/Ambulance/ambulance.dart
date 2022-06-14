import 'package:e9care/Screens/Ambulance/ambulance_page.dart';
import 'package:e9care/Services/ambulance_service.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class Ambulance extends StatelessWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AmbulanceService()),
      ],
      child: Scaffold(
        appBar: NewGradientAppBar(
          title: const Center(
            child: Text(
              "ই-নাইন কেয়ার - অ্যাম্বুলেন্স",
            ),
          ),
          gradient: const LinearGradient(
              colors: [Color(0xff5ba52a), Color(0xff367d06)]),
        ),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AmbulancePage(),
        ),
      ),
    );
  }
}
