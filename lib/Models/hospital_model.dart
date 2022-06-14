// To parse this JSON data, do
//
//     final HospitalModel = HospitalModelFromJson(jsonString);

import 'dart:convert';

HospitalModel HospitalModelFromJson(String str) =>
    HospitalModel.fromJson(json.decode(str));

String HospitalModelToJson(HospitalModel data) => json.encode(data.toJson());

class HospitalModel {
  HospitalModel({
    required this.data,
  });

  List<Datum> data;

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.hospitalName,
    this.hospitalAddress,
    this.hospitalOwnerName,
    this.ownerSex,
    this.ownerPhone,
    this.managerName,
    this.managerPhone,
    this.hospitalEmail,
    this.hospitalWebAddress,
    this.counterPhone,
    this.deletedAt,
    required this.departments,
    required this.doctorNames,
    required this.locationNames,
  });

  int? id;
  String? hospitalName;
  String? hospitalAddress;
  dynamic hospitalOwnerName;
  dynamic ownerSex;
  dynamic ownerPhone;
  dynamic managerName;
  dynamic managerPhone;
  dynamic hospitalEmail;
  dynamic hospitalWebAddress;
  dynamic counterPhone;

  dynamic deletedAt;
  List<Department> departments;
  List<DoctorName> doctorNames;
  List<LocationName> locationNames;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hospitalName: json["hospital_name"],
        hospitalAddress: json["hospital_address"],
        hospitalOwnerName: json["hospital_owner_name"],
        ownerSex: json["owner_sex"],
        ownerPhone: json["owner_phone"],
        managerName: json["manager_name"],
        managerPhone: json["manager_phone"],
        hospitalEmail: json["hospital_email"],
        hospitalWebAddress: json["hospital_web_address"],
        counterPhone: json["counter_phone"],
        deletedAt: json["deleted_at"],
        departments: List<Department>.from(
            json["departments"].map((x) => Department.fromJson(x))),
        doctorNames: List<DoctorName>.from(
            json["doctor_names"].map((x) => DoctorName.fromJson(x))),
        locationNames: List<LocationName>.from(
            json["location_names"].map((x) => LocationName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "hospital_address": hospitalAddress,
        "hospital_owner_name": hospitalOwnerName,
        "owner_sex": ownerSex,
        "owner_phone": ownerPhone,
        "manager_name": managerName,
        "manager_phone": managerPhone,
        "hospital_email": hospitalEmail,
        "hospital_web_address": hospitalWebAddress,
        "counter_phone": counterPhone,
        "deleted_at": deletedAt,
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
        "doctor_names": List<dynamic>.from(doctorNames.map((x) => x.toJson())),
        "location_names":
            List<dynamic>.from(locationNames.map((x) => x.toJson())),
      };
}

class Department {
  Department({
    this.id,
    this.departmentName,
    this.deletedAt,
    required this.pivot,
  });

  int? id;
  String? departmentName;

  dynamic deletedAt;
  DepartmentPivot pivot;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        departmentName: json["department_name"],
        deletedAt: json["deleted_at"],
        pivot: DepartmentPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "department_name": departmentName,
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
      };
}

class DepartmentPivot {
  DepartmentPivot({
    this.hospitalId,
    this.departmentId,
  });

  int? hospitalId;
  int? departmentId;

  factory DepartmentPivot.fromJson(Map<String, dynamic> json) =>
      DepartmentPivot(
        hospitalId: json["hospital_id"],
        departmentId: json["department_id"],
      );

  Map<String, dynamic> toJson() => {
        "hospital_id": hospitalId,
        "department_id": departmentId,
      };
}

class DoctorName {
  DoctorName({
    this.id,
    this.doctorName,
    this.doctorSex,
    this.doctorTitle,
    this.doctorSpecialist,
    this.bmDcRegistration,
    this.day,
    this.time,
    this.deletedAt,
    this.locationNameId,
    this.hospitalNameId,
    this.departmentNameId,
    required this.pivot,
  });

  int? id;
  String? doctorName;
  String? doctorSex;
  String? doctorTitle;
  String? doctorSpecialist;
  dynamic bmDcRegistration;
  String? day;
  dynamic time;

  dynamic deletedAt;
  int? locationNameId;
  int? hospitalNameId;
  int? departmentNameId;
  DoctorNamePivot pivot;

  factory DoctorName.fromJson(Map<String, dynamic> json) => DoctorName(
        id: json["id"],
        doctorName: json["doctor_name"],
        doctorSex: json["doctor_sex"],
        doctorTitle: json["doctor_title"],
        doctorSpecialist: json["doctor_specialist"],
        bmDcRegistration: json["bm_dc_registration"],
        day: json["day"],
        time: json["time"],
        deletedAt: json["deleted_at"],
        locationNameId: json["location_name_id"],
        hospitalNameId: json["hospital_name_id"],
        departmentNameId: json["department_name_id"],
        pivot: DoctorNamePivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_name": doctorName,
        "doctor_sex": doctorSex,
        "doctor_title": doctorTitle,
        "doctor_specialist": doctorSpecialist,
        "bm_dc_registration": bmDcRegistration,
        "day": day,
        "time": time,
        "deleted_at": deletedAt,
        "location_name_id": locationNameId,
        "hospital_name_id": hospitalNameId,
        "department_name_id": departmentNameId,
        "pivot": pivot.toJson(),
      };
}

class DoctorNamePivot {
  DoctorNamePivot({
    this.hospitalId,
    this.hospitaldoctorId,
  });

  int? hospitalId;
  int? hospitaldoctorId;

  factory DoctorNamePivot.fromJson(Map<String, dynamic> json) =>
      DoctorNamePivot(
        hospitalId: json["hospital_id"],
        hospitaldoctorId: json["hospitaldoctor_id"],
      );

  Map<String, dynamic> toJson() => {
        "hospital_id": hospitalId,
        "hospitaldoctor_id": hospitaldoctorId,
      };
}

class LocationName {
  LocationName({
    this.id,
    this.locationName,
    this.deletedAt,
    required this.pivot,
  });

  int? id;
  String? locationName;

  dynamic deletedAt;
  LocationNamePivot pivot;

  factory LocationName.fromJson(Map<String, dynamic> json) => LocationName(
        id: json["id"],
        locationName: json["location_name"],
        deletedAt: json["deleted_at"],
        pivot: LocationNamePivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location_name": locationName,
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
      };
}

class LocationNamePivot {
  LocationNamePivot({
    this.hospitalId,
    this.locationId,
  });

  int? hospitalId;
  int? locationId;

  factory LocationNamePivot.fromJson(Map<String, dynamic> json) =>
      LocationNamePivot(
        hospitalId: json["hospital_id"],
        locationId: json["location_id"],
      );

  Map<String, dynamic> toJson() => {
        "hospital_id": hospitalId,
        "location_id": locationId,
      };
}
