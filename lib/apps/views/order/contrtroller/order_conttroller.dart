import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:artispark/apps/views/order/model/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final HomeRepository homeRepository;
  final LoginController loginController;

  OrderController(this.homeRepository, this.loginController);

  Rx<List<OrderModel>> orders = Rx<List<OrderModel>>([]);

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllOrderData();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllOrderData() async {
    isLoading.value = true;
    final result =
        await homeRepository.getAllOrder(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      orders.value = data;
      print(orders.value.length);
      isLoading.value = false;
    });
  }
}
