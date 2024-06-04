import 'dart:convert';

List<CustomerReviewModel> customerReviewModelFromJson(String str) => List<CustomerReviewModel>.from(json.decode(str).map((x) => CustomerReviewModel.fromJson(x)));

String customerReviewModelToJson(List<CustomerReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerReviewModel {
  int id;
  String sellerId;
  String userId;
  String stars;
  String comment;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  CustomerReviewModel({
    required this.id,
    required this.sellerId,
    required this.userId,
    required this.stars,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) => CustomerReviewModel(
    id: json["id"],
    sellerId: json["seller_id"],
    userId: json["user_id"],
    stars: json["stars"],
    comment: json["comment"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": sellerId,
    "user_id": userId,
    "stars": stars,
    "comment": comment,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
