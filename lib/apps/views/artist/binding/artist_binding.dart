import 'package:artispark/apps/views/artist/controller/artist_controller.dart';
import 'package:get/get.dart';

class ArtistBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArtistController(Get.find(),Get.find(),));
    // TODO: implement dependencies
  }

}
