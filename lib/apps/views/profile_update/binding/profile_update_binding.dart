import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:artispark/apps/views/profile_update/repository/profile_update_repository.dart';
import 'package:artispark/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:artispark/apps/views/public_profile/repository/public_profile_repository.dart';
import 'package:get/get.dart';

class ProfileUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateRepository>(
        () => ProfileUpdateRepositoryImpl(remoteDataSource: Get.find()));

    Get.lazyPut<PublicProfileRepository>(
            () => PublicProfileRepositoryImpl(remoteDataSource: Get.find()));

    Get.lazyPut(() => ProfileUpdateController(
        loginController: Get.find(), profileUpdateRepository: Get.find(), publicProfileController: Get.find(), publicProfileRepository: Get.find()));

    Get.lazyPut(() => HomeController(Get.find(),Get.find(),Get.find(),));
    Get.lazyPut(() => PublicProfileController(Get.find(), Get.find(), Get.find()));
  }
}
