import 'dart:convert';

import 'package:e9care/Utils/common_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/Appointment/appointment_success_page.dart';

class BookAppointmentService with ChangeNotifier {
  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  bookAppointment(BuildContext context, name, age, address, mobileNumber,
      doctorNameWithHospital) async {
    setLoadingTrue();
    var data = jsonEncode({
      'name': name,
      'age': age,
      'address': address,
      'mobile_number': mobileNumber,
      'doctor_name': doctorNameWithHospital,
    });

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    var response = await http.post(
        Uri.parse('https://admin.e9care.com/public/api/v1/formbooking'),
        body: data,
        headers: header);

    setLoadingFalse();

    if (response.statusCode == 200) {
      CommonHelper().showToast('Appointment booked successfully', Colors.black);

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const AppointmentSuccessPage(),
        ),
      );
    } else {
      CommonHelper().showToast('Something went wrong', Colors.black);
    }
  }
}
