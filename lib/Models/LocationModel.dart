/// id : 11
/// location_name : "হবিগঞ্জ সদর"
/// created_at : "2022-03-29T19:43:33.000000Z"
/// updated_at : "2022-03-29T19:43:33.000000Z"

class LocationModel {
  LocationModel({
    int? id,
    String? locationName,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _locationName = locationName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LocationModel.fromJson(dynamic json) {
    _id = json['id'];
    _locationName = json['location_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _locationName;
  String? _createdAt;
  String? _updatedAt;
  LocationModel copyWith({
    int? id,
    String? locationName,
    String? createdAt,
    String? updatedAt,
  }) =>
      LocationModel(
        id: id ?? _id,
        locationName: locationName ?? _locationName,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  String? get locationName => _locationName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['location_name'] = _locationName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
