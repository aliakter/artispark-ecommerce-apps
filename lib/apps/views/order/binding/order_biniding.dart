
import 'package:artispark/apps/views/order/contrtroller/order_conttroller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController(Get.find(), Get.find()));
    // TODO: implement dependencies
  }

}
