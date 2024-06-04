import 'dart:convert';

import 'package:artispark/apps/views/home/models/category_model.dart';
import 'package:artispark/apps/views/home/models/customer_model.dart';

class AdsModel {
  final int id;
  final String title;
  final String slug;
  final String thumbnail;
  final dynamic price;
  final String featured;
  final dynamic region;
  final dynamic country;
  final String address;
  final String totalViews;
  final Category category;
  final Customer customer;
  final String createdAt;
  final bool isWishlist;

  AdsModel(
      {required this.id,
      required this.title,
      required this.slug,
      required this.thumbnail,
      required this.price,
      required this.featured,
      required this.region,
      required this.country,
      required this.address,
      required this.totalViews,
      required this.category,
      required this.customer,
      required this.createdAt,
      required this.isWishlist});

  factory AdsModel.fromJson(String str) => AdsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdsModel.fromMap(Map<String, dynamic> json) => AdsModel(
        id: json["id"],
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        price: json["price"],
        featured: json["featured"],
        region: json["region"],
        country: json["country"],
        address: json["address"] ?? "",
        totalViews: json["total_views"],
        category: Category.fromMap(json["category"]),
        customer: Customer.fromMap(json["customer"]),
        createdAt: json["created_at"] ?? "",
        isWishlist: json['is_wishlist'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "thumbnail": thumbnail,
        "price": price,
        "featured": featured,
        "region": region,
        "country": country,
        "address": address,
        "total_views": totalViews,
        "category": category.toMap(),
        "customer": customer.toMap(),
        "created_at": createdAt,
      };
}
