import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../data/remote_urls.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My chats"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => Future.delayed(
                    const Duration(seconds: 1), () => controller.getChatList()),
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    controller.chatListModel!.data.users.isEmpty
                        ? const SliverToBoxAdapter(
                            child: Center(child: Text("No Message Found")))
                        : SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return Material(
                                    color: Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.chatDetails,
                                          arguments: controller.chatListModel!
                                              .data.users[index].username,
                                        );
                                        // Navigator.pushNamed(context, RouteNames.chatDetails,arguments: state.chatModel.users[index].username);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            IntrinsicHeight(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 16.0,
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor: ashColor,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        "${RemoteUrls.rootUrl}${controller.chatListModel!.data.users[index].image}",
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .chatListModel!
                                                              .data
                                                              .users[index]
                                                              .name,
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 16,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          controller
                                                              .chatListModel!
                                                              .data
                                                              .users[index]
                                                              .body,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 13,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        Text(
                                                          Utils.timeAgo(
                                                              controller
                                                                  .chatListModel!
                                                                  .data
                                                                  .users[index]
                                                                  .createdAt
                                                                  .toString()),
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            const Divider(
                                              height: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                childCount:
                                    controller.chatListModel!.data.users.length,
                              ),
                            ),
                          )
                  ],
                ),
              );
      }),
    );
  }
}
