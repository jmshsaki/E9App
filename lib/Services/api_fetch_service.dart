import 'dart:convert';

import 'package:e9care/Models/hospital_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiFetchService with ChangeNotifier {
  var allData;

  var individualDoctorDetails;

  List locationsList = [];

  List hospitalBasedOnLocationId = [];
  List departmentListBasedOnHospitalId = [];
  List doctorListBasedOnDepartmentId = [];

  fetchData() async {
    if (allData == null) {
      var response = await http
          .get(Uri.parse('https://admin.e9care.com/public/api/v1/hospitals'));

      if (response.statusCode == 200) {
        var data = HospitalModel.fromJson(jsonDecode(response.body));

        allData = data;

        //first we need to add one data to location list otherwise the inner loop will never run

        // for (int i = 0; i < data.data.length; i++) {
        //   locationsList.add(data.data[i].locationNames);
        // }
        // //remove duplicates from this list
        // for (int i = 0; i < locationsList.length - 1; i++) {
        //   if (locationsList[i].id == locationsList[i + 1].id) {
        //     print('duplicate found');
        //     locationsList.removeAt(i);
        //   }
        // }

        notifyListeners();
      } else {
        print('something went wrong');
        print(response.body);
      }
    } else {
      print('already loaded from api');
    }
  }

  getHospitalList(locationId) {
    print('location id is $locationId');
    hospitalBasedOnLocationId = [];

    for (int i = 0; i < allData.data.length; i++) {
      if (allData.data[i].locationNameId == locationId) {
        hospitalBasedOnLocationId.add(allData.data[i]);
      }
    }

    Future.delayed(Duration(microseconds: 600), () {
      notifyListeners();
    });

    // print(hospitalBasedOnLocationId[2].hospitalName);
  }

  getDepartmentList(hospitalId) {
    print('hospital id is $hospitalId');
    departmentListBasedOnHospitalId = [];

    for (int i = 0; i < allData.data.length; i++) {
      //check which hospital user selected and then show all the department under that
      if (allData.data[i].id == hospitalId) {
        departmentListBasedOnHospitalId = allData.data[i].departments;
        break;
      }
    }

    Future.delayed(const Duration(microseconds: 600), () {
      notifyListeners();
    });
  }

  getDoctorList(departmentId, hospitalIndex) {
    // print('hospital id is $hospitalId');
    doctorListBasedOnDepartmentId = [];

    for (int i = 0; i < allData.data[hospitalIndex].doctorNames.length; i++) {
      //check which hospital user selected and then show all the department under that
      if (allData.data[hospitalIndex].doctorNames[i].departmentNameId ==
          departmentId) {
        doctorListBasedOnDepartmentId
            .add(allData.data[hospitalIndex].doctorNames[i]);
      }
    }

    Future.delayed(const Duration(microseconds: 600), () {
      notifyListeners();
    });
  }
}
