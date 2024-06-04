import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find(), Get.find()));
  }
}
