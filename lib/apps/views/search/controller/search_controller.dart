import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:get/get.dart';

class SearchsController extends GetxController{
  final HomeRepository homeRepository;
  final LoginController loginController;

  SearchsController(this.homeRepository, this.loginController);

  RxBool isLoading = false.obs;
  Rxn<HomeModel> homeModel = Rxn<HomeModel>();
  Rx<List<Categories>> categoryList = Rx<List<Categories>>([]);

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  Future<void> getHomeData() async {
    isLoading.value = true;
    final result =
    await homeRepository.getHomeData(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      homeModel.value = data;
      categoryList.value = data.categories;
      isLoading.value = false;
    });
  }

}
