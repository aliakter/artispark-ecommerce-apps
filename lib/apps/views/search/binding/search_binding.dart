import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => SearchsController(Get.find(), Get.find()));
  }
}
