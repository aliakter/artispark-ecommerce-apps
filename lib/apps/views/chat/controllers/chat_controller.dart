import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/chat/model/chat_list_model.dart';
import 'package:artispark/apps/views/chat/repository/chat_repository.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final LoginController loginController;
  final ChatRepository chatRepository;

  ChatController(this.loginController, this.chatRepository);
  ChatListModel? chatListModel;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getChatList();
    super.onInit();
  }

  void getChatList() async {
    isLoading.value = true;

    final result =
        await chatRepository.getChatList(loginController.userInfo!.token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) {
      chatListModel = data;
      isLoading.value = false;
    });
  }
}
