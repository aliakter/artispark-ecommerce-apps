import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/story/model/story_model.dart';
import 'package:artispark/apps/views/story/repository/story_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  final StoryRepository storyRepository;
  final LoginController loginController;

  StoryController(this.storyRepository, this.loginController);

  final titleController = TextEditingController();
  final descController = TextEditingController();

  RxBool isStoryLoading = false.obs;
  RxBool isStoryDetailsLoading = false.obs;
  RxBool isCreateStoryLoading = false.obs;
  RxBool isEditStoryLoading = false.obs;

  Rx<File> storyImage = File('').obs;
  Rx<File> storyUpdateImage = File('').obs;
  RxString path = ''.obs;
  RxString updatePath = ''.obs;
  Rx<List<StoryModel>> storyList = Rx<List<StoryModel>>([]);
  final createStoryFormKey = GlobalKey<FormState>();
  final editStoryFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getAllStoryData();
  }

  setProfileImage(File profileImg) {
    storyImage.value = profileImg;
    String parent = '${profileImg.parent.path}/';
    path.value = profileImg.path;
    path.value = path.value.replaceAll(parent, '');
  }

  setProfileUpdateImage(File profileImg) {
    storyUpdateImage.value = profileImg;
    String parent = '${profileImg.parent.path}/';
    updatePath.value = profileImg.path;
    updatePath.value = updatePath.value.replaceAll(parent, '');
  }

  Future<void> getAllStoryData() async {
    isStoryLoading.value = true;
    final result = await storyRepository
        .getAllStory(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isStoryLoading.value = false;
      print(error.message);
    }, (data) async {
      storyList.value = [];
      for (var model in data) {
        if (loginController.userInfo?.user.id.toString() == model.userId) {
          storyList.value.add(model);
        }
      }
      isStoryLoading.value = false;
    });
  }

  StoryModel? storyDetails;

  Future<void> getStoryDetails(String id) async {
    isStoryDetailsLoading.value = true;
    final result = await storyRepository.getStoryDetails(
        loginController.userInfo?.token ?? "", id);
    result.fold((error) {
      isStoryDetailsLoading.value = false;
      print(error.message);
    }, (data) async {
      storyDetails = data;
      isStoryDetailsLoading.value = false;
    });
  }

  bool isTitleOkay() {
    if (titleController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isDescriptionOkay() {
    if (descController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> createStoryData(BuildContext context) async {
    isCreateStoryLoading.value = true;
    if (isTitleOkay() && isDescriptionOkay() && storyImage.value.path != "") {
        Uri uri = Uri.parse(RemoteUrls.storyCreate);
        var request = http.MultipartRequest('POST', uri);
        request.files.add(http.MultipartFile.fromBytes(
            'image', storyImage.value.readAsBytesSync(),
            filename: storyImage.value.path));

        request.headers['Accept'] = 'application/json';
        request.headers['Authorization'] =
            'Bearer ${loginController.userInfo?.token ?? ""}';

        request.fields['title'] = titleController.text;
        request.fields['description'] = descController.text;

        return request.send().then((value) {
          if (value.statusCode == 200) {
            value.stream
                .transform(utf8.decoder)
                .transform(const LineSplitter())
                .listen((event) {
              final jsonData = json.decode(event);
              if (jsonData['success']) {
                isCreateStoryLoading.value = false;
                path.value = "";
                titleController.text = "";
                descController.text = "";
                storyImage.value.existsSync()
                    ? storyImage.value.deleteSync()
                    : null;
                Get.snackbar("Success", "Story saved successfully.");
                isCreateStoryLoading.value = false;
                getAllStoryData().then((value) {
                  Navigator.pop(Get.context!);
                });
              } else {
                final errorMsg = jsonData["message"];
                isCreateStoryLoading.value = false;
                Get.snackbar('Warning', errorMsg.message);
                isCreateStoryLoading.value = false;
              }
            });
          }
        });
    } else if (!isTitleOkay()) {
      Get.snackbar('Title can\'t be empty', 'Please enter your title');
      isCreateStoryLoading.value = false;
    } else if (!isDescriptionOkay()) {
      Get.snackbar(
          'Description can\'t be empty', 'Please enter your description');
      isCreateStoryLoading.value = false;
    } else {
      Get.snackbar('Image can\'t be empty', 'Please enter your image');
      isCreateStoryLoading.value = false;
    }
  }

  Future<void> editStoryData(BuildContext context, String id) async {
    isEditStoryLoading.value = true;
      if (updatePath.value != "") {
        Uri uri = Uri.parse(RemoteUrls.storyUpdate(id));
        var request = http.MultipartRequest('POST', uri);
        request.files.add(http.MultipartFile.fromBytes(
            'image', storyUpdateImage.value.readAsBytesSync(),
            filename: storyUpdateImage.value.path));

        request.headers['Accept'] = 'application/json';
        request.headers['Authorization'] =
            'Bearer ${loginController.userInfo?.token ?? ""}';

        request.fields['title'] = titleController.text;
        request.fields['description'] = descController.text;

        return request.send().then((value) {
          if (value.statusCode == 200) {
            value.stream
                .transform(utf8.decoder)
                .transform(const LineSplitter())
                .listen((event) {

                  print("dddddddddddddddd");
                  print(event);
                  print("ddddddddddddddd");

              final jsonData = json.decode(event);
              if (jsonData['success']) {
                isEditStoryLoading.value = false;
                updatePath.value = "";
                titleController.text = "";
                descController.text = "";
                storyUpdateImage.value.existsSync()
                    ? storyUpdateImage.value.deleteSync()
                    : null;
                Get.snackbar("Success", "Story update successfully.");
                isEditStoryLoading.value = false;
                getAllStoryData();
                Navigator.pop(Get.context!);
              } else {
                final errorMsg = jsonData["message"];
                isEditStoryLoading.value = false;
                Get.snackbar('Warning', errorMsg.message);
                isEditStoryLoading.value = false;
              }
            });
          }
        });
      }else {
        Map<String, dynamic> body = {
          'title': titleController.text.trim(),
          'description': descController.text.trim(),
        };

        print("aaaaaaaaaaa");
        print(body);
        print("aaaaaaaaaaaaa");

        final result = await storyRepository.editStoryData(loginController.userInfo?.token ?? "", id, body);
        result.fold((error) {
          Get.snackbar("Warning", "Something wrong");
          isEditStoryLoading.value = false;
        }, (data) async {
          getAllStoryData();
          Navigator.pop(Get.context!);
          Get.snackbar('Successfully', 'Profile Updated');
          isEditStoryLoading.value = false;
        });
      }
    }

  Future<void> deleteStoryData(String id) async {
    isEditStoryLoading.value = true;
    final result = await storyRepository.deleteStoryData(
        loginController.userInfo!.token, id);
    result.fold((error) {
      Get.snackbar("Warning", "Something wrong");
      isEditStoryLoading.value = false;
      print(error.message);
    }, (data) async {
      getAllStoryData();
      Get.snackbar("Story Deleted", data);
      isEditStoryLoading.value = false;
    });
  }

  clearAll() {
    titleController.text = "";
    descController.text = "";
    path.value = "";
    if (storyImage.value.path.isNotEmpty) {
      storyImage.value.deleteSync();
    }
  }
}
