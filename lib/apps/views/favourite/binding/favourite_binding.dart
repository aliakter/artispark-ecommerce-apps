import 'package:artispark/apps/views/favourite/controller/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavouriteController(Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
