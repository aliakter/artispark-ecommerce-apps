import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/k_images.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/custom_dialog.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/challenge_product/controllers/challenge_product_controller.dart';
import 'package:artispark/apps/views/story/component/create_story.dart';
import 'package:artispark/apps/views/story/component/edit_story.dart';
import 'package:artispark/apps/views/story/component/story_details.dart';
import 'package:artispark/apps/views/story/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StoryListScreen extends GetView<StoryController> {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Stories List', style: TextStyle(color: Colors.white)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return controller.getAllStoryData();
        },
        child: Obx(() => controller.isStoryLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.createStory);
                        },
                        child: Container(
                          height: 45,
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Create New',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => controller.storyList.value.isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                              itemCount: controller.storyList.value.length,
                              itemBuilder: (context, index) {
                                return Obx(() => Container(
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: Get.height / 4,
                                            width: Get.width,
                                            margin: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${RemoteUrls.rootUrl}${controller.storyList.value[index].image}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            child: Text(
                                                '${controller.storyList.value[index].title}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            child: Text(
                                                'Created At: ${Utils.formatDate(controller.storyList.value[index].createdAt)}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Get.to(StoryDetails(
                                                      storyController:
                                                          controller,
                                                      id: controller.storyList
                                                          .value[index].id
                                                          .toString(),
                                                      form: 'story',
                                                    ));
                                                    // Get.toNamed(Routes.stroryScreen, arguments: controller.storyList.value[index]);
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove_red_eye,
                                                    color: primaryColor,
                                                  )),
                                              Visibility(
                                                visible: controller
                                                        .loginController
                                                        .userInfo
                                                        ?.user
                                                        .id
                                                        .toString() ==
                                                    controller.storyList
                                                        .value[index].userId,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.to(EditStory(
                                                        storyController:
                                                            controller,
                                                        storyModel: controller
                                                            .storyList
                                                            .value[index],
                                                      ))!
                                                          .then((value) {
                                                        controller
                                                            .titleController
                                                            .text = "";
                                                        controller
                                                            .descController
                                                            .text = "";
                                                        controller.path.value =
                                                            "";
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      color: primaryColor,
                                                    )),
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .loginController
                                                        .userInfo
                                                        ?.user
                                                        .id
                                                        .toString() ==
                                                    controller.storyList
                                                        .value[index].userId,
                                                child: IconButton(
                                                    onPressed: () {
                                                      customDialog(
                                                          context,
                                                          'Delete this Story',
                                                          'Are you sure to delete this story?',
                                                          'YES',
                                                          'NO', () {
                                                        controller
                                                            .deleteStoryData(
                                                                controller
                                                                    .storyList
                                                                    .value[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        Navigator.pop(context);
                                                      }, () {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color:
                                                          Colors.red.shade600,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                            ),
                          )
                        : SizedBox(
                            height: 500.h,
                            child: Center(
                              child: Text(
                                "Stories not found",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ))
                  ],
                ),
              )),
      ),
    );
  }
}
