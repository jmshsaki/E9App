/// id : 1
/// doctor_name : "ডাঃ ভট্টাচার্য্য"
/// designation : "এমবিবিএস,বিসিএস ( স্বাস্থ্য ), সিসিডি ( বারডেম )"
/// specialist : "মেডিসিন বিশেষজ্ঞ"
/// bmdc_registration : "1212121212"
/// chamber_name : "চেম্বার - শায়েস্তানগর"
/// time_day : "প্রতিদিন বিকাল ৫ টা হতে রাত ৮ টা"
/// address : "Habiganj"
/// created_at : "2022-04-06T13:32:56.000000Z"
/// updated_at : "2022-04-06T13:41:37.000000Z"
/// location_id : "হবিগঞ্জ সদর"

class EyedentalModel {
  EyedentalModel({
    int? id,
    String? doctorName,
    String? designation,
    String? specialist,
    String? bmdcRegistration,
    String? chamberName,
    String? timeDay,
    String? address,
    String? createdAt,
    String? updatedAt,
    String? locationId,
  }) {
    _id = id;
    _doctorName = doctorName;
    _designation = designation;
    _specialist = specialist;
    _bmdcRegistration = bmdcRegistration;
    _chamberName = chamberName;
    _timeDay = timeDay;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _locationId = locationId;
  }

  EyedentalModel.fromJson(dynamic json) {
    _id = json['id'];
    _doctorName = json['doctor_name'];
    _designation = json['designation'];
    _specialist = json['specialist'];
    _bmdcRegistration = json['bmdc_registration'];
    _chamberName = json['chamber_name'];
    _timeDay = json['time_day'];
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _locationId = json['location_id'];
  }
  int? _id;
  String? _doctorName;
  String? _designation;
  String? _specialist;
  String? _bmdcRegistration;
  String? _chamberName;
  String? _timeDay;
  String? _address;
  String? _createdAt;
  String? _updatedAt;
  String? _locationId;
  EyedentalModel copyWith({
    int? id,
    String? doctorName,
    String? designation,
    String? specialist,
    String? bmdcRegistration,
    String? chamberName,
    String? timeDay,
    String? address,
    String? createdAt,
    String? updatedAt,
    String? locationId,
  }) =>
      EyedentalModel(
        id: id ?? _id,
        doctorName: doctorName ?? _doctorName,
        designation: designation ?? _designation,
        specialist: specialist ?? _specialist,
        bmdcRegistration: bmdcRegistration ?? _bmdcRegistration,
        chamberName: chamberName ?? _chamberName,
        timeDay: timeDay ?? _timeDay,
        address: address ?? _address,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        locationId: locationId ?? _locationId,
      );
  int? get id => _id;
  String? get doctorName => _doctorName;
  String? get designation => _designation;
  String? get specialist => _specialist;
  String? get bmdcRegistration => _bmdcRegistration;
  String? get chamberName => _chamberName;
  String? get timeDay => _timeDay;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get locationId => _locationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_name'] = _doctorName;
    map['designation'] = _designation;
    map['specialist'] = _specialist;
    map['bmdc_registration'] = _bmdcRegistration;
    map['chamber_name'] = _chamberName;
    map['time_day'] = _timeDay;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['location_id'] = _locationId;
    return map;
  }
}
