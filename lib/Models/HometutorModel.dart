// To parse this JSON data, do
//
//     final ambulanceModel = ambulanceModelFromJson(jsonString);

import 'dart:convert';

HometutorModel hometutorModelFromJson(String str) =>
    HometutorModel.fromJson(json.decode(str));

String hometutorModelToJson(HometutorModel data) => json.encode(data.toJson());

class HometutorModel {
  HometutorModel({
    required this.data,
  });

  List<Datum> data;

  factory HometutorModel.fromJson(Map<String, dynamic> json) => HometutorModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.mobileNumber,
    this.deletedAt,
    required this.picture,
    required this.media,
  });

  int? id;
  String? mobileNumber;

  dynamic deletedAt;
  Picture picture;
  List<Picture> media;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        mobileNumber: json["mobile_number"],
        deletedAt: json["deleted_at"],
        picture: Picture.fromJson(json["picture"]),
        media:
            List<Picture>.from(json["media"].map((x) => Picture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mobile_number": mobileNumber,
        "deleted_at": deletedAt,
        "picture": picture.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Picture {
  Picture({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    this.orderColumn,
    this.url,
    this.thumbnail,
    this.preview,
    this.originalUrl,
    this.previewUrl,
  });

  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  GeneratedConversions generatedConversions;
  List<dynamic> responsiveImages;
  int? orderColumn;

  String? url;
  String? thumbnail;
  String? preview;
  String? originalUrl;
  String? previewUrl;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        uuid: json["uuid"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        conversionsDisk: json["conversions_disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        generatedConversions:
            GeneratedConversions.fromJson(json["generated_conversions"]),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        url: json["url"],
        thumbnail: json["thumbnail"],
        preview: json["preview"],
        originalUrl: json["original_url"],
        previewUrl: json["preview_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "conversions_disk": conversionsDisk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "generated_conversions": generatedConversions.toJson(),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "url": url,
        "thumbnail": thumbnail,
        "preview": preview,
        "original_url": originalUrl,
        "preview_url": previewUrl,
      };
}

class GeneratedConversions {
  GeneratedConversions({
    this.thumb,
    this.preview,
  });

  bool? thumb;
  bool? preview;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) =>
      GeneratedConversions(
        thumb: json["thumb"],
        preview: json["preview"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "preview": preview,
      };
}
