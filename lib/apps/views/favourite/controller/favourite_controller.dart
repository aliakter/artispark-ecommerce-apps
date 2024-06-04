import 'dart:convert';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/compare/repository/compare_repository.dart';
import 'package:artispark/apps/views/favourite/model/favourite_model.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController{
  LoginController loginController;
  HomeRepository homeRepository;
  CompareRepository compareRepository;
  MainController mainController;

  FavouriteController(this.loginController, this.homeRepository, this.compareRepository, this.mainController);

  RxBool isLoading = false.obs;
  FavouriteModel? favouriteModel;
  String token = '';

  @override
  void onInit() {
    super.onInit();
    token = loginController.userInfo?.token ?? "";
    getFavouriteListData();
  }

  void getFavouriteListData() async {
    isLoading.value = true;
    final result = await compareRepository.getFavouriteList(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) {
      favouriteModel = data;
      isLoading.value = false;
    });
  }

  ///wishlist
  setUnsetWishlist(int id) async {
    final result = await homeRepository.setUnsetWishlist(
        loginController.userInfo?.token ?? "", id.toString());
    result.fold((error) {
      Get.snackbar("ERROR", error.message);
      print(error.message);
    }, (data) async {
      Get.snackbar("SUCCESS", data);
      getFavouriteListData();
    });
  }
}
