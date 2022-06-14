/// id : 1
/// image : "beautyparlours\\March2022\\uQ6HgNk2QFGMbQmXkOxX.jpg"
/// created_at : "2022-03-20T14:49:38.000000Z"
/// updated_at : "2022-04-06T14:17:08.000000Z"
/// location_id : "হবিগঞ্জ সদর"
/// contact_number : "01717-999-001"

class ParlourModel {
  ParlourModel({
    int? id,
    String? image,
    String? createdAt,
    String? updatedAt,
    String? locationId,
    String? contactNumber,
  }) {
    _id = id;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _locationId = locationId;
    _contactNumber = contactNumber;
  }

  ParlourModel.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _locationId = json['location_id'];
    _contactNumber = json['contact_number'];
  }
  int? _id;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _locationId;
  String? _contactNumber;
  ParlourModel copyWith({
    int? id,
    String? image,
    String? createdAt,
    String? updatedAt,
    String? locationId,
    String? contactNumber,
  }) =>
      ParlourModel(
        id: id ?? _id,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        locationId: locationId ?? _locationId,
        contactNumber: contactNumber ?? _contactNumber,
      );
  int? get id => _id;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get locationId => _locationId;
  String? get contactNumber => _contactNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['location_id'] = _locationId;
    map['contact_number'] = _contactNumber;
    return map;
  }
}
