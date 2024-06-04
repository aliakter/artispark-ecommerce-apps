import 'dart:convert';
import 'package:artispark/apps/views/compare/model/compare_list_model.dart';
import 'package:artispark/apps/views/compare/repository/compare_repository.dart';
import 'package:artispark/main.dart';
import 'package:get/get.dart';
import '../../main/controller/main_controller.dart';

class CompareController extends GetxController {
  CompareRepository compareRepository;
  MainController mainController;

  CompareController(this.compareRepository, this.mainController);

  RxBool isLoading = false.obs;
  List adsList = [];

  @override
  void onInit() {
    getCompareListData();
    super.onInit();
  }

  CompareListModel? compareListModel;

  void getCompareListData() async {
    isLoading.value = true;
    final jsonString = sharedPreferences.getString('compareList');

    // log("compare list----------------->>> $jsonString");

    final result =
        await compareRepository.getCompareList({"ads": jsonString ?? ""});
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) {
      compareListModel = data;
      isLoading.value = false;
    });
  }

  deleteAds(int id) async {
    final jsonString = sharedPreferences.getString('compareList');
    if (jsonString != null) {
      List<dynamic> storedList = json.decode(jsonString);
      final items = List<int>.from(storedList);
      items.remove(id);
      // Convert the list to a JSON string
      final jsonString1 = json.encode(items);

      // Save the JSON string to SharedPreferences
      await sharedPreferences.setString('compareList', jsonString1);
      Get.snackbar("SUCCESS", "Ad removed from compare list");
      getCompareListData();
    }
  }
}
