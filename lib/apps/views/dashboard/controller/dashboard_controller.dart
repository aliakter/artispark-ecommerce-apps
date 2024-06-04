import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/dashboard/model/dashboard_model.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../repository/dashboard_repository.dart';

class DashboardController extends GetxController {
  final LoginController loginController;
  final DashboardRepository dashboardRepository;
  final HomeController homeController;

  DashboardController(
      this.loginController, this.dashboardRepository, this.homeController);

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }

  DashboardModel? dashboardModel;

  getDashboardData() async {
    isLoading.value = true;
    final result = await dashboardRepository
        .getDashboardData(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      dashboardModel = data;
      isLoading.value = false;
    });
  }
}
