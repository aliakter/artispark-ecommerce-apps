import 'dart:convert';

import 'package:artispark/apps/views/home/models/home_model.dart';

// class AdDetailsModel {
//   final AdDetails adDetails;
//   final List<AdsModel> relatedAds;
//
//   AdDetailsModel({
//     required this.adDetails,
//     required this.relatedAds,
//   });
//
//   factory AdDetailsModel.fromJson(String str) => AdDetailsModel.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory AdDetailsModel.fromMap(Map<String, dynamic> json) => AdDetailsModel(
//     adDetails: AdDetails.fromMap(json["ad_details"]),
//     relatedAds: List<AdsModel>.from(json["related_ads"].map((x) => AdsModel.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "ad_details": adDetails.toMap(),
//     "related_ads": List<dynamic>.from(relatedAds.map((x) => x.toMap())),
//   };
// }
//
// class AdDetails {
//   final int id;
//   final String title;
//   final String slug;
//   final String userId;
//   final String categoryId;
//   final String subcategoryId;
//   final dynamic brandId;
//   final dynamic brandName;
//   final String price;
//   final String description;
//   final String phone;
//   final bool showPhone;
//   final String showEmail;
//   final String email;
//   final dynamic phone2;
//   final String thumbnail;
//   final String status;
//   final String featured;
//   final String isFeatured;
//   final String totalReports;
//   final String totalViews;
//   final String isBlocked;
//   final dynamic draftedAt;
//   final String createdAt;
//   final String updatedAt;
//   final String address;
//   final dynamic neighborhood;
//   final dynamic locality;
//   final dynamic place;
//   final dynamic district;
//   final dynamic postcode;
//   final dynamic region;
//   final dynamic country;
//   final dynamic long;
//   final dynamic lat;
//   final String whatsapp;
//   final dynamic serviceTypeId;
//   final dynamic designationId;
//   final dynamic productModelId;
//   final dynamic experience;
//   final dynamic educations;
//   final dynamic salaryFrom;
//   final dynamic salaryTo;
//   final dynamic deadline;
//   final dynamic employerName;
//   final String condition;
//   final dynamic authenticity;
//   final dynamic ram;
//   final dynamic edition;
//   final dynamic processor;
//   final dynamic trimEdition;
//   final dynamic yearOfManufacture;
//   final dynamic engineCapacity;
//   final dynamic transmission;
//   final dynamic registrationYear;
//   final dynamic bodyType;
//   final dynamic fuelType;
//   final dynamic propertyType;
//   final String size;
//   final dynamic sizeType;
//   final dynamic propertyLocation;
//   final dynamic priceType;
//   final dynamic animalType;
//   final dynamic employerLogo;
//   final dynamic employerWebsite;
//   final dynamic employmentType;
//   final dynamic bedroom;
//   final String imageUrl;
//   final Category category;
//   final Subcategory subcategory;
//   final dynamic model;
//   final dynamic designation;
//   final dynamic serviceType;
//   final Customer customer;
//   final dynamic brand;
//   final List<AdFeature> adFeatures;
//   final List<Gallery> galleries;
//
//   AdDetails({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.userId,
//     required this.categoryId,
//     required this.subcategoryId,
//     required this.brandId,
//     required this.brandName,
//     required this.price,
//     required this.description,
//     required this.phone,
//     required this.showPhone,
//     required this.showEmail,
//     required this.email,
//     required this.phone2,
//     required this.thumbnail,
//     required this.status,
//     required this.featured,
//     required this.isFeatured,
//     required this.totalReports,
//     required this.totalViews,
//     required this.isBlocked,
//     required this.draftedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.address,
//     required this.neighborhood,
//     required this.locality,
//     required this.place,
//     required this.district,
//     required this.postcode,
//     required this.region,
//     required this.country,
//     required this.long,
//     required this.lat,
//     required this.whatsapp,
//     required this.serviceTypeId,
//     required this.designationId,
//     required this.productModelId,
//     required this.experience,
//     required this.educations,
//     required this.salaryFrom,
//     required this.salaryTo,
//     required this.deadline,
//     required this.employerName,
//     required this.condition,
//     required this.authenticity,
//     required this.ram,
//     required this.edition,
//     required this.processor,
//     required this.trimEdition,
//     required this.yearOfManufacture,
//     required this.engineCapacity,
//     required this.transmission,
//     required this.registrationYear,
//     required this.bodyType,
//     required this.fuelType,
//     required this.propertyType,
//     required this.size,
//     required this.sizeType,
//     required this.propertyLocation,
//     required this.priceType,
//     required this.animalType,
//     required this.employerLogo,
//     required this.employerWebsite,
//     required this.employmentType,
//     required this.bedroom,
//     required this.imageUrl,
//     required this.category,
//     required this.subcategory,
//     required this.model,
//     required this.designation,
//     required this.serviceType,
//     required this.customer,
//     required this.brand,
//     required this.adFeatures,
//     required this.galleries,
//   });
//
//   factory AdDetails.fromJson(String str) => AdDetails.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory AdDetails.fromMap(Map<String, dynamic> json) => AdDetails(
//     id: json["id"]??0,
//     title: json["title"]??"",
//     slug: json["slug"]??"",
//     userId: json["user_id"]??'',
//     categoryId: json["category_id"]??'',
//     subcategoryId: json["subcategory_id"]??'',
//     brandId: json["brand_id"],
//     brandName: json["brand_name"],
//     price: json["price"]??'0',
//     description: json["description"]??"",
//     phone: json["phone"]??"",
//     showPhone: json["show_phone"]??false,
//     showEmail: json["show_email"]??'0',
//     email: json["email"]??"",
//     phone2: json["phone_2"],
//     thumbnail: json["thumbnail"]??"",
//     status: json["status"]??"",
//     featured: json["featured"]??'0',
//     isFeatured: json["is_featured"]??"",
//     totalReports: json["total_reports"]??'0',
//     totalViews: json["total_views"]??'0',
//     isBlocked: json["is_blocked"]??'0',
//     draftedAt: json["drafted_at"],
//     createdAt: json["created_at"]??"",
//     updatedAt: json["updated_at"]??"",
//     address: json["address"]??"",
//     neighborhood: json["neighborhood"],
//     locality: json["locality"],
//     place: json["place"],
//     district: json["district"],
//     postcode: json["postcode"],
//     region: json["region"],
//     country: json["country"],
//     long: json["long"],
//     lat: json["lat"],
//     whatsapp: json["whatsapp"]??"",
//     serviceTypeId: json["service_type_id"],
//     designationId: json["designation_id"],
//     productModelId: json["product_model_id"],
//     experience: json["experience"],
//     educations: json["educations"],
//     salaryFrom: json["salary_from"],
//     salaryTo: json["salary_to"],
//     deadline: json["deadline"],
//     employerName: json["employer_name"],
//     condition: json["condition"]??"",
//     authenticity: json["authenticity"],
//     ram: json["ram"],
//     edition: json["edition"],
//     processor: json["processor"],
//     trimEdition: json["trim_edition"],
//     yearOfManufacture: json["year_of_manufacture"],
//     engineCapacity: json["engine_capacity"],
//     transmission: json["transmission"],
//     registrationYear: json["registration_year"],
//     bodyType: json["body_type"],
//     fuelType: json["fuel_type"],
//     propertyType: json["property_type"],
//     size: json["size"]??"",
//     sizeType: json["size_type"],
//     propertyLocation: json["property_location"],
//     priceType: json["price_type"],
//     animalType: json["animal_type"],
//     employerLogo: json["employer_logo"],
//     employerWebsite: json["employer_website"],
//     employmentType: json["employment_type"],
//     bedroom: json["bedroom"],
//     imageUrl: json["image_url"]??"",
//     category: Category.fromMap(json["category"]),
//     subcategory: Subcategory.fromMap(json["subcategory"]),
//     model: json["model"],
//     designation: json["designation"],
//     serviceType: json["service_type"],
//     customer: Customer.fromMap(json["customer"]),
//     brand: json["brand"],
//     // adFeatures: List<AdFeature>.from(json["ad_features"].map((x) => x)),
//     adFeatures: json["ad_features"]==null||json["ad_features"]==[]?[]: List<AdFeature>.from(json["ad_features"].map((x) => AdFeature.fromMap(x))),
//     galleries: json["galleries"]==null||json["galleries"]==[]?[]: List<Gallery>.from(json["galleries"].map((x) => Gallery.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "title": title,
//     "slug": slug,
//     "user_id": userId,
//     "category_id": categoryId,
//     "subcategory_id": subcategoryId,
//     "brand_id": brandId,
//     "brand_name": brandName,
//     "price": price,
//     "description": description,
//     "phone": phone,
//     "show_phone": showPhone,
//     "show_email": showEmail,
//     "email": email,
//     "phone_2": phone2,
//     "thumbnail": thumbnail,
//     "status": status,
//     "featured": featured,
//     "is_featured": isFeatured,
//     "total_reports": totalReports,
//     "total_views": totalViews,
//     "is_blocked": isBlocked,
//     "drafted_at": draftedAt,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "address": address,
//     "neighborhood": neighborhood,
//     "locality": locality,
//     "place": place,
//     "district": district,
//     "postcode": postcode,
//     "region": region,
//     "country": country,
//     "long": long,
//     "lat": lat,
//     "whatsapp": whatsapp,
//     "service_type_id": serviceTypeId,
//     "designation_id": designationId,
//     "product_model_id": productModelId,
//     "experience": experience,
//     "educations": educations,
//     "salary_from": salaryFrom,
//     "salary_to": salaryTo,
//     "deadline": deadline,
//     "employer_name": employerName,
//     "condition": condition,
//     "authenticity": authenticity,
//     "ram": ram,
//     "edition": edition,
//     "processor": processor,
//     "trim_edition": trimEdition,
//     "year_of_manufacture": yearOfManufacture,
//     "engine_capacity": engineCapacity,
//     "transmission": transmission,
//     "registration_year": registrationYear,
//     "body_type": bodyType,
//     "fuel_type": fuelType,
//     "property_type": propertyType,
//     "size": size,
//     "size_type": sizeType,
//     "property_location": propertyLocation,
//     "price_type": priceType,
//     "animal_type": animalType,
//     "employer_logo": employerLogo,
//     "employer_website": employerWebsite,
//     "employment_type": employmentType,
//     "bedroom": bedroom,
//     "image_url": imageUrl,
//     "category": category.toMap(),
//     "subcategory": subcategory.toMap(),
//     "model": model,
//     "designation": designation,
//     "service_type": serviceType,
//     "customer": customer.toMap(),
//     "brand": brand,
//     "ad_features": List<dynamic>.from(adFeatures.map((x) => x)),
//     "galleries": List<dynamic>.from(galleries.map((x) => x)),
//   };
// }
//
// class AdFeature {
//   final int id;
//   final String adId;
//   final String name;
//   final String createdAt;
//   final String updatedAt;
//
//   AdFeature({
//     required this.id,
//     required this.adId,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory AdFeature.fromJson(String str) => AdFeature.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory AdFeature.fromMap(Map<String, dynamic> json) => AdFeature(
//     id: json["id"],
//     adId: json["ad_id"],
//     name: json["name"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "ad_id": adId,
//     "name": name,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class Gallery {
//   final int id;
//   final String adId;
//   final String image;
//   final String createdAt;
//   final String updatedAt;
//   final String imageUrl;
//
//   Gallery({
//     required this.id,
//     required this.adId,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.imageUrl,
//   });
//
//   factory Gallery.fromJson(String str) => Gallery.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Gallery.fromMap(Map<String, dynamic> json) => Gallery(
//     id: json["id"],
//     adId: json["ad_id"],
//     image: json["image"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     imageUrl: json["image_url"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "ad_id": adId,
//     "image": image,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "image_url": imageUrl,
//   };
// }

AdDetailsModel adDetailsModelFromJson(String str) =>
    AdDetailsModel.fromJson(json.decode(str));

String adDetailsModelToJson(AdDetailsModel data) => json.encode(data.toJson());

class AdDetailsModel {
  AdDetails adDetails;
  List<Ad> relatedAds;

  AdDetailsModel({
    required this.adDetails,
    required this.relatedAds,
  });

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) => AdDetailsModel(
        adDetails: AdDetails.fromJson(json["ad_details"]),
        relatedAds:
            List<Ad>.from(json["related_ads"].map((x) => Ad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ad_details": adDetails.toJson(),
        "related_ads": List<dynamic>.from(relatedAds.map((x) => x.toJson())),
      };
}

class AdDetails {
  int id;
  String title;
  String slug;
  String userId;
  String categoryId;
  String cityId;
  String subcategoryId;
  dynamic brandId;
  dynamic brandName;
  dynamic price;
  String description;
  String phone;
  bool showPhone;
  String showEmail;
  String email;
  dynamic phone2;
  String thumbnail;
  String status;
  String featured;
  String isFeatured;
  String isColloborate;
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
  String condition;
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
  String size;
  dynamic sizeType;
  dynamic propertyLocation;
  dynamic priceType;
  dynamic animalType;
  dynamic employerLogo;
  dynamic employerWebsite;
  dynamic employmentType;
  dynamic bedroom;
  String imageUrl;
  String averageRating;
  bool isUserReviewed;
  bool isUserPurchased;
  bool isWishlist;
  Category category;

  // Subcategory subcategory;
  List<ProductReview> reviews;
  dynamic model;
  dynamic designation;
  dynamic serviceType;
  AdDetailsCustomer customer;
  dynamic brand;
  List<dynamic> adFeatures;
  List<Galleries>? galleries;

  AdDetails({
    required this.id,
    required this.title,
    required this.slug,
    required this.userId,
    required this.categoryId,
    required this.cityId,
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
    required this.isColloborate,
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
    required this.imageUrl,
    required this.averageRating,
    required this.isUserReviewed,
    required this.isUserPurchased,
    required this.isWishlist,
    required this.category,
    //required this.subcategory,
    required this.reviews,
    required this.model,
    required this.designation,
    required this.serviceType,
    required this.customer,
    required this.brand,
    required this.adFeatures,
    this.galleries,
  });

  factory AdDetails.fromJson(Map<String, dynamic> json) => AdDetails(
        id: json["id"],
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        userId: json["user_id"] ?? "",
        categoryId: json["category_id"] ?? "",
        cityId: json["city_id"] ?? "",
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
        isColloborate: json["is_colloborate"] ?? "",
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
        region: json["region"] ?? "",
        country: json["country"] ?? "",
        long: json["long"] ?? "",
        lat: json["lat"] ?? "",
        whatsapp: json["whatsapp"] ?? "",
        serviceTypeId: json["service_type_id"] ?? "",
        designationId: json["designation_id"] ?? "",
        productModelId: json["product_model_id"] ?? "",
        experience: json["experience"] ?? "",
        educations: json["educations"] ?? "",
        salaryFrom: json["salary_from"] ?? "",
        salaryTo: json["salary_to"] ?? "",
        deadline: json["deadline"] ?? "",
        employerName: json["employer_name"] ?? "",
        condition: json["condition"] ?? '',
        authenticity: json["authenticity"] ?? "",
        ram: json["ram"] ?? "",
        edition: json["edition"] ?? "",
        processor: json["processor"] ?? "",
        trimEdition: json["trim_edition"] ?? "",
        yearOfManufacture: json["year_of_manufacture"] ?? "",
        engineCapacity: json["engine_capacity"] ?? "",
        transmission: json["transmission"] ?? "",
        registrationYear: json["registration_year"] ?? "",
        bodyType: json["body_type"] ?? "",
        fuelType: json["fuel_type"] ?? "",
        propertyType: json["property_type"] ?? "",
        size: json["size"] ?? '',
        sizeType: json["size_type"] ?? "",
        propertyLocation: json["property_location"] ?? "",
        priceType: json["price_type"] ?? "",
        animalType: json["animal_type"] ?? "",
        employerLogo: json["employer_logo"] ?? "",
        employerWebsite: json["employer_website"] ?? "",
        employmentType: json["employment_type"] ?? "",
        bedroom: json["bedroom"] ?? "",
        imageUrl: json["image_url"] ?? "",
        averageRating: json["avg_reviews"] ?? "",
        isUserReviewed: json["is_user_reviewed"] ?? false,
        isUserPurchased: json["is_user_purchased"] ?? false,
        isWishlist: json["is_wishlist"] ?? "",
        category: Category.fromJson(json["category"]),
        //subcategory: Subcategory.fromJson(json["subcategory"]),
        reviews: json['reviews'] == null || json['reviews'] == []
            ? []
            : List<ProductReview>.from(
                json["reviews"].map((x) => ProductReview.fromJson(x))),
        model: json["model"] ?? "",
        designation: json["designation"] ?? "",
        serviceType: json["service_type"] ?? "",
        customer: AdDetailsCustomer.fromJson(json["customer"]),
        brand: json["brand"] ?? "",
        adFeatures: List<dynamic>.from(json["ad_features"].map((x) => x)),
        galleries: json["galleries"] == null || json["galleries"] == []
            ? []
            : List<Galleries>.from(
                json["galleries"].map((x) => Galleries.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "user_id": userId,
        "category_id": categoryId,
        "city_id": cityId,
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
        "is_colloborate": isColloborate,
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
        "image_url": imageUrl,
        "avg_reviews": averageRating,
        "is_user_reviewed": isUserReviewed,
        "is_user_purchased": isUserPurchased,
        "is_wishlist": isWishlist,
        "category": category.toJson(),
        //"subcategory": subcategory.toJson(),
        "reviews": List<ProductReview>.from(reviews.map((x) => x)),
        "model": model,
        "designation": designation,
        "service_type": serviceType,
        "customer": customer.toJson(),
        "brand": brand,
        "ad_features": List<dynamic>.from(adFeatures.map((x) => x)),
        "galleries": List<dynamic>.from(galleries!.map((x) => x)),
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
  List<CustomField> customFields;

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
        image: json["image"] ?? "",
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
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
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
        "custom_fields":
            List<dynamic>.from(customFields.map((x) => x.toJson())),
      };
}

class CustomField {
  int id;
  String customFieldGroupId;
  String name;
  String slug;
  String type;
  String required;
  String filterable;
  String listable;
  String icon;
  String order;
  DateTime createdAt;
  DateTime updatedAt;
  Pivots pivot;

  CustomField({
    required this.id,
    required this.customFieldGroupId,
    required this.name,
    required this.slug,
    required this.type,
    required this.required,
    required this.filterable,
    required this.listable,
    required this.icon,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        id: json["id"],
        customFieldGroupId: json["custom_field_group_id"],
        name: json["name"],
        slug: json["slug"],
        type: json["type"],
        required: json["required"],
        filterable: json["filterable"],
        listable: json["listable"],
        icon: json["icon"],
        order: json["order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivots.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_field_group_id": customFieldGroupId,
        "name": name,
        "slug": slug,
        "type": type,
        "required": required,
        "filterable": filterable,
        "listable": listable,
        "icon": icon,
        "order": order,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivots {
  String categoryId;
  String customFieldId;
  String order;

  Pivots({
    required this.categoryId,
    required this.customFieldId,
    required this.order,
  });

  factory Pivots.fromJson(Map<String, dynamic> json) => Pivots(
        categoryId: json["category_id"],
        customFieldId: json["custom_field_id"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "custom_field_id": customFieldId,
        "order": order,
      };
}

class AdDetailsCustomer {
  int id;
  String name;
  String username;
  dynamic userMode;
  String email;
  String image;
  DateTime createdAt;
  String totalUserProducts;
  String imageUrl;
  int unread;
  List<Review>? reviews;
  UserPlan? userPlan;

  AdDetailsCustomer({
    required this.id,
    required this.name,
    required this.username,
    required this.userMode,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.totalUserProducts,
    required this.imageUrl,
    required this.unread,
    this.reviews,
    this.userPlan,
  });

  factory AdDetailsCustomer.fromJson(Map<String, dynamic> json) =>
      AdDetailsCustomer(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        userMode: json["user_mode"],
        email: json["email"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        totalUserProducts: json["total_user_products"] ?? "",
        imageUrl: json["image_url"],
        unread: json["unread"],
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        //     List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        userPlan: json["user_plan"] == null
            ? null
            : UserPlan.fromJson(json["user_plan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "user_mode": userMode,
        "email": email,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "total_user_products": totalUserProducts,
        "image_url": imageUrl,
        "unread": unread,
        "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "user_plan": userPlan!.toJson(),
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

  Review({
    required this.id,
    required this.sellerId,
    required this.userId,
    required this.stars,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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

List<ProductReview> productReviewFromJson(String str) =>
    List<ProductReview>.from(
        json.decode(str).map((x) => ProductReview.fromJson(x)));

String productReviewToJson(List<ProductReview> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductReview {
  int id;
  dynamic sellerId;
  String adId;
  String userId;
  String stars;
  String comment;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  User? user;

  ProductReview({
    required this.id,
    required this.sellerId,
    required this.adId,
    required this.userId,
    required this.stars,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        id: json["id"],
        sellerId: json["seller_id"],
        adId: json["ad_id"],
        userId: json["user_id"],
        stars: json["stars"],
        comment: json["comment"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "ad_id": adId,
        "user_id": userId,
        "stars": stars,
        "comment": comment,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  int id;
  String name;
  String username;
  String imageUrl;
  int unread;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.imageUrl,
    required this.unread,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? '',
        username: json["username"] ?? '',
        imageUrl: json["image_url"] ?? '',
        unread: json["unread"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "image_url": imageUrl,
        "unread": unread,
      };
}

class UserPlan {
  int id;
  String userId;
  String adLimit;
  String featuredLimit;
  String businessDirectoryLimit;
  String eventLimit;
  bool badge;
  DateTime createdAt;
  DateTime updatedAt;
  String subscriptionType;
  dynamic expiredDate;
  dynamic currentPlanId;
  bool isRestoredPlanBenefits;
  bool remainingDays;
  bool planExpired;

  UserPlan({
    required this.id,
    required this.userId,
    required this.adLimit,
    required this.featuredLimit,
    required this.businessDirectoryLimit,
    required this.eventLimit,
    required this.badge,
    required this.createdAt,
    required this.updatedAt,
    required this.subscriptionType,
    required this.expiredDate,
    required this.currentPlanId,
    required this.isRestoredPlanBenefits,
    required this.remainingDays,
    required this.planExpired,
  });

  factory UserPlan.fromJson(Map<String, dynamic> json) => UserPlan(
        id: json["id"],
        userId: json["user_id"],
        adLimit: json["ad_limit"],
        featuredLimit: json["featured_limit"],
        businessDirectoryLimit: json["business_directory_limit"],
        eventLimit: json["event_limit"],
        badge: json["badge"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subscriptionType: json["subscription_type"],
        expiredDate: json["expired_date"],
        currentPlanId: json["current_plan_id"],
        isRestoredPlanBenefits: json["is_restored_plan_benefits"],
        remainingDays: json["remaining_days"],
        planExpired: json["plan_expired"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ad_limit": adLimit,
        "featured_limit": featuredLimit,
        "business_directory_limit": businessDirectoryLimit,
        "event_limit": eventLimit,
        "badge": badge,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subscription_type": subscriptionType,
        "expired_date": expiredDate,
        "current_plan_id": currentPlanId,
        "is_restored_plan_benefits": isRestoredPlanBenefits,
        "remaining_days": remainingDays,
        "plan_expired": planExpired,
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

class RelatedAd {
  int id;
  String title;
  String slug;
  String userId;
  String categoryId;
  String subcategoryId;
  dynamic brandId;
  dynamic brandName;
  String price;
  String description;
  String phone;
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
  List<String> fuelType;
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
  String imageUrl;
  bool isWishlist;
  Category category;
  Subcategory subcategory;
  dynamic model;
  dynamic serviceType;
  dynamic designation;
  RelatedAdCustomer customer;
  dynamic brand;
  List<AdFeature> adFeatures;
  List<Gallery> galleries;

  RelatedAd({
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
    required this.imageUrl,
    required this.isWishlist,
    required this.category,
    required this.subcategory,
    required this.model,
    required this.serviceType,
    required this.designation,
    required this.customer,
    required this.brand,
    required this.adFeatures,
    required this.galleries,
  });

  factory RelatedAd.fromJson(Map<String, dynamic> json) => RelatedAd(
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
        fuelType: List<String>.from(json["fuel_type"].map((x) => x)),
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
        imageUrl: json["image_url"],
        isWishlist: json["is_wishlist"],
        category: Category.fromJson(json["category"]),
        subcategory: Subcategory.fromJson(json["subcategory"]),
        model: json["model"],
        serviceType: json["service_type"],
        designation: json["designation"],
        customer: RelatedAdCustomer.fromJson(json["customer"]),
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
        "fuel_type": List<dynamic>.from(fuelType.map((x) => x)),
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
        "image_url": imageUrl,
        "is_wishlist": isWishlist,
        "category": category.toJson(),
        "subcategory": subcategory.toJson(),
        "model": model,
        "service_type": serviceType,
        "designation": designation,
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

class RelatedAdCustomer {
  int id;
  String name;
  String username;
  String email;
  dynamic userMode;
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
  dynamic aboutPublicProfile;
  dynamic openingHour;
  dynamic closingHours;
  String imageUrl;
  int unread;

  RelatedAdCustomer({
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
  });

  factory RelatedAdCustomer.fromJson(Map<String, dynamic> json) =>
      RelatedAdCustomer(
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
