/// id : 1
/// doctor_name : "ডাঃ নির্ঝর ভট্টাচার্য্য শোভন"
/// doctor_sex : "পুরুষ"
/// designation : "এমবিবিএস,বিসিএস ( স্বাস্থ্য ), ডিডিভি ( চর্ম ও যৌন রোগ ) সিসিডি ( বারডেম )পিজিটি ( ঢাকা মেডিকেল কলেজ )"
/// specialist : "চর্ম, যৌন, এলার্জি ও কুষ্ঠ রোগ বিশেষজ্ঞ"
/// bmdc_registration : null
/// hospital_name : "চাঁদের হাসি হাসপাতাল লিমিটেড"
/// time_day : "প্রতি শুক্রবার"
/// created_at : "2022-03-19T12:36:32.000000Z"
/// updated_at : "2022-04-01T14:06:49.000000Z"
/// department_id : "নিউরো বিভাগ"

class DoctorsModel {
  DoctorsModel({
    int? id,
    String? doctorName,
    String? doctorSex,
    String? designation,
    String? specialist,
    dynamic bmdcRegistration,
    String? hospitalName,
    String? timeDay,
    String? createdAt,
    String? updatedAt,
    String? departmentId,
  }) {
    _id = id;
    _doctorName = doctorName;
    _doctorSex = doctorSex;
    _designation = designation;
    _specialist = specialist;
    _bmdcRegistration = bmdcRegistration;
    _hospitalName = hospitalName;
    _timeDay = timeDay;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _departmentId = departmentId;
  }

  DoctorsModel.fromJson(dynamic json) {
    _id = json['id'];
    _doctorName = json['doctor_name'];
    _doctorSex = json['doctor_sex'];
    _designation = json['designation'];
    _specialist = json['specialist'];
    _bmdcRegistration = json['bmdc_registration'];
    _hospitalName = json['hospital_name'];
    _timeDay = json['time_day'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _departmentId = json['department_id'];
  }
  int? _id;
  String? _doctorName;
  String? _doctorSex;
  String? _designation;
  String? _specialist;
  dynamic _bmdcRegistration;
  String? _hospitalName;
  String? _timeDay;
  String? _createdAt;
  String? _updatedAt;
  String? _departmentId;
  DoctorsModel copyWith({
    int? id,
    String? doctorName,
    String? doctorSex,
    String? designation,
    String? specialist,
    dynamic bmdcRegistration,
    String? hospitalName,
    String? timeDay,
    String? createdAt,
    String? updatedAt,
    String? departmentId,
  }) =>
      DoctorsModel(
        id: id ?? _id,
        doctorName: doctorName ?? _doctorName,
        doctorSex: doctorSex ?? _doctorSex,
        designation: designation ?? _designation,
        specialist: specialist ?? _specialist,
        bmdcRegistration: bmdcRegistration ?? _bmdcRegistration,
        hospitalName: hospitalName ?? _hospitalName,
        timeDay: timeDay ?? _timeDay,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        departmentId: departmentId ?? _departmentId,
      );
  int? get id => _id;
  String? get doctorName => _doctorName;
  String? get doctorSex => _doctorSex;
  String? get designation => _designation;
  String? get specialist => _specialist;
  dynamic get bmdcRegistration => _bmdcRegistration;
  String? get hospitalName => _hospitalName;
  String? get timeDay => _timeDay;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get departmentId => _departmentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_name'] = _doctorName;
    map['doctor_sex'] = _doctorSex;
    map['designation'] = _designation;
    map['specialist'] = _specialist;
    map['bmdc_registration'] = _bmdcRegistration;
    map['hospital_name'] = _hospitalName;
    map['time_day'] = _timeDay;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['department_id'] = _departmentId;
    return map;
  }
}
