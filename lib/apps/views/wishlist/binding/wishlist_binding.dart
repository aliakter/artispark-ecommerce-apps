import 'package:artispark/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:artispark/apps/views/wishlist/reposotory/wishlist_repository.dart';
import 'package:get/get.dart';

class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistRepository>(() => WishlistRepositoryImpl(Get.find()));
    Get.lazyPut<WishlistController>(
        () => WishlistController(Get.find(), Get.find()));
  }
}
