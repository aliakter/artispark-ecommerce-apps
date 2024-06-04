import 'package:artispark/apps/views/ad_details/controllers/ad_details_controller.dart';
import 'package:artispark/apps/views/ad_details/model/ad_details_model.dart';
import 'package:artispark/apps/views/ads/repository/ads_repository.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final LoginController loginController;
  final AdRepository adRepository;
  final AdDetailsController adDetailsController;

  CheckoutController(
      this.loginController, this.adRepository, this.adDetailsController);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxBool isLoading = false.obs;
  AdDetailsModel? adDetailsModel;

  @override
  void onInit() {
    super.onInit();
    adDetailsModel = Get.arguments;
    nameController.text = loginController.userInfo?.user.name ?? "";
    emailController.text = loginController.userInfo?.user.email ?? "";
    phoneController.text = loginController.userInfo?.user.phone ?? "";
  }

  bool isNameNotEmpty() {
    if (nameController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isEmailNotEmpty() {
    if (emailController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isEmailValid() {
    if (emailController.text.trim().isEmail) {
      return true;
    } else {
      return false;
    }
  }

  bool isPhoneNotEmpty() {
    if (phoneController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isCityNotEmpty() {
    if (cityController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isZipNotEmpty() {
    if (zipController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isAddressNotEmpty() {
    if (addressController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> checkout() async {
    isLoading(true);
    if (isNameNotEmpty() &&
        isEmailNotEmpty() &&
        isEmailValid() &&
        isPhoneNotEmpty() &&
        isCityNotEmpty() &&
        isZipNotEmpty() &&
        isAddressNotEmpty()) {
      final body = <String, String>{};
      body.addAll({"name": nameController.text.trim()});
      body.addAll({"email": emailController.text.trim()});
      body.addAll({"phone": phoneController.text.trim()});
      body.addAll({"city": cityController.text.trim()});
      body.addAll({"zipcode": zipController.value.toString()});
      body.addAll({"address": addressController.value.toString()});
      final token = loginController.userInfo?.token;
      final id = adDetailsModel?.adDetails.id;
      final result =
          await adRepository.checkout(body, token ?? "", id.toString());

      result.fold((error) {
        print("------------------------->>> ${error.message}");
        Get.snackbar("Warning", error.message);
        isLoading(false);
      }, (data) async {
        nameController.text = "";
        emailController.text = "";
        phoneController.text = "";
        cityController.text = "";
        zipController.text = "";
        addressController.text = "";
        Get.snackbar("SUCCESS", data);
        Navigator.pop(Get.context!);
        isLoading(false);
      });
    } else if (!isNameNotEmpty()) {
      Get.snackbar('Name Empty', 'Name Can not be empty');
      isLoading(false);
    } else if (!isEmailNotEmpty()) {
      Get.snackbar('Email Empty', 'Email Can not be empty');
      isLoading(false);
    } else if (!isEmailValid()) {
      Get.snackbar('Email not valid', 'Please provide valid email');
      isLoading(false);
    } else if (!isPhoneNotEmpty()) {
      Get.snackbar('Phone Empty', 'Phone Can not be empty');
      isLoading(false);
    } else if (!isCityNotEmpty()) {
      Get.snackbar('City Empty', 'City Can not be empty');
      isLoading(false);
    } else if (!isZipNotEmpty()) {
      Get.snackbar('Zip Empty', 'Zip Can not be empty');
      isLoading(false);
    } else if (!isAddressNotEmpty()) {
      Get.snackbar('Address Empty', 'Address Can not be empty');
      isLoading(false);
    }
  }
}
