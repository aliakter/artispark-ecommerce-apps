import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:artispark/apps/views/public_profile/repository/public_profile_repository.dart';
import 'package:get/get.dart';

class PublicProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicProfileRepository>(
        () => PublicProfileRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(
        () => PublicProfileController(Get.find(), Get.find(), Get.find()));
  }
}
