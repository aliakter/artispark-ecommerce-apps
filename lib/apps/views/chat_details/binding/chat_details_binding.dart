import 'package:artispark/apps/views/chat_details/controller/chat_details_controller.dart';
import 'package:artispark/apps/views/chat_details/repository/chat_details_repository.dart';
import 'package:get/get.dart';

class ChatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailsRepository>(
        () => ChatDetailsRepositoryImpl(Get.find()));
    Get.lazyPut(() => ChatDetailsController(Get.find(), Get.find()));
  }
}
