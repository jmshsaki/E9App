import 'dart:convert';

import 'package:e9care/Models/AmbulanceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AmbulanceService with ChangeNotifier {
  var ambulanceData;

  fetchAmbulance() async {
    var response = await http.get(Uri.parse(
        'https://admin.e9care.com/public/api/v1/ambulanceappconfigs'));

    if (response.statusCode == 200) {
      var data = AmbulanceModel.fromJson(jsonDecode(response.body));

      ambulanceData = data;
      notifyListeners();
    } else {
      ambulanceData = ' error';
      notifyListeners();
    }
  }
}
