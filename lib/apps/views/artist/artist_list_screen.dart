import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/artist/controller/artist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArtistController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Artist List"),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: iconThemeColor,
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  height: Get.height,
                  padding: const EdgeInsets.all(16),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 4,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              blurRadius: 16,
                                              offset: const Offset(0, 0)),
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              blurRadius: 16,
                                              offset: const Offset(0, 0)),
                                        ]),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CustomImage(
                                          path: controller
                                              .artistList[index].imageUrl),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  controller.artistList[index].name,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.chatDetails,
                                  arguments:
                                      controller.artistList[index].username,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                ),
                                child: const Text("Chat"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemCount: controller.artistList.length,
                  ),
                ),
        ),
      );
    });
  }
}
