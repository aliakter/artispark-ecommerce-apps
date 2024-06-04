import 'dart:convert';

class CountryModel {
  final dynamic country;
  final String total;

  CountryModel({
    required this.country,
    required this.total,
  });

  factory CountryModel.fromJson(String str) => CountryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
    country: json["country"],
    total: json["total"]??'',
  );

  Map<String, dynamic> toMap() => {
    "country": country,
    "total": total,
  };
}