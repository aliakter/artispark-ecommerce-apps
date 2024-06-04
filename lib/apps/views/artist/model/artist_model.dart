import 'dart:convert';

class ArtistsModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final dynamic userMode;
  final dynamic showEmail;
  final String receiveEmail;
  final dynamic phone;
  final dynamic showPhone;
  final dynamic emailVerifiedAt;
  final dynamic web;
  final String image;
  final dynamic token;
  final String lastSeen;
  final String createdAt;
  final String updatedAt;
  final String authType;
  final dynamic provider;
  final dynamic providerId;
  final String isSocialLogin;
  final String socialToBusiness;
  final dynamic fcmToken;
  final dynamic aboutPublicProfile;
  final dynamic openingHour;
  final dynamic closingHours;
  final String reviewsCount;
  final String reviewsAvgStars;
  final String adCount;
  final String imageUrl;
  final int unread;

  ArtistsModel({
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
    required this.reviewsCount,
    required this.reviewsAvgStars,
    required this.adCount,
    required this.imageUrl,
    required this.unread,
  });

  factory ArtistsModel.fromJson(String str) => ArtistsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArtistsModel.fromMap(Map<String, dynamic> json) => ArtistsModel(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    userMode: json["user_mode"],
    showEmail: json["show_email"],
    receiveEmail: json["receive_email"],
    phone: json["phone"],
    showPhone: json["show_phone"],
    emailVerifiedAt: json["email_verified_at"],
    web: json["web"],
    image: json["image"],
    token: json["token"],
    lastSeen: json["last_seen"]??"",
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    authType: json["auth_type"],
    provider: json["provider"],
    providerId: json["provider_id"],
    isSocialLogin: json["is_social_login"],
    socialToBusiness: json["social_to_business"],
    fcmToken: json["fcm_token"],
    aboutPublicProfile: json["about_public_profile"],
    openingHour: json["opening_hour"],
    closingHours: json["closing_hours"],
    reviewsCount: json["reviews_count"],
    reviewsAvgStars: json["reviews_avg_stars"]??"",
    adCount: json["ad_count"],
    imageUrl: json["image_url"],
    unread: json["unread"],
  );

  Map<String, dynamic> toMap() => {
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
    "last_seen": lastSeen,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "auth_type": authType,
    "provider": provider,
    "provider_id": providerId,
    "is_social_login": isSocialLogin,
    "social_to_business": socialToBusiness,
    "fcm_token": fcmToken,
    "about_public_profile": aboutPublicProfile,
    "opening_hour": openingHour,
    "closing_hours": closingHours,
    "reviews_count": reviewsCount,
    "reviews_avg_stars": reviewsAvgStars,
    "ad_count": adCount,
    "image_url": imageUrl,
    "unread": unread,
  };
}
