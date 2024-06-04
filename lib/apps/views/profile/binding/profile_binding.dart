import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:artispark/apps/views/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LanguageRepository>(() => LanguageRepositoryImp(remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()));
    // TODO: implement dependencies
    Get.lazyPut(() => MainController());
  }
}
