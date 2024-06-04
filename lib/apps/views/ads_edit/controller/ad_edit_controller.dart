import 'dart:convert';
import 'dart:io';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/ad_details/model/ad_details_model.dart';
import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/my_ads/controller/my_ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdEditController extends GetxController {
  final LoginController loginController;
  final HomeController homeController;
  final MyAdsController myAdsController;
  final AdRepository adRepository;
  final HomeRepository homeRepository;

  AdEditController(this.loginController, this.homeController, this.adRepository,
      this.myAdsController, this.homeRepository);

  final featureFormKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final whatsappController = TextEditingController();
  final webSiteController = TextEditingController();

  RxList<Categories> categoryList = <Categories>[].obs;
  RxList<CityModel> cityList = <CityModel>[].obs;

  /// ....................Feature Photo Picker ...................
  String? originalImage;
  String? featureImage;
  String base64featureImage = '';
  List<String> base64featureImages = [];

  RxBool isPaymentChecked = false.obs;
  RxBool isCollaborate = false.obs;

  pickImage() async {
    await Utils.pickSingleImage().then((value) async {
      if (value != null) {
        originalImage = value;
        File file = File(originalImage!);
        if (file != null) {
          featureImage = file.path;
          List<int> imageBytes = await file.readAsBytes();
          base64featureImage =
              'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';
          print("feature image is: $base64featureImage");
        }
      }
    });
    update();
    return base64featureImage;
  }

  String selectedCityId = '';
  CityModel? city;

  changeCity(CityModel value) {
    selectedCityId = value.id.toString();
  }

  /// .................... Photo Picker ...................
  final ImagePicker picker = ImagePicker();
  List<XFile>? images = [];
  List<String> base64Images = [];

  Future<List<String>?> pickImages() async {
    List<String> imagePaths = [];
    List<XFile>? tempImages = await picker.pickMultiImage();
    if (tempImages == null) {
      return imagePaths;
    } else {
      images = tempImages;
      base64Images = [];
      for (XFile file in images!) {
        List<int> imageBytes = await file.readAsBytes();
        base64Images.add(
            'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}');
        imagePaths.add(file.path);
      }
      update();
      return base64Images;
    }
  }

  List<String> imageList = [];
  List<Galleries> imageGallery = [];

  List<Subcategories> subcategoryList = [];
  Subcategories? subcategory;
  String selectedSubcategory = '';
  String selectedCategory = '';

  RxBool isLoading = false.obs;
  RxBool isUpdateAdsLoading = false.obs;
  AdDetails? adDetails;
  List<CityModel> cities = [];

  String id = '';

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments;
    getCityData();
  }

  Future<void> getCityData() async {
    isLoading(true);
    final result = await homeRepository.getCityData();
    result.fold((error) {}, (data) async {
      cities = data;
      getAdEditData();
    });
  }

  Future<void> getAdEditData() async {
    final result = await adRepository.getAdEditData(
        loginController.userInfo?.token ?? "", id);
    result.fold((error) {
      print(error.message);
      isLoading(false);
    }, (data) async {
      adDetails = data;
      getOldData(data);
    });
  }

  getOldData(AdDetails adDetails) async {
    selectedCategory = adDetails.categoryId.toString();
    titleController.text = adDetails.title;
    priceController.text = adDetails.price.toString();
    addressController.text = adDetails.address;
    descriptionController.text = adDetails.description;
    phoneController.text = adDetails.phone;
    emailController.text = adDetails.email;
    whatsappController.text = adDetails.whatsapp ?? "";
    webSiteController.text = "";
    featureImage = adDetails.galleries![0].imageUrl;
    isPaymentChecked.value =
        adDetails.featured.compareTo('0') == 0 ? false : true;
    isCollaborate.value =
        adDetails.isColloborate.compareTo('0') == 0 ? false : true;
    for (int i = 1; i < adDetails.galleries!.length; i++) {
      imageGallery.add(adDetails.galleries![i]);
    }

    for (CityModel m in cities) {
      if (m.id.toString().compareTo(adDetails.cityId) == 0) {
        city = m;
        selectedCityId = m.id.toString();
        break;
      }
    }
    isLoading(false);
  }

  Future<void> updateAds() async {
    isUpdateAdsLoading.value = true;
    final body = <String, dynamic>{};
    body.addAll({"title": titleController.text.trim()});
    body.addAll({"category_id": selectedCategory});
    body.addAll({"address": addressController.text.trim()});
    body.addAll({"price": priceController.text.trim()});
    body.addAll({"phone": phoneController.text.trim()});
    body.addAll({"description": descriptionController.text.trim()});
    body.addAll({"city_id": selectedCityId});
    body.addAll({"featured": isPaymentChecked.value ? '1' : '0'});
    body.addAll({"is_colloborate": isCollaborate.value ? '1' : '0'});
    if (base64Images.isNotEmpty) {
      body.addAll({"images": base64Images.toString()});
    }
    if (base64featureImage.isNotEmpty) {
      body.addAll({"thumbnail": base64featureImage});
    }

    print(body);
    final result =
        await adRepository.updateAds(loginController.userInfo!.token, body, id);

    result.fold((error) {
      print(error.message);
      Get.snackbar('Warning', error.message,
          backgroundColor: Colors.red.shade300, colorText: Colors.black);
      isUpdateAdsLoading.value = false;
    }, (data) async {
      clearAll();
      Navigator.pop(Get.context!);
      myAdsController.getAdsData();
      Get.snackbar('Success', data, colorText: Colors.black);
      isUpdateAdsLoading.value = false;
    });
  }

  clearAll() {
    titleController.text = "";
    addressController.text = "";
    priceController.text = "";
    phoneController.text = "";
    whatsappController.text = "";
    descriptionController.text = "";
  }

  formateString(s) {
    var pos = s.lastIndexOf('/');
    String result = (pos != -1) ? s.substring(0, pos) : s;
    print(result);
    // update();
  }
}
