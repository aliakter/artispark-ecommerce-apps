import 'package:artispark/apps/views/ad_details/controllers/ad_details_controller.dart';
import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:get/get.dart';

class AdDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdRepository>(
        () => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => AdDetailsController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    // TODO: implement dependencies
  }
}
