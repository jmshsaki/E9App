import 'package:e9care/Screens/habiganj_hospital_list/all_locations.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HospitalDoctorsLocation extends StatefulWidget {
  @override
  State<HospitalDoctorsLocation> createState() =>
      _HospitalDoctorsLocationState();
}

class _HospitalDoctorsLocationState extends State<HospitalDoctorsLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "আপনার  অবস্থান  নির্বাচন",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: AllLocations(),
    );
  }
}
