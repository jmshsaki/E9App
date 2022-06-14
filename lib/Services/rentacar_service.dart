import 'dart:convert';

import 'package:e9care/Models/RentacarModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RentacarService with ChangeNotifier {
  var rentacarData;

  fetchRentacar() async {
    var response = await http.get(
        Uri.parse('https://admin.e9care.com/public/api/v1/rentacarappconfigs'));

    if (response.statusCode == 200) {
      var data = RentacarModel.fromJson(jsonDecode(response.body));

      rentacarData = data;
      notifyListeners();
    } else {
      rentacarData = ' error';
      notifyListeners();
    }
  }
}
