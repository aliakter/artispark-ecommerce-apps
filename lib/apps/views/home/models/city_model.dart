import 'dart:convert';

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  int id;
  String name;
  String countryId;
  String status;
  dynamic createdAt;
  dynamic updatedAt;
  Country country;

  CityModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    country: Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "country": country.toJson(),
  };
}

class Country {
  int id;
  String iso;
  String name;
  String nicename;
  String iso3;
  String numcode;
  String phonecode;

  Country({
    required this.id,
    required this.iso,
    required this.name,
    required this.nicename,
    required this.iso3,
    required this.numcode,
    required this.phonecode,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    iso: json["iso"],
    name: json["name"],
    nicename: json["nicename"],
    iso3: json["iso3"],
    numcode: json["numcode"],
    phonecode: json["phonecode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "iso": iso,
    "name": name,
    "nicename": nicename,
    "iso3": iso3,
    "numcode": numcode,
    "phonecode": phonecode,
  };
}
