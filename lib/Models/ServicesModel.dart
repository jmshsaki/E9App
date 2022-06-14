/// id : 1
/// service_name : "Doctor"
/// service_image : null
/// created_at : "2022-03-15T19:31:54.000000Z"
/// updated_at : "2022-03-15T19:31:54.000000Z"

class ServicesModel {
  ServicesModel({
    int? id,
    String? serviceName,
    dynamic serviceImage,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _serviceName = serviceName;
    _serviceImage = serviceImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ServicesModel.fromJson(dynamic json) {
    _id = json['id'];
    _serviceName = json['service_name'];
    _serviceImage = json['service_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _serviceName;
  dynamic _serviceImage;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get serviceName => _serviceName;
  dynamic get serviceImage => _serviceImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['service_name'] = _serviceName;
    map['service_image'] = _serviceImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
