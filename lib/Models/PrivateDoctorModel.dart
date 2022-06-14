class PrivateDoctorModel {
  PrivateDoctorModel({
    required this.data,
  });
  late final List<Data> data;

  PrivateDoctorModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.doctorName,
    required this.doctorSex,
    required this.doctorTitle,
    required this.doctorSpecialist,
    this.bmDcRegistration,
    required this.chamberName,
    required this.time,
    this.day,
    this.address,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.locationNameId,
    required this.departmentNameId,
    required this.locationName,
    required this.departmentName,
  });
  late final int id;
  late final String doctorName;
  late final String doctorSex;
  late final String doctorTitle;
  late final String doctorSpecialist;
  late final String? bmDcRegistration;
  late final String chamberName;
  late final String time;
  late final String? day;
  late final String? address;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final int locationNameId;
  late final int departmentNameId;
  late final LocationName locationName;
  late final DepartmentName departmentName;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorName = json['doctor_name'];
    doctorSex = json['doctor_sex'];
    doctorTitle = json['doctor_title'];
    doctorSpecialist = json['doctor_specialist'];
    bmDcRegistration = null;
    chamberName = json['chamber_name'];
    time = json['time'];
    day = null;
    address = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    locationNameId = json['location_name_id'];
    departmentNameId = json['department_name_id'];
    locationName = LocationName.fromJson(json['location_name']);
    departmentName = DepartmentName.fromJson(json['department_name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['doctor_name'] = doctorName;
    _data['doctor_sex'] = doctorSex;
    _data['doctor_title'] = doctorTitle;
    _data['doctor_specialist'] = doctorSpecialist;
    _data['bm_dc_registration'] = bmDcRegistration;
    _data['chamber_name'] = chamberName;
    _data['time'] = time;
    _data['day'] = day;
    _data['address'] = address;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['location_name_id'] = locationNameId;
    _data['department_name_id'] = departmentNameId;
    _data['location_name'] = locationName.toJson();
    _data['department_name'] = departmentName.toJson();
    return _data;
  }
}

class LocationName {
  LocationName({
    required this.id,
    required this.locationName,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String locationName;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  LocationName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationName = json['location_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['location_name'] = locationName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}

class DepartmentName {
  DepartmentName({
    required this.id,
    required this.departmentName,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String departmentName;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  DepartmentName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentName = json['department_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['department_name'] = departmentName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
