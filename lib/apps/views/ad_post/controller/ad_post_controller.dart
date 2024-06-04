import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/ad_post/component/category_chooser.dart';
import 'package:artispark/apps/views/ad_post/component/new_basic_info.dart';
import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AdPostController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final LoginController loginController;
  final HomeController homeController;
  final AdRepository adsRepository;

  AdPostController(
      this.homeController, this.loginController, this.adsRepository);

  late List<Widget> pageList;
  final naveListener = StreamController<int>.broadcast();
  late AnimationController animationController;
  late Animation<double> animOffset;
  RxList<Categories> categoryList = <Categories>[].obs;
  RxList<Brand> brandList = <Brand>[].obs;
  Brand? brandModel;
  RxInt cityId = 0.obs;
  CityModel? city;

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final whatsappController = TextEditingController();
  final webSiteController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isPostAdsLoading = false.obs;
  RxBool isShowPhone = false.obs;
  RxBool isShowEmail = false.obs;
  RxBool isShowWhatsapp = false.obs;
  String selectedCategory = '';
  String selectedCondition = "";
  String selectedCityId = '';

  changeCondition(value) {
    selectedCondition = value.toString();
    update();
  }

  changeCity(CityModel value) {
    selectedCityId = value.id.toString();
    print(selectedCityId);
  }

  ///Job
  String selectedDesignation = '';
  String selectedJobType = '';
  String selectedEducation = '';
  RxBool receiveIsEmail = false.obs;
  RxBool receiveIsPhone = false.obs;
  final employerEmailController = TextEditingController();
  final employerPhoneController = TextEditingController();
  final experienceController = TextEditingController();
  final salaryFromController = TextEditingController();
  final salaryToController = TextEditingController();
  final expiryDateController = TextEditingController();
  final employerNameController = TextEditingController();

  //.............Expire Date Choose ...............
  final formatter = DateFormat('yyyy-MM-dd');
  var expiryDate;
  DateTime expirySelectedDate = DateTime.now();

  chooseDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: expirySelectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2050),
        initialDatePickerMode: DatePickerMode.year,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.white,
                onPrimary: Color(0xFF31A3DD),
                surface: Colors.white,
                onSurface: Color(0xFF000000),
              ),
              dialogBackgroundColor: const Color(0xFF31A3DD),
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      expirySelectedDate = newSelectedDate;
      expiryDateController
        ..text = formatter.format(expirySelectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: expiryDateController.text.length,
            affinity: TextAffinity.upstream));
      expiryDate = expiryDateController.text;
    }
  }

  // ....................Logo Photo Picker ...................
  final ImagePicker logoPicker = ImagePicker();
  XFile? logoImage;
  String? base64ImageLogo;

  Future<String?> pickLogoImage() async {
    String? imagePath;
    XFile? tempImage = await logoPicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (tempImage == null) {
      print("Image doesn't choose!");
      return imagePath;
    } else {
      logoImage = tempImage;
      List<int> imageBytes = await logoImage!.readAsBytes();
      base64ImageLogo =
          'data:image/${logoImage!.path.split('.').last};base64,${base64Encode(imageBytes)}';
      // setState(() {});

      // return imagePaths;
      return base64ImageLogo;
    }
  }

  ///Fashion
  String selectedSize = '';

  ///Electronic
  String selectedBrand = "";

  ///Mobile
  String selectedAuthenticity = "";
  final editionController = TextEditingController();
  String selectedRam = "";

  ///Vehicles
  String selectedTransmission = "";
  final trimEditionController = TextEditingController();
  final manufactureYearController = TextEditingController();
  final engineCapacityController = TextEditingController();
  final registrationYearController = TextEditingController();
  String selectedBodyType = "";
  List<String> fuelTypes = [];

  ///Property
  String selectedPropertyType = "";
  final sizeController = TextEditingController();
  final bedroomController = TextEditingController();
  final propertyLocationController = TextEditingController();
  final propertyPriceController = TextEditingController();
  String selectedPropertySize = "";
  String selectedPropertyPrice = "";

  RxBool isPayment = false.obs;
  RxBool isFeature = false.obs;
  RxBool isPaymentChecked = false.obs;
  RxBool isCollaborate = false.obs;

  final featureFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getHomeData();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: animationController);
    animOffset = Tween<double>(begin: 0.5, end: 1).animate(curve);
    animationController.forward();
    pageList = [
      NewAdPostCategoryChooser(() {
        naveListener.sink.add(1);
        animationController.forward(from: 0.0);
      }, categoryList),
      const NewBasicInfoView(),
      // ContactInfoView(),
      // FeatureImageView()
    ];
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getHomeData() async {
    isLoading.value = true;
    final result = await homeController.homeRepository
        .getHomeData(loginController.userInfo!.token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      categoryList.value = data.categories;
      brandList.value = data.brands;
      brandModel = brandList[0];
      selectedBrand = brandList[0].id.toString();
      isLoading.value = false;
    });
  }

  //.............. contacts info ....................
  RxList<String> featureList = [""].obs;
  var contactController = TextEditingController();

  void addContact() {
    featureList.add("");
    update();
  }

  void removeContact(index) {
    featureList.removeAt(index);
    update();
  }

  String getPosition(index) {
    switch (index) {
      case 1:
        return "Enter 1st Feature";
      case 2:
        return "Enter 2nd Feature";
      case 3:
        return "Enter 3rd Feature";
      default:
        return "Enter ${index}th Feature";
    }
  }

  /// ....................Feature Photo Picker ...................
  String? originalImage;
  String? featureImage;
  String base64featureImage = '';
  List<String> base64featureImages = [];

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

          print("feature image is: ${base64featureImage}");
          // context.read<AdEditProfileCubit>().base64Image = base64Image!;
        }
      }
    });
    update();
    base64Images.add(base64featureImage);
    return base64featureImage;
  }

  /// ....................Gallery Photo Picker ...................
  final ImagePicker picker = ImagePicker();
  List<XFile> images = [];
  List<String> base64Images = [];

  Future<List<String>?> pickImages() async {
    List<String> imagePaths = [];
    List<XFile>? tempImages = await picker.pickMultiImage();
    if (tempImages.length <= 5) {
      if (tempImages == null) {
        print("Image doesn't choose!");
        return imagePaths;
      } else {
        images = tempImages;
        base64Images = [];

        for (XFile file in images) {
          List<int> imageBytes = await file.readAsBytes();
          base64Images.add(
              'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}');
          imagePaths.add(file.path);
        }
      }

      // images2 = await (ImagePicker.platform.pickMultiImage(imageQuality: 100));
      update();

      // return imagePaths;
      return base64Images;
    } else {
      Get.snackbar('Not more than 5', 'You\'ve Selected more than 5 Images');
    }
  }

  /// Get SubCategory with Category
  RxList<Subcategories> subcategoryList = <Subcategories>[].obs;
  Subcategories? subcategory;
  String selectedSubcategory = '';

  getSubcategory(int value) {
    // Category category = categoryList.singleWhere((element) => element.id == value);
    subcategoryList.value = categoryList
        .singleWhere((element) => element.id == value)
        .subcategories
        .toSet()
        .toList();
    if (subcategoryList.isNotEmpty) {
      subcategory = subcategoryList[0];
      selectedSubcategory = subcategoryList[0].id.toString();
      print('has data');
    } else {
      print('has no data');
    }
    update();
  }

  /// Get SubCategory with Category
  RxList<Brand> modelList = <Brand>[].obs;
  Brand? model;
  String selectedModel = '';

  getModel() {
    modelList.value = brandList
        .singleWhere((element) => element.id == int.parse(selectedBrand))
        .models
        .toSet()
        .toList();
    if (modelList.isNotEmpty) {
      model = modelList[0];
      selectedModel = modelList[0].id.toString();
      print('has data');
    } else {
      print('has no data');
    }
  }

  Future<void> postAds() async {
    if (base64featureImage.isNotEmpty) {
      base64featureImages.add(base64featureImage);
      for (String image in base64Images) {
        base64featureImages.add(image);
      }

      final body = <String, dynamic>{};
      body.addAll({"title": titleController.text.trim()});
      body.addAll({"category_id": selectedCategory});
      body.addAll({"subcategory_id": selectedSubcategory});
      body.addAll({"address": locationController.text.trim()});
      body.addAll({"price": priceController.text.trim()});
      // body.addAll({"phone": phoneController.text.trim()});
      // body.addAll({"show_phone": "0"});
      // body.addAll({"whatsapp": whatsappController.text.trim()});
      body.addAll({"featured": isPaymentChecked.value ? '1' : '0'});
      body.addAll({"description": descriptionController.text.trim()});
      body.addAll({"is_colloborate": isCollaborate.value ? '1' : '0'});
      body.addAll({"city_id": selectedCityId});
      body.addAll({"images": base64featureImages.toString()});

      isPostAdsLoading.value = true;
      final result =
          await adsRepository.postAds(loginController.userInfo!.token, body);

      result.fold((error) {
        isPostAdsLoading.value = false;
        print(error.message);
        Get.snackbar('Warning', error.message,
            backgroundColor: Colors.red.shade300, colorText: Colors.black);
      }, (data) async {
        isPostAdsLoading.value = false;
        clearAll();
        Navigator.pop(Get.context!);
        Get.snackbar('Success', data, colorText: Colors.black);
      });
    } else {
      Get.snackbar('Provide Featured Image', 'Please Provide featured image');
    }
  }

  clearAll() {
    titleController.text = "";
    locationController.text = "";
    priceController.text = "";
    phoneController.text = "";
    whatsappController.text = "";
    descriptionController.text = "";
  }
}
