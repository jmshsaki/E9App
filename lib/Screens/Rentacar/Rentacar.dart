import 'package:e9care/Screens/Rentacar/rentacar_page.dart';
import 'package:e9care/Services/rentacar_service.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class Rentacar extends StatelessWidget {
  const Rentacar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RentacarService()),
      ],
      child: Scaffold(
        appBar: NewGradientAppBar(
          title: const Center(
            child: Text(
              "ই-নাইন কেয়ার - গাড়ী ভাড়া",
            ),
          ),
          gradient: const LinearGradient(
              colors: [Color(0xff5ba52a), Color(0xff367d06)]),
        ),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RentacarPage(),
        ),
      ),
    );
  }
}
