import 'dart:convert';

// class HomeModel {
//   final List<CountryModel> topCountry;
//   final List<AdsModel> ads;
//   final List<Category> categories;
//   final List<BrandModel> brands;
//   final List<ServiceTypeModel> serviceTypes;
//   final List<ServiceTypeModel> designations;
//   final List<AdsModel> featureAds;
//   final List<AdsModel> latestAds;
//   final int verifiedUsers;
//
//   HomeModel({
//     required this.topCountry,
//     required this.ads,
//     required this.categories,
//     required this.brands,
//     required this.serviceTypes,
//     required this.designations,
//     required this.featureAds,
//     required this.latestAds,
//     required this.verifiedUsers,
//   });
//
//   factory HomeModel.fromJson(String str) => HomeModel.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
//     topCountry: List<CountryModel>.from(json["topCountry"].map((x) => CountryModel.fromMap(x))),
//     ads: List<AdsModel>.from(json["ads"].map((x) => AdsModel.fromMap(x))),
//     categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
//     brands: List<BrandModel>.from(json["brands"].map((x) => BrandModel.fromMap(x))),
//     serviceTypes: List<ServiceTypeModel>.from(json["service_types"].map((x) => ServiceTypeModel.fromMap(x))),
//     designations: List<ServiceTypeModel>.from(json["designations"].map((x) => ServiceTypeModel.fromMap(x))),
//     featureAds: List<AdsModel>.from(json["featureAds"].map((x) => AdsModel.fromMap(x))),
//     latestAds: List<AdsModel>.from(json["latestAds"].map((x) => AdsModel.fromMap(x))),
//     verifiedUsers: json["verified_users"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "topCountry": List<dynamic>.from(topCountry.map((x) => x.toMap())),
//     "ads": List<dynamic>.from(ads.map((x) => x.toMap())),
//     "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
//     "brands": List<dynamic>.from(brands.map((x) => x.toMap())),
//     "service_types": List<dynamic>.from(serviceTypes.map((x) => x.toMap())),
//     "designations": List<dynamic>.from(designations.map((x) => x.toMap())),
//     "featureAds": List<dynamic>.from(featureAds.map((x) => x.toMap())),
//     "latestAds": List<dynamic>.from(latestAds.map((x) => x.toMap())),
//     "verified_users": verifiedUsers,
//   };
// }

///
// HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));
//
// String homeModelToJson(HomeModel data) => json.encode(data.toJson());
//
// class HomeModel {
//   List<TopCountry> topCountry;
//   List<Ad> ads;
//   List<Categories> categories;
//   List<Brand> brands;
//   List<Brand> serviceTypes;
//   List<Designation> designations;
//   List<Ad> featureAds;
//
//   // List<LatestAd> latestAds;
//   List<Ad> latestAds;
//   int verifiedUsers;
//   Cms cms;
//
//   HomeModel({
//     required this.topCountry,
//     required this.ads,
//     required this.categories,
//     required this.brands,
//     required this.serviceTypes,
//     required this.designations,
//     required this.featureAds,
//     required this.latestAds,
//     required this.verifiedUsers,
//     required this.cms,
//   });
//
//   factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
//         topCountry: List<TopCountry>.from(
//             json["topCountry"].map((x) => TopCountry.fromJson(x))),
//         ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
//         categories: List<Categories>.from(
//             json["categories"].map((x) => Categories.fromJson(x))),
//         brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
//         serviceTypes: List<Brand>.from(
//             json["service_types"].map((x) => Brand.fromJson(x))),
//         designations: List<Designation>.from(
//             json["designations"].map((x) => Designation.fromJson(x))),
//         featureAds:
//             List<Ad>.from(json["featureAds"].map((x) => Ad.fromJson(x))),
//         latestAds: List<Ad>.from(json["latestAds"].map((x) => Ad.fromJson(x))),
//         verifiedUsers: json["verified_users"],
//         cms: Cms.fromJson(json["cms"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "topCountry": List<dynamic>.from(topCountry.map((x) => x.toJson())),
//         "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
//         "service_types":
//             List<dynamic>.from(serviceTypes.map((x) => x.toJson())),
//         "designations": List<dynamic>.from(designations.map((x) => x.toJson())),
//         "featureAds": List<dynamic>.from(featureAds.map((x) => x.toJson())),
//         "latestAds": List<dynamic>.from(latestAds.map((x) => x.toJson())),
//         "verified_users": verifiedUsers,
//         "cms": cms.toJson(),
//       };
// }
//
// class Ad {
//   int id;
//   String title;
//   String slug;
//   String thumbnail;
//   String price;
//   String featured;
//   dynamic region;
//   dynamic country;
//   String address;
//   String totalViews;
//   Categories category;
//   Customer customer;
//   String createdAt;
//   bool isWishlist;
//
//   Ad({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.thumbnail,
//     required this.price,
//     required this.featured,
//     required this.region,
//     required this.country,
//     required this.address,
//     required this.totalViews,
//     required this.category,
//     required this.customer,
//     required this.createdAt,
//     required this.isWishlist,
//   });
//
//   factory Ad.fromJson(Map<String, dynamic> json) => Ad(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         thumbnail: json["thumbnail"],
//         price: json["price"],
//         featured: json["featured"],
//         region: json["region"],
//         country: json["country"],
//         address: json["address"],
//         totalViews: json["total_views"],
//         category: Categories.fromJson(json["category"]),
//         customer: Customer.fromJson(json["customer"]),
//         createdAt: json["created_at"],
//         isWishlist: json["is_wishlist"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "thumbnail": thumbnail,
//         "price": price,
//         "featured": featured,
//         "region": region,
//         "country": country,
//         "address": address,
//         "total_views": totalViews,
//         "category": category.toJson(),
//         "customer": customer.toJson(),
//         "created_at": createdAt,
//         "is_wishlist": isWishlist,
//       };
// }
//
// class Categories {
//   int id;
//   String name;
//   String slug;
//   String icon;
//   String order;
//   String image;
//   bool hasCustomField;
//   List<Subcategories> subcategories;
//
//   Categories({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.icon,
//     required this.order,
//     required this.image,
//     required this.hasCustomField,
//     required this.subcategories,
//   });
//
//   factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"] ?? '',
//         icon: json["icon"],
//         order: json["order"] ?? '',
//         image: json["image"] ?? '',
//         hasCustomField: json["has_custom_field"],
//         subcategories: List<Subcategories>.from(
//             json["subcategories"].map((x) => Subcategories.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "icon": icon,
//         "order": order,
//         "image": image,
//         "has_custom_field": hasCustomField,
//         "subcategories":
//             List<dynamic>.from(subcategories.map((x) => x.toJson())),
//       };
// }
//
// class Subcategories {
//   int id;
//   String name;
//   String slug;
//
//   Subcategories({
//     required this.id,
//     required this.name,
//     required this.slug,
//   });
//
//   factory Subcategories.fromJson(Map<String, dynamic> json) => Subcategories(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//       };
// }
//
// class Customer {
//   int id;
//   String name;
//   String username;
//   String email;
//   dynamic userMode;
//   String showEmail;
//   String receiveEmail;
//   String phone;
//   String showPhone;
//   DateTime emailVerifiedAt;
//   dynamic web;
//   String image;
//   dynamic token;
//   DateTime lastSeen;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String authType;
//   String provider;
//   String providerId;
//   String isSocialLogin;
//   String socialToBusiness;
//   dynamic fcmToken;
//   dynamic aboutPublicProfile;
//   dynamic openingHour;
//   dynamic closingHours;
//   String imageUrl;
//   int unread;
//
//   Customer({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.userMode,
//     required this.showEmail,
//     required this.receiveEmail,
//     required this.phone,
//     required this.showPhone,
//     required this.emailVerifiedAt,
//     required this.web,
//     required this.image,
//     required this.token,
//     required this.lastSeen,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.authType,
//     required this.provider,
//     required this.providerId,
//     required this.isSocialLogin,
//     required this.socialToBusiness,
//     required this.fcmToken,
//     required this.aboutPublicProfile,
//     required this.openingHour,
//     required this.closingHours,
//     required this.imageUrl,
//     required this.unread,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         id: json["id"],
//         name: json["name"],
//         username: json["username"],
//         email: json["email"],
//         userMode: json["user_mode"],
//         showEmail: json["show_email"],
//         receiveEmail: json["receive_email"],
//         phone: json["phone"],
//         showPhone: json["show_phone"],
//         emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
//         web: json["web"],
//         image: json["image"],
//         token: json["token"],
//         lastSeen: DateTime.parse(json["last_seen"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         authType: json["auth_type"],
//         provider: json["provider"],
//         providerId: json["provider_id"],
//         isSocialLogin: json["is_social_login"],
//         socialToBusiness: json["social_to_business"],
//         fcmToken: json["fcm_token"],
//         aboutPublicProfile: json["about_public_profile"],
//         openingHour: json["opening_hour"],
//         closingHours: json["closing_hours"],
//         imageUrl: json["image_url"],
//         unread: json["unread"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "username": username,
//         "email": email,
//         "user_mode": userMode,
//         "show_email": showEmail,
//         "receive_email": receiveEmail,
//         "phone": phone,
//         "show_phone": showPhone,
//         "email_verified_at": emailVerifiedAt.toIso8601String(),
//         "web": web,
//         "image": image,
//         "token": token,
//         "last_seen": lastSeen.toIso8601String(),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "auth_type": authType,
//         "provider": provider,
//         "provider_id": providerId,
//         "is_social_login": isSocialLogin,
//         "social_to_business": socialToBusiness,
//         "fcm_token": fcmToken,
//         "about_public_profile": aboutPublicProfile,
//         "opening_hour": openingHour,
//         "closing_hours": closingHours,
//         "image_url": imageUrl,
//         "unread": unread,
//       };
// }
//
// class Brand {
//   int id;
//   String categoryId;
//   String name;
//   String slug;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<Designation> models;
//   String status;
//   String type;
//
//   Brand({
//     required this.id,
//     required this.categoryId,
//     required this.name,
//     required this.slug,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.models,
//     required this.status,
//     required this.type,
//   });
//
//   factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//         id: json["id"],
//         categoryId: json["category_id"],
//         name: json["name"],
//         slug: json["slug"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         models: List<Designation>.from(
//             json["models"].map((x) => Designation.fromJson(x))),
//         status: json["status"],
//         type: json["type"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_id": categoryId,
//         "name": name,
//         "slug": slug,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "models": List<dynamic>.from(models.map((x) => x.toJson())),
//         "status": status,
//         "type": type,
//       };
// }
//
// class Designation {
//   int id;
//   String brandId;
//   String name;
//   String slug;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Designation({
//     required this.id,
//     required this.brandId,
//     required this.name,
//     required this.slug,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Designation.fromJson(Map<String, dynamic> json) => Designation(
//         id: json["id"],
//         brandId: json["brand_id"],
//         name: json["name"],
//         slug: json["slug"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "brand_id": brandId,
//         "name": name,
//         "slug": slug,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
//
// class Cms {
//   String homeMainBanner;
//   String homeTitle;
//   String homeTitleChinese;
//   String homeTitleFrench;
//   String homeTitleBislama;
//   String homeDescription;
//   String homeDescriptionChinese;
//   String homeDescriptionFrench;
//   String homeDescriptionBislama;
//   String postingRulesBackgroundUrl;
//
//   Cms({
//     required this.homeMainBanner,
//     required this.homeTitle,
//     required this.homeTitleChinese,
//     required this.homeTitleFrench,
//     required this.homeTitleBislama,
//     required this.homeDescription,
//     required this.homeDescriptionChinese,
//     required this.homeDescriptionFrench,
//     required this.homeDescriptionBislama,
//     required this.postingRulesBackgroundUrl,
//   });
//
//   factory Cms.fromJson(Map<String, dynamic> json) => Cms(
//         homeMainBanner: json["home_main_banner"],
//         homeTitle: json["home_title"],
//         homeTitleChinese: json["home_title_chinese"],
//         homeTitleFrench: json["home_title_french"],
//         homeTitleBislama: json["home_title_bislama"],
//         homeDescription: json["home_description"],
//         homeDescriptionChinese: json["home_description_chinese"],
//         homeDescriptionFrench: json["home_description_french"],
//         homeDescriptionBislama: json["home_description_bislama"],
//         postingRulesBackgroundUrl: json["posting_rules_background_url"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "home_main_banner": homeMainBanner,
//         "home_title": homeTitle,
//         "home_title_chinese": homeTitleChinese,
//         "home_title_french": homeTitleFrench,
//         "home_title_bislama": homeTitleBislama,
//         "home_description": homeDescription,
//         "home_description_chinese": homeDescriptionChinese,
//         "home_description_french": homeDescriptionFrench,
//         "home_description_bislama": homeDescriptionBislama,
//         "posting_rules_background_url": postingRulesBackgroundUrl,
//       };
// }
//
// class LatestAd {
//   int id;
//   String title;
//   String slug;
//   String thumbnail;
//   String price;
//   String featured;
//   dynamic region;
//   dynamic country;
//   String address;
//   String totalViews;
//   Category category;
//   Brand subcategory;
//   dynamic brand;
//   Customer customer;
//   List<AdFeature> adFeatures;
//   List<Galleries> galleries;
//   String createdAt;
//   bool isWishlist;
//
//   LatestAd({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.thumbnail,
//     required this.price,
//     required this.featured,
//     required this.region,
//     required this.country,
//     required this.address,
//     required this.totalViews,
//     required this.category,
//     required this.subcategory,
//     required this.brand,
//     required this.customer,
//     required this.adFeatures,
//     required this.galleries,
//     required this.createdAt,
//     required this.isWishlist,
//   });
//
//   factory LatestAd.fromJson(Map<String, dynamic> json) => LatestAd(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         thumbnail: json["thumbnail"],
//         price: json["price"],
//         featured: json["featured"],
//         region: json["region"],
//         country: json["country"],
//         address: json["address"],
//         totalViews: json["total_views"],
//         category: Category.fromJson(json["category"]),
//         subcategory: Brand.fromJson(json["subcategory"]),
//         brand: json["brand"],
//         customer: Customer.fromJson(json["customer"]),
//         adFeatures: List<AdFeature>.from(
//             json["adFeatures"].map((x) => AdFeature.fromJson(x))),
//         galleries: List<Galleries>.from(
//             json["galleries"].map((x) => Galleries.fromJson(x))),
//         createdAt: json["created_at"],
//         isWishlist: json["is_wishlist"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "thumbnail": thumbnail,
//         "price": price,
//         "featured": featured,
//         "region": region,
//         "country": country,
//         "address": address,
//         "total_views": totalViews,
//         "category": category.toJson(),
//         "subcategory": subcategory.toJson(),
//         "brand": brand,
//         "customer": customer.toJson(),
//         "adFeatures": List<dynamic>.from(adFeatures.map((x) => x.toJson())),
//         "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
//         "created_at": createdAt,
//         "is_wishlist": isWishlist,
//       };
// }
//
// class AdFeature {
//   int id;
//   String adId;
//   String name;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   AdFeature({
//     required this.id,
//     required this.adId,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory AdFeature.fromJson(Map<String, dynamic> json) => AdFeature(
//         id: json["id"],
//         adId: json["ad_id"],
//         name: json["name"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "ad_id": adId,
//         "name": name,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
//
// class Galleries {
//   int id;
//   String adId;
//   String image;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String imageUrl;
//
//   Galleries({
//     required this.id,
//     required this.adId,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.imageUrl,
//   });
//
//   factory Galleries.fromJson(Map<String, dynamic> json) => Galleries(
//         id: json["id"],
//         adId: json["ad_id"],
//         image: json["image"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         imageUrl: json["image_url"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "ad_id": adId,
//         "image": image,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "image_url": imageUrl,
//       };
// }
//
// class TopCountry {
//   dynamic country;
//   String total;
//
//   TopCountry({
//     required this.country,
//     required this.total,
//   });
//
//   factory TopCountry.fromJson(Map<String, dynamic> json) => TopCountry(
//         country: json["country"],
//         total: json["total"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "country": country,
//         "total": total,
//       };
// }
///

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<TopCountry> topCountry;
  List<Ad> ads;
  List<Categories> categories;
  List<Brand> brands;
  List<Brand> serviceTypes;
  List<Brand> designations;
  List<Ad> featureAds;
  List<Ad> latestAds;
  List<Colobarate> colobarates;

  int verifiedUsers;
  Cms cms;

  HomeModel({
    required this.topCountry,
    required this.ads,
    required this.categories,
    required this.brands,
    required this.serviceTypes,
    required this.designations,
    required this.featureAds,
    required this.latestAds,
    required this.verifiedUsers,
    required this.colobarates,
    required this.cms,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        topCountry: List<TopCountry>.from(
            json["topCountry"].map((x) => TopCountry.fromJson(x))),
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
        categories: List<Categories>.from(
            json["categories"].map((x) => Categories.fromJson(x))),
        brands: json["brands"] == null
            ? []
            : List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        serviceTypes: List<Brand>.from(
            json["service_types"].map((x) => Brand.fromJson(x))),
        designations: List<Brand>.from(
            json["designations"].map((x) => Brand.fromJson(x))),
        featureAds:
            List<Ad>.from(json["featureAds"].map((x) => Ad.fromJson(x))),
        latestAds: List<Ad>.from(json["latestAds"].map((x) => Ad.fromJson(x))),
        verifiedUsers: json["verified_users"],
        cms: Cms.fromJson(json["cms"]),
        colobarates: List<Colobarate>.from(
            json["colobarates"].map((x) => Colobarate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topCountry": List<dynamic>.from(topCountry.map((x) => x.toJson())),
        "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "service_types":
            List<dynamic>.from(serviceTypes.map((x) => x.toJson())),
        "designations": List<dynamic>.from(designations.map((x) => x.toJson())),
        "featureAds": List<dynamic>.from(featureAds.map((x) => x.toJson())),
        "latestAds": List<dynamic>.from(latestAds.map((x) => x.toJson())),
        "verified_users": verifiedUsers,
        "cms": cms.toJson(),
      };
}

class Ad {
  int id;
  String title;
  String slug;
  String thumbnail;
  String price;
  String featured;
  dynamic region;
  dynamic country;
  String address;
  String totalViews;
  Categories category;
  Brand? subcategory;
  dynamic brand;
  Customer? customer;
  List<AdFeature> adFeatures;
  List<Galleries> galleries;
  String createdAt;
  bool isWishlist;

  Ad({
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
    this.subcategory,
    required this.brand,
    required this.customer,
    required this.adFeatures,
    required this.galleries,
    required this.createdAt,
    required this.isWishlist,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        thumbnail: json["thumbnail"] ?? '',
        price: json["price"] ?? '0',
        featured: json["featured"],
        region: json["region"],
        country: json["country"],
        address: json["address"] ?? '',
        totalViews: json["total_views"],
        category: Categories.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Brand.fromJson(json["subcategory"]),
        brand: json["brand"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        adFeatures: json["adFeatures"] == null
            ? []
            : List<AdFeature>.from(
                json["adFeatures"].map((x) => AdFeature.fromJson(x))),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"].map((x) => Galleries.fromJson(x))),
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
        "subcategory": subcategory!.toJson(),
        "brand": brand,
        "customer": customer!.toJson(),
        "adFeatures": List<dynamic>.from(adFeatures.map((x) => x.toJson())),
        "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
        "created_at": createdAt,
        "is_wishlist": isWishlist,
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

class Categories {
  int id;
  String name;
  String slug;
  String icon;
  String order;
  String image;
  bool hasCustomField;
  List<Subcategories> subcategories;

  Categories({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.order,
    required this.image,
    required this.hasCustomField,
    required this.subcategories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        icon: json["icon"] ?? "",
        order: json["order"] ?? "",
        image: json["image"] ?? "",
        hasCustomField: json["has_custom_field"] ?? "",
        subcategories: json["subcategories"] == null
            ? []
            : List<Subcategories>.from(
                json["subcategories"].map((x) => Subcategories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "order": order,
        "image": image,
        "has_custom_field": hasCustomField,
        "subcategories":
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
      };
}

class Subcategories {
  int id;
  String name;
  String slug;

  Subcategories({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Subcategories.fromJson(Map<String, dynamic> json) => Subcategories(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Customer {
  int id;
  String name;
  String username;
  String email;
  dynamic userMode;
  String showEmail;
  String receiveEmail;
  String phone;
  String showPhone;

  // DateTime emailVerifiedAt;
  dynamic web;
  String image;
  dynamic token;

  // DateTime lastSeen;
  DateTime createdAt;
  DateTime updatedAt;
  String authType;
  String provider;
  String providerId;
  String isSocialLogin;
  String socialToBusiness;
  dynamic fcmToken;
  dynamic aboutPublicProfile;
  dynamic openingHour;
  dynamic closingHours;
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
    // required this.emailVerifiedAt,
    required this.web,
    required this.image,
    required this.token,
    // required this.lastSeen,
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        userMode: json["user_mode"],
        showEmail: json["show_email"] ?? '',
        receiveEmail: json["receive_email"],
        phone: json["phone"] ?? '',
        showPhone: json["show_phone"] ?? '',
        // emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        web: json["web"] ?? '',
        image: json["image"],
        token: json["token"] ?? '',
        // lastSeen: DateTime.parse(json["last_seen"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        authType: json["auth_type"],
        provider: json["provider"] ?? '',
        providerId: json["provider_id"] ?? '',
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
        // "email_verified_at": emailVerifiedAt.toIso8601String(),
        "web": web,
        "image": image,
        "token": token,
        // "last_seen": lastSeen.toIso8601String(),
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

class Galleries {
  int id;
  String adId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  Galleries({
    required this.id,
    required this.adId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Galleries.fromJson(Map<String, dynamic> json) => Galleries(
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

class Brand {
  int id;
  String categoryId;
  String name;
  String slug;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String type;
  List<Brand> models;
  String brandId;

  Brand({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.models,
    required this.brandId,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        categoryId: json["category_id"] ?? '',
        name: json["name"],
        slug: json["slug"],
        status: json["status"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"] ?? '',
        models: json["models"] == null
            ? []
            : List<Brand>.from(json["models"].map((x) => Brand.fromJson(x))),
        brandId: json["brand_id"] ?? '',
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
        "models": List<dynamic>.from(models.map((x) => x.toJson())),
        "brand_id": brandId,
      };
}

class Cms {
  String homeMainBanner;
  String homeTitle;
  String homeTitleChinese;
  String homeTitleFrench;
  String homeTitleBislama;
  String homeDescription;
  String homeDescriptionChinese;
  String homeDescriptionFrench;
  String homeDescriptionBislama;
  String postingRulesBackgroundUrl;

  Cms({
    required this.homeMainBanner,
    required this.homeTitle,
    required this.homeTitleChinese,
    required this.homeTitleFrench,
    required this.homeTitleBislama,
    required this.homeDescription,
    required this.homeDescriptionChinese,
    required this.homeDescriptionFrench,
    required this.homeDescriptionBislama,
    required this.postingRulesBackgroundUrl,
  });

  factory Cms.fromJson(Map<String, dynamic> json) => Cms(
        homeMainBanner: json["home_main_banner"],
        homeTitle: json["home_title"],
        homeTitleChinese: json["home_title_chinese"],
        homeTitleFrench: json["home_title_french"],
        homeTitleBislama: json["home_title_bislama"],
        homeDescription: json["home_description"],
        homeDescriptionChinese: json["home_description_chinese"],
        homeDescriptionFrench: json["home_description_french"],
        homeDescriptionBislama: json["home_description_bislama"],
        postingRulesBackgroundUrl: json["posting_rules_background_url"],
      );

  Map<String, dynamic> toJson() => {
        "home_main_banner": homeMainBanner,
        "home_title": homeTitle,
        "home_title_chinese": homeTitleChinese,
        "home_title_french": homeTitleFrench,
        "home_title_bislama": homeTitleBislama,
        "home_description": homeDescription,
        "home_description_chinese": homeDescriptionChinese,
        "home_description_french": homeDescriptionFrench,
        "home_description_bislama": homeDescriptionBislama,
        "posting_rules_background_url": postingRulesBackgroundUrl,
      };
}

class TopCountry {
  dynamic country;
  String total;

  TopCountry({
    required this.country,
    required this.total,
  });

  factory TopCountry.fromJson(Map<String, dynamic> json) => TopCountry(
        country: json["country"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "total": total,
      };
}

class Colobarate {
  final int id;
  final String title;
  final String slug;
  final String thumbnail;
  final String price;
  final String featured;
  final dynamic region;
  final dynamic country;
  final String address;
  final String totalViews;
  final Category category;
  final dynamic subcategory;
  final dynamic brand;
  final Customer customer;
  final List<dynamic> adFeatures;
  final List<dynamic> galleries;
  final String createdAt;
  final bool isWishlist;

  Colobarate({
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
    required this.subcategory,
    required this.brand,
    required this.customer,
    required this.adFeatures,
    required this.galleries,
    required this.createdAt,
    required this.isWishlist,
  });

  factory Colobarate.fromJson(Map<String, dynamic> json) => Colobarate(
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
        subcategory: json["subcategory"],
        brand: json["brand"],
        customer: Customer.fromJson(json["customer"]),
        adFeatures: List<dynamic>.from(json["adFeatures"].map((x) => x)),
        galleries: List<dynamic>.from(json["galleries"].map((x) => x)),
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
        "subcategory": subcategory,
        "brand": brand,
        "customer": customer.toJson(),
        "adFeatures": List<dynamic>.from(adFeatures.map((x) => x)),
        "galleries": List<dynamic>.from(galleries.map((x) => x)),
        "created_at": createdAt,
        "is_wishlist": isWishlist,
      };
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final String order;
  final dynamic image;
  final bool hasCustomField;

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
