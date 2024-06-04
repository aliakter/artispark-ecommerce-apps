import 'package:artispark/apps/views/auth/repository/auth_repository.dart';
import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:artispark/apps/views/auth/login/model/login_model.dart';
import 'package:artispark/apps/routes/routes.dart';

class SignUpController extends GetxController {
  final AuthRepository authRepository;
  final MainController mainController;

  SignUpController(this.authRepository, this.mainController);

  final TextEditingController nameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  final TextEditingController confirmPasswordCtl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String? deviceId = '';
  RxBool isVisiblePassword = true.obs;
  RxBool isConfirmVisiblePassword = true.obs;
  RxInt userType = 0.obs;
  final RxBool isLoading = false.obs;

  UserLoginResponseModel? _user;
  bool get isLoggedIn => _user != null && _user!.token.isNotEmpty;
  UserLoginResponseModel? get userInfo => _user;
  set user(UserLoginResponseModel userData) => _user = userData;
  void cacheUserData() => authRepository.saveCashedUserInfo(_user!);
  void cacheUserWithData(UserLoginResponseModel userData) =>
      authRepository.saveCashedUserInfo(userData);


  changeUserType(val){
    userType.value = val;
  }

  Future<void> userRegistration() async {
    deviceId = await FirebaseMessaging.instance.getToken();

    if (formKey.currentState!.validate()) {

      // Validate email format
      if (!emailCtl.text.trim().contains('@') || !emailCtl.text.trim().endsWith('.com')) {
        Get.snackbar("Warning", "Invalid email format");
        return;
      }

      final body = <String, String>{};
      body.addAll({"name": nameCtl.text.trim()});
      body.addAll({"username": userNameCtrl.text.trim()});
      body.addAll({"email": emailCtl.text.trim()});
      body.addAll({"password": passwordCtl.text.trim()});
      body.addAll({"password_confirmation": confirmPasswordCtl.text.trim()});
      body.addAll({"user_mode": userType.value.toString()});
      body.addAll({"device_id": deviceId.toString()});

      isLoading.value = true;
      final result = await authRepository.userRegister(body);

      result.fold((error) {
        Get.snackbar("Warning", error.message);
        isLoading.value = false;
      }, (data) async {
        nameCtl.text = "";
        userNameCtrl.text = "";
        emailCtl.text = "";
        passwordCtl.text = "";
        userType.value = 0;
        isLoading.value = false;
        _user = data;
        cacheUserWithData(data);
        Get.offAndToNamed(Routes.login);
      });
    }
  }
}
