import 'package:artispark/apps/views/ad_details/model/ad_details_model.dart';
import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdDetailsController extends GetxController {
  final LoginController loginController;
  final AdRepository adsRepository;
  final HomeController homeController;

  AdDetailsController(
      this.loginController, this.adsRepository, this.homeController);

  TextEditingController reviewController = TextEditingController();
  RxDouble ratingVal = 0.0.obs;
  String token = '';
  var slug;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    slug = Get.arguments;
    print('######################');
    print(slug);
    token = loginController.userInfo?.token ?? "";
    getAdDetails();
  }

  RxBool isLoading = false.obs;
  AdDetailsModel? adDetailsModel;

  Future<void> getAdDetails() async {
    isLoading.value = true;
    final result = await adsRepository.getAdDetails(
        loginController.userInfo?.token ?? "", slug);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      adDetailsModel = data;
      isLoading.value = false;
    });
  }

  isMe(int id) {
    if (loginController.userInfo?.user.id == id) {
      return true;
    }
    return false;
  }

  ratingChange(val) {
    ratingVal.value = val;
    update();
  }

  RxBool isSendingReview = false.obs;

  Future<void> sendReview(BuildContext context, int productId) async {
    isSendingReview(true);
    if (token.isNotEmpty) {
      if (ratingVal.value != 0.0 && reviewController.text.isNotEmpty) {
        Map<String, dynamic> body = {
          'product_id': productId.toString(),
          'stars': ratingVal.value.toString(),
          'comment': reviewController.text
        };

        final result = await adsRepository.sendReview(
            loginController.userInfo!.token, body);
        result.fold((error) {
          print(error.message);
          Get.snackbar('Warning', error.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white);
          Navigator.pop(context);
          isSendingReview(false);
        }, (data) async {
          getAdDetails();
          Get.snackbar('Successful', data,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white);
          ratingChange(0.0);
          reviewController.clear();
          Navigator.pop(context);
          isSendingReview(false);
        });
      } else if (ratingVal.value == 0.0) {
        Get.snackbar('Provide Ratings', 'Please provide your ratings',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
        isSendingReview(false);
      } else {
        Get.snackbar('Provide Comment', 'Please provide your commentsL',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
        isSendingReview(false);
      }
    } else {
      Get.snackbar('Please Login', 'Please login first to provide feedback',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      isSendingReview(false);
    }
  }
}
