import 'dart:convert';

import 'package:e9care/Models/HometutorModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HometutorService with ChangeNotifier {
  var hometutorData;

  fetchHometutor() async {
    var response = await http.get(Uri.parse(
        'https://admin.e9care.com/public/api/v1/hometutorappconfigs'));

    if (response.statusCode == 200) {
      var data = HometutorModel.fromJson(jsonDecode(response.body));

      hometutorData = data;
      notifyListeners();
    } else {
      hometutorData = ' error';
      notifyListeners();
    }
  }
}
