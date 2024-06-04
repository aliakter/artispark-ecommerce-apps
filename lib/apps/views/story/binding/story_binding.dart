import 'package:artispark/apps/views/story/controller/story_controller.dart';
import 'package:artispark/apps/views/story/repository/story_repository.dart';
import 'package:get/get.dart';

class StoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StoryRepository>(() => StoryRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => StoryController(Get.find(), Get.find()));
    // TODO: implement dependencies
  }


}
