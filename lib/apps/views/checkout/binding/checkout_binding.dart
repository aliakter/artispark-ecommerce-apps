import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/checkout/controller/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdRepository>(() => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => CheckoutController(Get.find(),Get.find(), Get.find()));
  }
}
