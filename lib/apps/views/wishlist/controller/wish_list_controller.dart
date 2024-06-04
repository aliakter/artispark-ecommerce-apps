import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/wishlist/model/wish_list_model.dart';
import 'package:get/get.dart';

import '../reposotory/wishlist_repository.dart';

class WishlistController extends GetxController {
  final LoginController loginController;
  final WishlistRepository wishlistRepository;

  WishlistController(this.loginController, this.wishlistRepository);

  @override
  void onInit() {
    getWishlistData();
    super.onInit();
  }

  WishlistModel? wishlistModel;
  RxBool isLoading = false.obs;

  getWishlistData() async {
    isLoading.value = true;
    final result = await wishlistRepository
        .getWishlistData(loginController.userInfo!.token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      wishlistModel = data;
      isLoading.value = false;
    });
  }

  unselectWishlist(String id) async {
    final result = await wishlistRepository.unsetWishlist(
        loginController.userInfo!.token, id);
    result.fold((error) {
      Get.snackbar("ERROR", error.message);
      print(error.message);
    }, (data) async {
      Get.snackbar("SUCCESS", data);
      getWishlistData();
    });
  }
}
