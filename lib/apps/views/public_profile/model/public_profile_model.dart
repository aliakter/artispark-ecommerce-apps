import 'dart:convert';

import 'package:artispark/apps/views/home/models/home_model.dart';

PublicProfileModel publicProfileModelFromJson(String str) =>
    PublicProfileModel.fromJson(json.decode(str));

String publicProfileModelToJson(PublicProfileModel data) =>
    json.encode(data.toJson());

class PublicProfileModel {
  RatingDetails ratingDetails;
  List<Review> reviews;
  List<Ad> recentAds;
  int totalActiveAd;
  List<dynamic> socialMedias;
  Customers user;

  PublicProfileModel({
    required this.ratingDetails,
    required this.reviews,
    required this.recentAds,
    required this.totalActiveAd,
    required this.socialMedias,
    required this.user,
  });

  factory PublicProfileModel.fromJson(Map<String, dynamic> json) =>
      PublicProfileModel(
        ratingDetails: RatingDetails.fromJson(json["rating_details"]),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        recentAds: List<Ad>.from(json["recent_ads"].map((x) => Ad.fromJson(x))),
        totalActiveAd: json["total_active_ad"],
        socialMedias: List<dynamic>.from(json["social_medias"].map((x) => x)),
        user: Customers.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "rating_details": ratingDetails.toJson(),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "recent_ads": List<dynamic>.from(recentAds.map((x) => x.toJson())),
        "total_active_ad": totalActiveAd,
        "social_medias": List<dynamic>.from(socialMedias.map((x) => x)),
        "user": user.toJson(),
      };
}

class RatingDetails {
  int total;
  int rating;
  String average;

  RatingDetails({
    required this.total,
    required this.rating,
    required this.average,
  });

  factory RatingDetails.fromJson(Map<String, dynamic> json) => RatingDetails(
        total: json["total"],
        rating: json["rating"],
        average: json["average"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "rating": rating,
        "average": average,
      };
}

class RecentAd {
  int id;
  String title;
  String slug;
  String thumbnail;
  dynamic price;
  String featured;
  dynamic region;
  dynamic country;
  String address;
  String totalViews;
  Category category;
  Customers customer;
  String createdAt;
  bool isWishlist;

  RecentAd({
    required this.id,
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
    required this.isWishlist,
  });

  factory RecentAd.fromJson(Map<String, dynamic> json) => RecentAd(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        featured: json["featured"],
        region: json["region"],
        country: json["country"],
        address: json["address"],
        totalViews: json["total_views"],
        category: Category.fromJson(json["category"]),
        customer: Customers.fromJson(json["customer"]),
        createdAt: json["created_at"],
        isWishlist: json["is_wishlist"],
      );

  Map<String, dynamic> toJson() => {
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
        "category": category.toJson(),
        "customer": customer.toJson(),
        "created_at": createdAt,
        "is_wishlist": isWishlist,
      };
}

class Category {
  int id;
  String name;
  dynamic slug;
  String icon;
  dynamic order;
  dynamic image;
  bool hasCustomField;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.order,
    required this.image,
    required this.hasCustomField,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        icon: json["icon"],
        order: json["order"],
        image: json["image"],
        hasCustomField: json["has_custom_field"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "order": order,
        "image": image,
        "has_custom_field": hasCustomField,
      };
}

class Customers {
  int id;
  String name;
  String username;
  String email;
  dynamic userMode;
  String showEmail;
  String receiveEmail;
  String phone;
  String showPhone;
  dynamic emailVerifiedAt;
  String web;
  String image;
  dynamic token;
  DateTime lastSeen;
  DateTime createdAt;
  DateTime updatedAt;
  String authType;
  dynamic provider;
  dynamic providerId;
  String isSocialLogin;
  String socialToBusiness;
  dynamic fcmToken;
  String aboutPublicProfile;
  String openingHour;
  String closingHours;
  String imageUrl;
  int unread;
  List<dynamic> socialMedia;

  Customers({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.userMode,
    required this.showEmail,
    required this.receiveEmail,
    required this.phone,
    required this.showPhone,
    required this.emailVerifiedAt,
    required this.web,
    required this.image,
    required this.token,
    required this.lastSeen,
    required this.createdAt,
    required this.updatedAt,
    required this.authType,
    required this.provider,
    required this.providerId,
    required this.isSocialLogin,
    required this.socialToBusiness,
    required this.fcmToken,
    required this.aboutPublicProfile,
    required this.openingHour,
    required this.closingHours,
    required this.imageUrl,
    required this.unread,
    required this.socialMedia,
  });

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        userMode: json["user_mode"] ?? "",
        showEmail: json["show_email"] ?? "",
        receiveEmail: json["receive_email"] ?? "",
        phone: json["phone"] ?? "",
        showPhone: json["show_phone"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        web: json["web"] ?? "",
        image: json["image"] ?? "",
        token: json["token"] ?? "",
        lastSeen: json["last_seen"] == null
            ? DateTime.now()
            : DateTime.parse(json["last_seen"]),
        createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
        updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
        authType: json["auth_type"] ?? "",
        provider: json["provider"] ?? "",
        providerId: json["provider_id"] ?? "",
        isSocialLogin: json["is_social_login"] ?? "",
        socialToBusiness: json["social_to_business"] ?? "",
        fcmToken: json["fcm_token"] ?? "",
        aboutPublicProfile: json["about_public_profile"] ?? "",
        openingHour: json["opening_hour"] ?? "",
        closingHours: json["closing_hours"] ?? "",
        imageUrl: json["image_url"] ?? "",
        unread: json["unread"] ?? "",
        socialMedia: json["social_media"] == null
            ? []
            : List<dynamic>.from(json["social_media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "user_mode": userMode,
        "show_email": showEmail,
        "receive_email": receiveEmail,
        "phone": phone,
        "show_phone": showPhone,
        "email_verified_at": emailVerifiedAt,
        "web": web,
        "image": image,
        "token": token,
        "last_seen": lastSeen.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "auth_type": authType,
        "provider": provider,
        "provider_id": providerId,
        "is_social_login": isSocialLogin,
        "social_to_business": socialToBusiness,
        "fcm_token": fcmToken,
        "about_public_profile": aboutPublicProfile,
        "opening_hour": openingHour,
        "closing_hours": closingHours,
        "image_url": imageUrl,
        "unread": unread,
        "social_media": List<dynamic>.from(socialMedia.map((x) => x)),
      };
}

class Review {
  int id;
  String sellerId;
  String userId;
  String stars;
  String comment;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Customers user;

  Review({
    required this.id,
    required this.sellerId,
    required this.userId,
    required this.stars,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        sellerId: json["seller_id"],
        userId: json["user_id"],
        stars: json["stars"],
        comment: json["comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: Customers.fromJson(json["user"]),
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
        "user": user.toJson(),
      };
}
