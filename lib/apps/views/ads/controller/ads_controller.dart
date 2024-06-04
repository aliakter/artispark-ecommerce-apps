import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/ads/model/adlist_response_model.dart';
import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/category_model.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/models/home_model.dart';

class AdsController extends GetxController {
  final LoginController loginController;
  final AdRepository adsRepository;
  final HomeRepository homeRepository;
  final HomeController homeController;

  AdsController(this.loginController, this.adsRepository, this.homeController,
      this.homeRepository);

  // TextEditingController searchController = TextEditingController();

  // var selectedCategory;
  Categories? category;
  Rx<String> categoryValue = "".obs;
  CityModel? city;
  RxString selectedCityId = "".obs;

  Rx<List<Categories>> categoryList = Rx<List<Categories>>([]);

  final scrollController = ScrollController();

  final MainController mainController = MainController();

  // RxString selectedCity = "".obs;
  RxString selectedSortingValue = "".obs;
  var stateList = ["Dhaka", "Mymensingh"];

  RxString searchValue = "".obs;

  changeCity(CityModel value) {
    selectedCityId.value = value.id.toString();
  }

  Rx<List<CityModel>> cities = Rx<List<CityModel>>([]);

  Future<void> getCityData() async {
    final result = await homeRepository.getCityData();
    result.fold((error) {}, (data) async {
      cities.value = data;
    });
  }

  @override
  void onInit() {
    categoryValue.value = Get.arguments[0];
    searchValue.value = Get.arguments[1];
    categoryList.value = Get.arguments[2];
    print(categoryValue.value);
    for (var cat in categoryList.value) {
      if (cat.slug.toLowerCase().compareTo(categoryValue.value) == 0) {
        category = cat;
        break;
      }
    }
    getAdsListData();
    scrollController.addListener(_init);
    // TODO: implement onInit
    super.onInit();
  }

  void _init() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreFiles();
      print("Loade More++++");
    }
  }

  @override
  void onClose() {
    super.onClose();
    // searchAdsBloc.adList.clear();
  }

  RxBool isLoading = false.obs;

  // AdListResponseModel? adListResponseModel;
  List<Ad> adsList = [];

  Future<void> getAdsListData() async {
    isLoading.value = true;
    page.value = 1;
    print(selectedCityId.value);
    getCityData();
    final result = await adsRepository.getAdsListData(
        loginController.userInfo?.token ?? "",
        homeController.searchController.text ?? "",
        selectedCityId.value,
        categoryValue.value,
        page.value.toString() ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      adsList = data.adsList;
      isLoading.value = false;
    });
  }

  RxBool isPaging = true.obs;
  RxBool gettingMoreData = false.obs;
  RxInt page = 1.obs;

  loadMoreFiles() {
    if (isPaging.value) {
      page.value++;
      getAllBooksDataPage();
    }
  }

  void getAllBooksDataPage() async {
    gettingMoreData(true);

    final result = await adsRepository.getAdsListData(
      loginController.userInfo?.token ?? "",
      homeController.searchController.text,
      selectedCityId.value,
      categoryValue.value,
      page.value.toString(),
    );
    result.fold((error) {
      gettingMoreData(false);
      print(error.message);
    }, (data) async {
      adsList.addAll(data.adsList);
      // data.adsList.isNotEmpty ? adsList.addAll(data.adsList) : page.value = 1;
      gettingMoreData(false);
    });
  }

  changePage() {
    page.value = 1;
    getAdsListData();
  }
}
