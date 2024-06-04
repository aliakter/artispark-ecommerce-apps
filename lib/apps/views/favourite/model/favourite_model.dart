import 'dart:convert';

FavouriteModel favouriteModelFromJson(String str) =>
    FavouriteModel.fromJson(json.decode(str));

String favouriteModelToJson(FavouriteModel data) => json.encode(data.toJson());

class FavouriteModel {
  bool status;
  bool success;
  int code;
  String message;
  List<dynamic> description;
  List<Datum> data;

  FavouriteModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: List<dynamic>.from(json["description"].map((x) => x)),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": List<dynamic>.from(description.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String adId;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  Ad ad;

  Datum({
    required this.id,
    required this.adId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.ad,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        adId: json["ad_id"] ?? '',
        userId: json["user_id"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ad: Ad.fromJson(json["ad"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ad": ad.toJson(),
      };
}

class Ad {
  int id;
  String title;
  String slug;
  String userId;
  String categoryId;
  String? subcategoryId;
  dynamic brandId;
  dynamic brandName;
  String price;
  String description;
  dynamic phone;
  bool showPhone;
  String showEmail;
  dynamic email;
  dynamic phone2;
  String thumbnail;
  String status;
  String featured;
  String isFeatured;
  String totalReports;
  String totalViews;
  String isBlocked;
  dynamic draftedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String address;
  dynamic neighborhood;
  dynamic locality;
  dynamic place;
  dynamic district;
  dynamic postcode;
  dynamic cityId;
  String? countryId;
  dynamic long;
  dynamic lat;
  dynamic whatsapp;
  dynamic serviceTypeId;
  dynamic designationId;
  dynamic productModelId;
  dynamic experience;
  dynamic educations;
  dynamic salaryFrom;
  dynamic salaryTo;
  dynamic deadline;
  dynamic employerName;
  dynamic condition;
  dynamic authenticity;
  dynamic ram;
  dynamic edition;
  dynamic processor;
  dynamic trimEdition;
  dynamic yearOfManufacture;
  dynamic engineCapacity;
  dynamic transmission;
  dynamic registrationYear;
  dynamic bodyType;

  // List<String> fuelType;
  dynamic propertyType;
  dynamic size;
  dynamic sizeType;
  dynamic propertyLocation;
  dynamic priceType;
  dynamic animalType;
  dynamic employerLogo;
  dynamic employerWebsite;
  dynamic employmentType;
  dynamic bedroom;
  String isColloborate;
  String isChallenge;
  dynamic challengeLastDate;
  String imageUrl;
  bool isWishlist;
  Category category;
  Subcategory? subcategory;
  Customer customer;
  dynamic brand;
  List<AdFeature> adFeatures;
  List<Gallery> galleries;

  Ad({
    required this.id,
    required this.title,
    required this.slug,
    required this.userId,
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.brandName,
    required this.price,
    required this.description,
    required this.phone,
    required this.showPhone,
    required this.showEmail,
    required this.email,
    required this.phone2,
    required this.thumbnail,
    required this.status,
    required this.featured,
    required this.isFeatured,
    required this.totalReports,
    required this.totalViews,
    required this.isBlocked,
    required this.draftedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.neighborhood,
    required this.locality,
    required this.place,
    required this.district,
    required this.postcode,
    required this.cityId,
    required this.countryId,
    required this.long,
    required this.lat,
    required this.whatsapp,
    required this.serviceTypeId,
    required this.designationId,
    required this.productModelId,
    required this.experience,
    required this.educations,
    required this.salaryFrom,
    required this.salaryTo,
    required this.deadline,
    required this.employerName,
    required this.condition,
    required this.authenticity,
    required this.ram,
    required this.edition,
    required this.processor,
    required this.trimEdition,
    required this.yearOfManufacture,
    required this.engineCapacity,
    required this.transmission,
    required this.registrationYear,
    required this.bodyType,
    // required this.fuelType,
    required this.propertyType,
    required this.size,
    required this.sizeType,
    required this.propertyLocation,
    required this.priceType,
    required this.animalType,
    required this.employerLogo,
    required this.employerWebsite,
    required this.employmentType,
    required this.bedroom,
    required this.isColloborate,
    required this.isChallenge,
    required this.challengeLastDate,
    required this.imageUrl,
    required this.isWishlist,
    required this.category,
    required this.subcategory,
    required this.customer,
    required this.brand,
    required this.adFeatures,
    required this.galleries,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["id"],
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        userId: json["user_id"] ?? "",
        categoryId: json["category_id"] ?? "",
        subcategoryId: json["subcategory_id"] ?? "",
        brandId: json["brand_id"] ?? "",
        brandName: json["brand_name"] ?? "",
        price: json["price"] ?? "",
        description: json["description"] ?? "",
        phone: json["phone"] ?? "",
        showPhone: json["show_phone"] ?? "",
        showEmail: json["show_email"] ?? "",
        email: json["email"] ?? "",
        phone2: json["phone_2"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        status: json["status"] ?? "",
        featured: json["featured"] ?? "",
        isFeatured: json["is_featured"] ?? "",
        totalReports: json["total_reports"] ?? "",
        totalViews: json["total_views"] ?? "",
        isBlocked: json["is_blocked"] ?? "",
        draftedAt: json["drafted_at"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: json["address"] ?? "",
        neighborhood: json["neighborhood"] ?? "",
        locality: json["locality"] ?? "",
        place: json["place"] ?? "",
        district: json["district"] ?? "",
        postcode: json["postcode"] ?? "",
        cityId: json["city_id"] ?? "",
        countryId: json["country_id"],
        long: json["long"] ?? "",
        lat: json["lat"] ?? "",
        whatsapp: json["whatsapp"] ?? "",
        serviceTypeId: json["service_type_id"],
        designationId: json["designation_id"],
        productModelId: json["product_model_id"],
        experience: json["experience"],
        educations: json["educations"],
        salaryFrom: json["salary_from"],
        salaryTo: json["salary_to"],
        deadline: json["deadline"],
        employerName: json["employer_name"],
        condition: json["condition"],
        authenticity: json["authenticity"],
        ram: json["ram"],
        edition: json["edition"],
        processor: json["processor"],
        trimEdition: json["trim_edition"],
        yearOfManufacture: json["year_of_manufacture"],
        engineCapacity: json["engine_capacity"],
        transmission: json["transmission"],
        registrationYear: json["registration_year"],
        bodyType: json["body_type"],
        // fuelType: List<String>.from(json["fuel_type"].map((x) => x)),
        propertyType: json["property_type"],
        size: json["size"],
        sizeType: json["size_type"],
        propertyLocation: json["property_location"],
        priceType: json["price_type"],
        animalType: json["animal_type"],
        employerLogo: json["employer_logo"],
        employerWebsite: json["employer_website"],
        employmentType: json["employment_type"],
        bedroom: json["bedroom"],
        isColloborate: json["is_colloborate"],
        isChallenge: json["is_challenge"],
        challengeLastDate: json["challenge_last_date"],
        imageUrl: json["image_url"],
        isWishlist: json["is_wishlist"],
        category: Category.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Subcategory.fromJson(json["subcategory"]),
        customer: Customer.fromJson(json["customer"]),
        brand: json["brand"],
        adFeatures: List<AdFeature>.from(
            json["ad_features"].map((x) => AdFeature.fromJson(x))),
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "user_id": userId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "brand_id": brandId,
        "brand_name": brandName,
        "price": price,
        "description": description,
        "phone": phone,
        "show_phone": showPhone,
        "show_email": showEmail,
        "email": email,
        "phone_2": phone2,
        "thumbnail": thumbnail,
        "status": status,
        "featured": featured,
        "is_featured": isFeatured,
        "total_reports": totalReports,
        "total_views": totalViews,
        "is_blocked": isBlocked,
        "drafted_at": draftedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "address": address,
        "neighborhood": neighborhood,
        "locality": locality,
        "place": place,
        "district": district,
        "postcode": postcode,
        "city_id": cityId,
        "country_id": countryId,
        "long": long,
        "lat": lat,
        "whatsapp": whatsapp,
        "service_type_id": serviceTypeId,
        "designation_id": designationId,
        "product_model_id": productModelId,
        "experience": experience,
        "educations": educations,
        "salary_from": salaryFrom,
        "salary_to": salaryTo,
        "deadline": deadline,
        "employer_name": employerName,
        "condition": condition,
        "authenticity": authenticity,
        "ram": ram,
        "edition": edition,
        "processor": processor,
        "trim_edition": trimEdition,
        "year_of_manufacture": yearOfManufacture,
        "engine_capacity": engineCapacity,
        "transmission": transmission,
        "registration_year": registrationYear,
        "body_type": bodyType,
        // "fuel_type": List<dynamic>.from(fuelType.map((x) => x)),
        "property_type": propertyType,
        "size": size,
        "size_type": sizeType,
        "property_location": propertyLocation,
        "price_type": priceType,
        "animal_type": animalType,
        "employer_logo": employerLogo,
        "employer_website": employerWebsite,
        "employment_type": employmentType,
        "bedroom": bedroom,
        "is_colloborate": isColloborate,
        "is_challenge": isChallenge,
        "challenge_last_date": challengeLastDate,
        "image_url": imageUrl,
        "is_wishlist": isWishlist,
        "category": category.toJson(),
        "subcategory": subcategory?.toJson(),
        "customer": customer.toJson(),
        "brand": brand,
        "ad_features": List<dynamic>.from(adFeatures.map((x) => x.toJson())),
        "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
      };
}

class AdFeature {
  int id;
  String adId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  AdFeature({
    required this.id,
    required this.adId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdFeature.fromJson(Map<String, dynamic> json) => AdFeature(
        id: json["id"],
        adId: json["ad_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Category {
  int id;
  String name;
  String image;
  String slug;
  String icon;
  String order;
  String status;
  String isShowBrand;
  DateTime createdAt;
  DateTime updatedAt;
  String type;
  String imageUrl;
  bool hasCustomField;
  List<dynamic> customFields;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.icon,
    required this.order,
    required this.status,
    required this.isShowBrand,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.imageUrl,
    required this.hasCustomField,
    required this.customFields,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        slug: json["slug"],
        icon: json["icon"],
        order: json["order"],
        status: json["status"],
        isShowBrand: json["is_show_brand"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
        imageUrl: json["image_url"],
        hasCustomField: json["has_custom_field"],
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "slug": slug,
        "icon": icon,
        "order": order,
        "status": status,
        "is_show_brand": isShowBrand,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type,
        "image_url": imageUrl,
        "has_custom_field": hasCustomField,
        "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
      };
}

class Customer {
  int id;
  String name;
  String username;
  String email;
  String userMode;
  dynamic showEmail;
  String receiveEmail;
  dynamic phone;
  dynamic showPhone;
  dynamic emailVerifiedAt;
  dynamic web;
  String image;
  dynamic token;
  dynamic lastSeen;
  DateTime createdAt;
  DateTime updatedAt;
  String authType;
  dynamic provider;
  dynamic providerId;
  String isSocialLogin;
  String socialToBusiness;
  dynamic fcmToken;
  String? aboutPublicProfile;
  String? openingHour;
  String? closingHours;
  String? deviceId;
  dynamic welcomeNoti;
  String imageUrl;
  int unread;

  Customer({
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
    required this.deviceId,
    required this.welcomeNoti,
    required this.imageUrl,
    required this.unread,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
        lastSeen: json["last_seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        authType: json["auth_type"],
        provider: json["provider"],
        providerId: json["provider_id"],
        isSocialLogin: json["is_social_login"],
        socialToBusiness: json["social_to_business"],
        fcmToken: json["fcm_token"],
        aboutPublicProfile: json["about_public_profile"],
        openingHour: json["opening_hour"],
        closingHours: json["closing_hours"],
        deviceId: json["device_id"],
        welcomeNoti: json["welcome_noti"],
        imageUrl: json["image_url"],
        unread: json["unread"],
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
        "last_seen": lastSeen,
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
        "device_id": deviceId,
        "welcome_noti": welcomeNoti,
        "image_url": imageUrl,
        "unread": unread,
      };
}

class Gallery {
  int id;
  String adId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  Gallery({
    required this.id,
    required this.adId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        adId: json["ad_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_url": imageUrl,
      };
}

class Subcategory {
  int id;
  String categoryId;
  String name;
  String slug;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String type;

  Subcategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type,
      };
}
