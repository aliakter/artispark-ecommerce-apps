import 'package:artispark/apps/views/auth/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  final AuthRepository authRepository;
  ForgotPasswordController(this.authRepository);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void>forgotPassWord()async{
    if (formKey.currentState!.validate()) {
      final body = <String, String>{};
      body.addAll({"email": emailController.text.trim()});

      isLoading.value = true;
      final result = await authRepository.forgotPassWord(body);

      result.fold((error) {
        isLoading.value = false;
        print(error.message);
      }, (data) async {
        emailController.text = "";
        isLoading.value = false;
        Get.back();
        Get.snackbar('Success', "$data", colorText: Colors.black);
      });
    }
  }

}