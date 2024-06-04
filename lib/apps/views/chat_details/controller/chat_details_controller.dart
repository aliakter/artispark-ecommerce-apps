import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/chat_details/model/chat_details_model.dart';
import 'package:artispark/apps/views/chat_details/repository/chat_details_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatDetailsController extends GetxController {
  final LoginController loginController;
  final ChatDetailsRepository chatDetailsRepository;

  ChatDetailsController(this.chatDetailsRepository, this.loginController);

  String user = '';
  RxBool isLoading = false.obs;
  Rxn<ChatDetailsModel> chatDetailsModel = Rxn<ChatDetailsModel>();
  final TextEditingController messageCtr = TextEditingController();

  @override
  void onInit() {
    user = Get.arguments;
    getChatDetailsData();
    super.onInit();
  }

  void getChatDetailsData() async {
    isLoading.value = true;

    final result = await chatDetailsRepository.getChatDetails(
        loginController.userInfo?.token ?? "", user);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) {
      chatDetailsModel.value = data;
      isLoading.value = false;
    });
  }

  isMe(String id) {
    if (chatDetailsModel.value!.data.user.id.toString().compareTo(id) == 0) {
      return true;
    } else {
      return false;
    }
  }

  sendMessage() async {
    final result = await chatDetailsRepository.sendMessage(
        loginController.userInfo!.token,
        user,
        {"body": messageCtr.text.trim()});
    result.fold(
      (error) {
        print(error.message);
      },
      (data) {
        getChatDetailsData();
        messageCtr.clear();
      },
    );
  }
}
