import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/custom_text_feild.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchsController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.categoryList.value.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: controller.categoryList.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = controller.categoryList.value[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.adsScreen, arguments: [
                              controller.categoryList.value[index].slug,
                              '',
                              controller.categoryList.value
                            ]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Container(
                              color: Colors.grey.shade300,
                              padding: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CustomImage(
                                            path:
                                                "${RemoteUrls.rootUrl}${controller.categoryList.value[index].image}",
                                            fit: BoxFit.cover,
                                            height: Get.height,
                                            width: Get.width,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 30),
                                      Text(
                                        controller
                                            .categoryList.value[index].name,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text("No product found"),
                  ),
      ),
    );
  }
}
