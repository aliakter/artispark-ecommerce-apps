import 'dart:convert';
import 'dart:developer';

import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/challenge_product/models/challenge_product_model.dart';
import 'package:artispark/apps/views/challenge_product/repository/challenge_product_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/remote_urls.dart';

class ChallengeProductController extends GetxController {
  RxBool isLoading = false.obs;
  final ChallengeProductRepository repository;
  final LoginController loginController;
  RxBool isStatusAccept = false.obs;
  RxBool isStatusDeny = false.obs;

  ChallengeProductController(this.repository, this.loginController);

  @override
  void onInit() {
    getChallengeData();
    super.onInit();
  }

  ChallengeProductModel? challengeProductModel;

  getChallengeData() async {
    isLoading.value = true;

    final result = await repository
        .getChallengeProduct(loginController.userInfo?.token ?? "");

    result.fold((error) {
      isLoading.value = false;
    }, (data) {
      challengeProductModel = data;
      isLoading.value = false;
    });
  }

  changeStatus({adId, status}) async {
    final data = {
      'ad_id': adId.toString(),
      'status': status.toString(),
    };

    if (status == 1) {
      isStatusAccept.value = true;
      final result = await repository.changeStatus(
          loginController.userInfo?.token ?? "", data);

      result.fold((error) {
        isStatusAccept.value = false;
      }, (data) {
        isStatusAccept.value = false;
        Get.snackbar("SUCCESS", 'Challenge product successfully accepted');
      });
    } else {
      isStatusDeny.value = true;
      final result = await repository.changeStatus(
          loginController.userInfo?.token ?? "", data);

      result.fold((error) {
        isStatusDeny.value = false;
      }, (data) {
        isStatusDeny.value = false;
        Get.snackbar("SUCCESS", 'Challenge product successfully denied');
      });
    }
  }

  RxBool isUploading = false.obs;

  Future<void> uploadChallenge(id, imagePath) async {
    isUploading(true);
    final token = loginController.userInfo?.token ?? "";
    final uri = Uri.parse('${RemoteUrls.baseUrl}challenge/$id/upload');
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll({'Authorization': 'Bearer $token'});

    request.files
        .add(await http.MultipartFile.fromPath("upload_product", imagePath));
    final response = await request.send();

    var responsed = await http.Response.fromStream(response);

    final responsedData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      if (responsedData['success']) {
        Get.snackbar("SUCCESS", responsedData['message']);
      }
      isUploading(false);
    } else {
      isUploading(false);
    }
  }
}
