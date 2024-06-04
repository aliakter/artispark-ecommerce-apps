import 'dart:convert';

import 'package:artispark/apps/views/auth/login/model/login_model.dart';

class StoryModel {
  final int? id;
  final String? userId;
  final String? title;
  final String? image;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  StoryModel({
    this.id,
    this.userId,
    this.title,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  StoryModel copyWith({
    int? id,
    String? userId,
    String? title,
    String? image,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
  }) =>
      StoryModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        image: image ?? this.image,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
      );

  factory StoryModel.fromRawJson(String str) => StoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    image: json["image"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: json["user"] != null ? User.fromMap(json["user"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "image": image,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user": user?.toMap(),
  };
}
