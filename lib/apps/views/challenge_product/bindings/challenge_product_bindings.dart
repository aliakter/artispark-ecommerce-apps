import 'package:artispark/apps/views/challenge_product/controllers/challenge_product_controller.dart';
import 'package:get/get.dart';

import '../repository/challenge_product_repository.dart';

class ChallengeProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChallengeProductRepository>(
        () => ChallengeProductRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => ChallengeProductController(Get.find(), Get.find()));
  }
}
