import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/ads_edit/controller/ad_edit_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:get/get.dart';

class AdEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut<AdRepository>(
        () => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(
        () => AdEditController(Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
