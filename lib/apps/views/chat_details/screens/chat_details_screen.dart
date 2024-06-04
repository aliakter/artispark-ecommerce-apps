import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/chat_details/controller/chat_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailsScreen extends GetView<ChatDetailsController> {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ashColor,
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getChatDetailsData();
        },
        child: SafeArea(
          child: Obx(() {
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      ///App Bar
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 5))
                        ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.chatDetailsModel.value!.data
                                    .selectedUser.name),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(Icons.close),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CustomImage(
                                        path: controller.chatDetailsModel.value!
                                            .data.selectedUser.imageUrl,
                                        // "${RemoteUrls.rootUrl3}${messageBloc.chatModel?.selectedUser?.image}",
                                        width: 80,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Visibility(
                                              // visible: messageBloc.chatModel?.selectedUser?.name.toString() != '',
                                              visible: true,
                                              child: Text(
                                                // "${messageBloc.chatModel?.selectedUser?.name}",
                                                controller
                                                    .chatDetailsModel
                                                    .value!
                                                    .data
                                                    .selectedUser
                                                    .name,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Visibility(
                                              // visible: messageBloc.chatModel?.selectedUser?.address.toString() != '',
                                              visible: false,
                                              child: Text(
                                                // "${messageBloc.chatModel?.selectedUser?.address}",
                                                controller
                                                    .chatDetailsModel
                                                    .value!
                                                    .data
                                                    .selectedUser
                                                    .name,
                                                style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Visibility(
                                                // visible: messageBloc.chatModel?.selectedUser?.showEmail != 1 && messageBloc.chatModel?.selectedUser?.email.toString() !='',
                                                visible: controller
                                                            .chatDetailsModel
                                                            .value!
                                                            .data
                                                            .selectedUser
                                                            .showEmail ==
                                                        null
                                                    ? false
                                                    : true,
                                                child: Text(
                                                  // "${messageBloc.chatModel?.selectedUser?.email}",
                                                  controller
                                                      .chatDetailsModel
                                                      .value!
                                                      .data
                                                      .selectedUser
                                                      .email,
                                                  style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 13),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // messageBloc.messageList.length == 0
                      //     ? Expanded(
                      //     child: SizedBox(
                      //       height: 150,
                      //       width: double.infinity,
                      //       child: Center(
                      //         child: Container(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 16, vertical: 8),
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(6),
                      //                 border: Border.all(color: Colors.black54)),
                      //             child: Text(
                      //               "No chat found",
                      //               style: const TextStyle(
                      //                   color: Colors.black54,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.w500),
                      //             )),
                      //       ),
                      //     ))
                      //     :
                      Expanded(
                        child: SingleChildScrollView(
                          // controller: scrollController,
                          reverse: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: ListView.separated(
                            shrinkWrap: true,
                            reverse: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // itemCount: messageBloc.messageList.length,
                            itemCount: controller
                                .chatDetailsModel.value!.data.messages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 3),
                                child: Row(
                                  mainAxisAlignment: /*messageBloc.isMe(
                              messageBloc.messageList[index].fromId)
                              ?*/
                                      controller.isMe(controller
                                              .chatDetailsModel
                                              .value!
                                              .data
                                              .messages[index]
                                              .fromId)
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: controller.isMe(
                                              controller.chatDetailsModel.value!
                                                  .data.messages[index].fromId)
                                          /*messageBloc.isMe(
                                  messageBloc
                                      .messageList[index].fromId)
                                  ?*/
                                          // index % 2 == 0
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: Get.width * 0.6,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: /* messageBloc.isMe(
                                          messageBloc
                                              .messageList[index]
                                              .fromId)
                                          ? */
                                                  controller.isMe(controller
                                                          .chatDetailsModel
                                                          .value!
                                                          .data
                                                          .messages[index]
                                                          .fromId)
                                                      ? Colors.blue
                                                      : Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(6),
                                                topRight:
                                                    const Radius.circular(6),
                                                bottomRight: index % 2 == 0
                                                    ? Radius.circular(0)
                                                    : Radius.circular(6),
                                                bottomLeft: Radius.circular(0),
                                              )),
                                          child: Text(
                                            controller.chatDetailsModel.value!
                                                .data.messages[index].body,
                                            style: TextStyle(
                                                color: /* messageBloc.isMe(
                                            messageBloc
                                                .messageList[index]
                                                .fromId)
                                            ?*/
                                                    controller.isMe(controller
                                                            .chatDetailsModel
                                                            .value!
                                                            .data
                                                            .messages[index]
                                                            .fromId)
                                                        ? Colors.white
                                                        : Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                Utils.timeAgo(controller
                                                    .chatDetailsModel
                                                    .value!
                                                    .data
                                                    .messages[index]
                                                    .createdAt
                                                    .toString()),
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            const SizedBox(width: 3),
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundImage: NetworkImage(
                                                  controller
                                                      .chatDetailsModel
                                                      .value!
                                                      .data
                                                      .selectedUser
                                                      .imageUrl),
                                              backgroundColor: controller
                                                          .chatDetailsModel
                                                          .value!
                                                          .data
                                                          .messages[index]
                                                          .read ==
                                                      1
                                                  ? Colors.blue
                                                  : ashTextColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        // height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(color: ashColor, boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 3,
                              offset: const Offset(0, -5))
                        ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.messageCtr,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (value) {
                                  if (value != '') {
                                    // messageBloc.sendMessage(value, widget.username);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Type your message",
                                  hintStyle: const TextStyle(fontSize: 14),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                if (controller.messageCtr.text == '') {
                                  return Utils.showSnackBarWithAction(
                                      context, "Type your message", () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }, actionText: "Cancel");
                                } else {
                                  controller.sendMessage();
                                }
                              },
                              // child: BlocBuilder<MessageCubit, MessageState>(
                              //     builder: (context, state) {
                              //       if (state is MessageStateSendLoading) {
                              //         return const Center(
                              //             child: SizedBox(
                              //                 height: 20,
                              //                 width: 20,
                              //                 child: CircularProgressIndicator()));
                              //       }
                              //       return const Icon(
                              //         Icons.send,
                              //         color: redColor,
                              //       );
                              //     }),
                              child: Icon(Icons.send, color: primaryColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
