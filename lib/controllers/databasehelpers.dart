import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseHelper {
  String serverUrl = "https://admin.e9care.com/public/api";

  var status;
  var token;

  //create function for login
  loginData(String email, String password) async {
    String myUrl = "$serverUrl/login";
    final response = await http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"email": "$email", "password": "$password"});
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  // create function for register Users
  registerUserData(String name, String email, String password) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"name": "$name", "email": "$email", "password": "$password"});
    status = response.body.contains('error');

    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //function save
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

//function read
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
