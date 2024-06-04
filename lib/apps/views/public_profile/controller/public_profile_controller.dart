import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/public_profile/model/public_profile_model.dart';
import 'package:artispark/apps/views/public_profile/repository/public_profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicProfileController extends GetxController {
  final LoginController loginController;
  final HomeController homeController;
  final PublicProfileRepository publicProfileRepository;

  PublicProfileController(
      this.loginController, this.publicProfileRepository, this.homeController);

  RxBool shopSelect = true.obs;
  RxBool sellerReviewSelect = false.obs;
  RxBool writeReviewSelect = false.obs;
  final reviewController = TextEditingController();
  String? selectedValue;
  var ratings = 0.0.obs;
  String userName = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userName = Get.arguments;
    print(userName);
    print("333333333333333");
    getPublicProfile();
  }

  isLogin() {
    final token = loginController.userInfo?.token ?? "";

    return token.isEmpty ? false : true;
  }

  changeBtnOne() {
    shopSelect.value = true;
    sellerReviewSelect.value = false;
    writeReviewSelect.value = false;
  }

  changeBtnTwo() {
    shopSelect.value = false;
    sellerReviewSelect.value = true;
    writeReviewSelect.value = false;
  }

  changeBtnThree() {
    shopSelect.value = false;
    sellerReviewSelect.value = false;
    writeReviewSelect.value = true;
  }

  ratingChange(rating) {
    ratings.value = rating;
    update();
  }

  RxBool isLoading = false.obs;
  PublicProfileModel? publicProfileModel;

  Future<void> getPublicProfile() async {
    isLoading(true);
    final result = await publicProfileRepository.getPublicShop(
        loginController.userInfo?.token ?? "", userName);
    result.fold((error) {
      isLoading(false);
      print(error.message);
    }, (data) async {
      publicProfileModel = data;
      isLoading(false);
    });
  }

  Future<void> setRating() async {
    final body = {
      "stars": ratings.value.toString(),
      "comment": reviewController.text
    };
    final result = await publicProfileRepository.setRating(
      loginController.userInfo!.token,
      userName,
      body,
    );
    result.fold(
      (error) {
        print(error.message);
        Get.snackbar("ERROR", "Review Already Exist");
      },
      (data) async {
        Get.snackbar("SUCCESS", data);
        reviewController.clear();
        ratings.value = 0;
        getPublicProfile();
      },
    );
  }
}
