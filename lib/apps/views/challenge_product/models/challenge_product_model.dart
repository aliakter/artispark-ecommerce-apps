import 'dart:convert';

ChallengeProductModel challengeProductModelFromJson(String str) =>
    ChallengeProductModel.fromJson(json.decode(str));

String challengeProductModelToJson(ChallengeProductModel data) =>
    json.encode(data.toJson());

class ChallengeProductModel {
  int status;
  bool success;
  int code;
  String message;
  String description;
  List<Datum> data;

  ChallengeProductModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory ChallengeProductModel.fromJson(Map<String, dynamic> json) =>
      ChallengeProductModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: json["description"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": description,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String title;
  String slug;
  dynamic userId;
  String categoryId;
  dynamic subcategoryId;
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
  dynamic region;
  dynamic country;
  dynamic long;
  dynamic lat;
  String whatsapp;
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
  dynamic fuelType;
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
  DateTime challengeLastDate;
  ChallengeProduct? challengeProduct;
  String userChallengeStatus;
  String isChallengeProductUploaded;
  String imageUrl;
  bool isWishlist;
  Category category;
  dynamic subcategory;
  List<dynamic> reviews;
  dynamic model;
  dynamic designation;
  dynamic serviceType;
  dynamic customer;
  dynamic brand;
  List<dynamic> adFeatures;
  List<dynamic> galleries;

  Datum({
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
    required this.region,
    required this.country,
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
    required this.fuelType,
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
    required this.challengeProduct,
    required this.userChallengeStatus,
    required this.isChallengeProductUploaded,
    required this.imageUrl,
    required this.isWishlist,
    required this.category,
    required this.subcategory,
    required this.reviews,
    required this.model,
    required this.designation,
    required this.serviceType,
    required this.customer,
    required this.brand,
    required this.adFeatures,
    required this.galleries,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        price: json["price"],
        description: json["description"],
        phone: json["phone"],
        showPhone: json["show_phone"],
        showEmail: json["show_email"],
        email: json["email"],
        phone2: json["phone_2"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        featured: json["featured"],
        isFeatured: json["is_featured"],
        totalReports: json["total_reports"],
        totalViews: json["total_views"],
        isBlocked: json["is_blocked"],
        draftedAt: json["drafted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: json["address"],
        neighborhood: json["neighborhood"],
        locality: json["locality"],
        place: json["place"],
        district: json["district"],
        postcode: json["postcode"],
        region: json["region"],
        country: json["country"],
        long: json["long"],
        lat: json["lat"],
        whatsapp: json["whatsapp"],
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
        fuelType: json["fuel_type"],
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
        challengeLastDate: DateTime.parse(json["challenge_last_date"]),
        challengeProduct: json['challenge_upload'] == null
            ? null
            : ChallengeProduct.fromJson(json["challenge_upload"]),
        userChallengeStatus: json["user_challenge_status"].toString(),
        isChallengeProductUploaded:
            json["is_challenge_product_uploaded"].toString(),
        imageUrl: json["image_url"],
        isWishlist: json["is_wishlist"],
        category: Category.fromJson(json["category"]),
        subcategory: json["subcategory"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        model: json["model"],
        designation: json["designation"],
        serviceType: json["service_type"],
        customer: json["customer"],
        brand: json["brand"],
        adFeatures: List<dynamic>.from(json["ad_features"].map((x) => x)),
        galleries: List<dynamic>.from(json["galleries"].map((x) => x)),
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
        "region": region,
        "country": country,
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
        "fuel_type": fuelType,
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
        "challenge_last_date":
            "${challengeLastDate.year.toString().padLeft(4, '0')}-${challengeLastDate.month.toString().padLeft(2, '0')}-${challengeLastDate.day.toString().padLeft(2, '0')}",
        "challenge_product": challengeProduct!.toJson(),
        "user_challenge_status": userChallengeStatus,
        "is_challenge_product_uploaded": isChallengeProductUploaded,
        "image_url": imageUrl,
        "is_wishlist": isWishlist,
        "category": category.toJson(),
        "subcategory": subcategory,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "model": model,
        "designation": designation,
        "service_type": serviceType,
        "customer": customer,
        "brand": brand,
        "ad_features": List<dynamic>.from(adFeatures.map((x) => x)),
        "galleries": List<dynamic>.from(galleries.map((x) => x)),
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

class ChallengeProduct {
  int id;
  String adId;
  String userId;
  String status;
  DateTime lastDate;
  String uploadProduct;
  String isChallengeProductUploaded;

  ChallengeProduct({
    required this.id,
    required this.adId,
    required this.userId,
    required this.status,
    required this.lastDate,
    required this.uploadProduct,
    required this.isChallengeProductUploaded,
  });

  factory ChallengeProduct.fromJson(Map<String, dynamic> json) =>
      ChallengeProduct(
        id: json["id"],
        adId: json["ad_id"],
        userId: json["user_id"],
        status: json["status"],
        lastDate: DateTime.parse(json["last_date"]),
        uploadProduct: json["upload_product"] ?? "",
        isChallengeProductUploaded: json["is_challenge_product_uploaded"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "user_id": userId,
        "status": status,
        "last_date":
            "${lastDate.year.toString().padLeft(4, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}",
        "upload_product": uploadProduct,
        "is_challenge_product_uploaded": isChallengeProductUploaded,
      };
}
