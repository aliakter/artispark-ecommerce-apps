import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/my_ads/model/user_ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/my_ads_repository.dart';

class MyAdsController extends GetxController {
  final LoginController loginController;
  final MyAdsRepository myAdsRepository;
  MyAdsController(this.loginController, this.myAdsRepository);

  RxBool isLoading = false.obs;
  RxBool isDeleteLoading = false.obs;

  @override
  void onInit() {
    getAdsData();
    super.onInit();
  }

  UserAdModel? userAdModel;

  getAdsData() async {
    isLoading.value = true;
    final result =
        await myAdsRepository.getUserAdsData(loginController.userInfo!.token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      userAdModel = data;
      isLoading.value = false;
    });
  }

  deleteAds(String id) async {
    isDeleteLoading.value = true;
    final result =
        await myAdsRepository.deleteAds(loginController.userInfo!.token, id);
    result.fold((error) {
      isDeleteLoading.value = false;
      print(error.message);
    }, (data) async {
      // userAdModel = data;
      Get.snackbar("Success", data);
      isDeleteLoading.value = false;
      Navigator.pop(Get.context!);
      getAdsData();
    });
  }
}
