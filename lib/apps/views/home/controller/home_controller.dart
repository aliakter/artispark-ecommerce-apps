import 'dart:convert';

import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:artispark/apps/views/story/model/story_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  final LoginController loginController;
  final MainController mainController;

  HomeController(
      this.homeRepository, this.loginController, this.mainController);

  final scrollController2 = ScrollController();
  final searchController = TextEditingController();

  void toTop() {
    scrollController2.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  CarouselController carouselController = CarouselController();
  RxBool isLoading = false.obs;
  RxBool isCollaborateLoading = false.obs;

  RxBool isNextTap = false.obs;
  RxBool isPreviousTap = false.obs;

  void onTapNextDown(TapDownDetails details) {
    isNextTap.value = true;
  }

  void onTapNextUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      isNextTap.value = false;
    });
  }

  void onTapPreviousDown(TapDownDetails details) {
    isPreviousTap.value = true;
  }

  void onTapPreviousUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      isPreviousTap.value = false;
    });
  }

  @override
  void onInit() {
    getCityData();
    getHomeData();
    getAllStoryData();
    getAllCollaborateData();
    // TODO: implement onInit
    super.onInit();
  }

  RxBool isStoryLoading = false.obs;
  RxBool isStoryDetailsLoading = false.obs;

  HomeModel? homeModel;
  Rx<List<Categories>> categoryList = Rx<List<Categories>>([]);
  RxList<Subcategories> subCategoryList = <Subcategories>[].obs;
  List<Brand> brandList = [];
  List<CityModel> cities = [];

  Future<void> getCityData() async {
    final result = await homeRepository.getCityData();
    result.fold((error) {}, (data) async {
      cities = data;
    });
  }

  Future<void> getHomeData() async {
    isLoading.value = true;
    final result =
        await homeRepository.getHomeData(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      homeModel = data;
      categoryList.value = data.categories;
      // for(var i = 0; i<data.categories.length; i++) {
      //   subCategoryList.addAll(data.categories[i].subcategories);
      // }
      subCategoryList.value = data.categories
          .singleWhere((element) => element.subcategories.isNotEmpty)
          .subcategories;
      brandList = data.brands;
      isLoading.value = false;
    });
  }

  RxList<StoryModel> storyList = <StoryModel>[].obs;

  Future<void> getAllStoryData() async {
    print("Stori api call");
    isStoryLoading.value = true;
    final result =
        await homeRepository.getAllStory(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isStoryLoading.value = false;
      print(error.message);
    }, (data) async {
      storyList.value = data;
      isStoryLoading.value = false;
    });
  }

  Future<void> getAllCollaborateData() async {
    print("Stori api call");
    // isCollaborateLoading.value = true;
    final result = await homeRepository
        .getCollaborateData(loginController.userInfo?.token ?? "");
    result.fold((error) {
      // isCollaborateLoading.value = false;
      print(error.message);
    }, (data) async {
      // storyList.value = data;
      // storyList.insert(0, StoryModel());
      // isCollaborateLoading.value = false;
    });
  }

  StoryModel? storyDetails;

  Future<void> getStoryDetails(String id) async {
    print("Stori details api call");
    isStoryDetailsLoading.value = true;
    final result = await homeRepository.getStoryDetails(
        loginController.userInfo?.token ?? "", id);
    result.fold((error) {
      isStoryDetailsLoading.value = false;
      print(error.message);
    }, (data) async {
      storyDetails = data;
      isStoryDetailsLoading.value = false;
    });
  }

  List compareList = [].obs;

  addToCompareList(int id) async {
    //add ad id to list
    compareList.add(id);
    // Convert the list to a JSON string
    final jsonString = json.encode(compareList);

    // Save the JSON string to SharedPreferences
    await sharedPreferences.setString('compareList', jsonString);

    // Get.snackbar("SUCCESS", "Add to compare list");
  }

  bool checkIfCompareList(int id) {
    final jsonString = sharedPreferences.getString('compareList');
    if (jsonString != null) {
      List<dynamic> storedList = json.decode(jsonString);
      final items = List<int>.from(storedList);
      if (items.contains(id)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  removedFromCompareList(int id) async {
    compareList.remove(id);
    // Convert the list to a JSON string
    final jsonString = json.encode(compareList);

    // Save the JSON string to SharedPreferences
    await sharedPreferences.setString('compareList', jsonString);
  }

  ///wishlist
  setUnsetWishlist(String id) async {
    final result = await homeRepository.setUnsetWishlist(
        loginController.userInfo?.token ?? "", id);
    result.fold((error) {
      if (error.message.toString().toLowerCase() == 'unauthenticated') {
        Get.snackbar("Not LoggedIn", 'Please Login First');
      } else {
        Get.snackbar("ERROR", error.message);
      }
      print(error.message);
    }, (data) async {
      Get.snackbar("SUCCESS", data);
      getHomeData();
    });
  }
}
