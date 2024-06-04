import 'package:artispark/apps/views/compare/controller/compare_controller.dart';
import 'package:artispark/apps/views/favourite/controller/favourite_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/profile/controllers/profile_controller.dart';
import 'package:artispark/apps/views/search/controller/search_controller.dart';
import 'package:get/get.dart';
import '../../compare/repository/compare_repository.dart';
import '../controller/main_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => MainController());
    Get.lazyPut<CompareRepository>(() => CompareRepositoryImpl(Get.find()));
    Get.lazyPut(() => CompareController(Get.find(), Get.find()));
    Get.lazyPut(() => SearchsController(Get.find(), Get.find()));
    Get.lazyPut(() => FavouriteController(Get.find(), Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()));
  }
}
