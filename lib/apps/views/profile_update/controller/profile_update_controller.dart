import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/profile_update/repository/profile_update_repository.dart';
import 'package:artispark/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:artispark/apps/views/public_profile/model/public_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import '../../../data/error/exception.dart';
import '../../../routes/routes.dart';
import '../../public_profile/repository/public_profile_repository.dart';

class ProfileUpdateController extends GetxController {
  LoginController loginController;
  ProfileUpdateRepository profileUpdateRepository;
  PublicProfileController publicProfileController;
  PublicProfileRepository publicProfileRepository;

  ProfileUpdateController(
      {required this.loginController,
      required this.profileUpdateRepository,
      required this.publicProfileController,
      required this.publicProfileRepository});

  String base64Image = "";
  final TextEditingController nameCtr = TextEditingController();
  final TextEditingController userNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneCtr = TextEditingController();
  final TextEditingController openingHour = TextEditingController();
  final TextEditingController closingHour = TextEditingController();
  final TextEditingController aboutCtr = TextEditingController();
  final TextEditingController webSiteCtr = TextEditingController();
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> chanePassFormKey = GlobalKey();
  final TextEditingController currentPassCtr = TextEditingController();
  final TextEditingController newPassCtr = TextEditingController();
  final TextEditingController confirmPassCtr = TextEditingController();
  RxBool isPasswordChangeLoading = false.obs;

  ///Account
  final TextEditingController deleteController = TextEditingController();
  RxBool isAcDeleteLoading = false.obs;
  String userName = "";
  RxBool isEditLoading = false.obs;
  PublicProfileModel? publicProfileModel;
  RxString image = ''.obs;
  Rx<File> profileImage = File('').obs;
  RxString path = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userName = Get.arguments;
    getPublicProfile();
  }

  setProfileImage(File profileImg) {
    profileImage.value = profileImg;
    String parent = '${profileImg.parent.path}/';
    path.value = profileImg.path;
    path.value = path.value.replaceAll(parent, '');
  }

  Future<void> getPublicProfile() async {
    isEditLoading(true);
    final result = await publicProfileRepository.getPublicShop(
        loginController.userInfo?.token ?? "", userName);
    result.fold((error) {
      isEditLoading(false);
      print(error.message);
    }, (data) async {
      publicProfileModel = data;
      isEditLoading(false);
    });
  }

  void saveEditProfileData() async {
    isLoading.value = true;
    if (profileImage.value.path.isNotEmpty) {
      Uri uri = Uri.parse(RemoteUrls.editProfile);
      var request = http.MultipartRequest('POST', uri);
      request.files.add(http.MultipartFile.fromBytes(
          'image', profileImage.value.readAsBytesSync(),
          filename: path.value));

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] =
          'Bearer ${loginController.userInfo?.token ?? ""}';

      request.fields['name'] = nameCtr.text.trim();
      request.fields['username'] = userNameCtr.text.trim();
      request.fields['email'] = emailCtr.text.trim();
      request.fields['phone'] = phoneCtr.text.trim();
      request.fields['web'] = webSiteCtr.text.trim();
      request.fields['about_public_profile'] = aboutCtr.text.trim();

      return request.send().then((value) {
        try {
          value.stream
              .transform(utf8.decoder)
              .transform(const LineSplitter())
              .listen((event) {
            getPublicProfile();
            publicProfileController.getPublicProfile();
            Get.snackbar('Successfully', 'Profile Update');
            image.value = '';
            isLoading.value = false;
          });
        } on SocketException {
          isLoading.value = false;
          throw const NetworkException(
              'Please check your \nInternet Connection', 10061);
        } on FormatException {
          isLoading.value = false;
          throw const DataFormatException('Data format exception', 422);
        } on TimeoutException {
          isLoading.value = false;
          throw const NetworkException('Request timeout', 408);
        }
      });
    } else {
      final body = {
        "name": nameCtr.text.trim(),
        "username": userNameCtr.text.trim(),
        "email": emailCtr.text.trim(),
        "phone": phoneCtr.text.trim(),
        "web": webSiteCtr.text.trim(),
        "about_public_profile": aboutCtr.text.trim()
      };

      final result = await profileUpdateRepository.editProfile(
          loginController.userInfo?.token ?? "", body);

      result.fold((error) {
        Get.snackbar("Warning", error.message);
        isLoading.value = false;
      }, (data) {
        Get.snackbar("Success", data);
        isLoading.value = false;
      });
    }
  }

  void changePassword() async {
    if (chanePassFormKey.currentState!.validate()) {
      final body = {
        "current_password": currentPassCtr.text,
        "password": newPassCtr.text,
        "password_confirmation": confirmPassCtr.text,
      };
      isPasswordChangeLoading.value = true;

      final result = await profileUpdateRepository.changePassword(
          loginController.userInfo?.token ?? "", body);

      result.fold((error) {
        isPasswordChangeLoading.value = false;
        Get.snackbar("Warning", error.message);
      }, (data) {
        isPasswordChangeLoading.value = false;
        Get.snackbar("Success", data);
      });
    }
  }

  ///Delete account
  void deleteAccount() async {
    isAcDeleteLoading.value = true;
    final result = await profileUpdateRepository
        .deleteAccount(loginController.userInfo?.token ?? "");

    result.fold((error) {
      isAcDeleteLoading.value = false;
      Get.snackbar("Warning", error.message);
    }, (data) {
      Get.snackbar("Success", data);
      sharedPreferences.clear();
      Get.offAllNamed(Routes.login);
      isAcDeleteLoading.value = false;
    });
  }
}
