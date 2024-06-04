import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/challenge_product/controllers/challenge_product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/constants.dart';

class ChallengeProductScreen extends GetView<ChallengeProductController> {
  const ChallengeProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge Product',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  return controller.getChallengeData();
                },
                child: controller.challengeProductModel!.data.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          final data =
                              controller.challengeProductModel?.data[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.adDetailsScreen,
                              //     arguments: data.slug);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: data!.imageUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: Get.height / 4,
                                      width: Get.width,
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => SizedBox(
                                      height: Get.height / 4,
                                      width: Get.width,
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(child: Icon(Icons.error)),
                                  ),
                                  // Container(
                                  //   height: Get.height / 4,
                                  //   width: Get.width,
                                  //   margin: const EdgeInsets.all(3),
                                  //   decoration: const BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: AssetImage(KImages.defaultImage),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Price: \$${data.price ?? ""}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          'Validity:  ${DateFormat('yyyy-MM-dd').format(data.challengeLastDate)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data.title ?? "",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        // Text(data?.description ?? "",
                                        //     style:
                                        //         TextStyle(fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  Visibility(
                                    visible: data.userChallengeStatus == '2',
                                    child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          'Denied',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Visibility(
                                    visible:
                                        data.isChallengeProductUploaded == '1',
                                    child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          'Image uploaded',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  ///Upload image
                                  Obx(() => controller.isUploading.value
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Visibility(
                                          visible: data.userChallengeStatus ==
                                                  "1" &&
                                              data.isChallengeProductUploaded ==
                                                  '0',
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Visibility(
                                              child: GestureDetector(
                                                onTap: () async {
                                                  final imagePath = await Utils
                                                      .pickSingleImage();

                                                  controller
                                                      .uploadChallenge(
                                                        data.challengeProduct
                                                            ?.id,
                                                        imagePath,
                                                      )
                                                      .then((value) => controller
                                                          .getChallengeData());
                                                },
                                                child: Container(
                                                  // height: 45,
                                                  width: Get.width * 0.4,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: primaryColor,
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Upload Image',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),

                                  ///status change button
                                  Visibility(
                                    visible: data.userChallengeStatus == "0",
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.changeStatus(
                                                adId: data.id, status: 2);
                                            controller.getChallengeData();
                                          },
                                          child: Container(
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: primaryColor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Deny',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            controller.changeStatus(
                                                adId: data.id, status: 1);
                                            controller.getChallengeData();
                                          },
                                          child: Container(
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: primaryColor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Accept',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10)
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount:
                            controller.challengeProductModel!.data.length,
                      )
                    : const Center(
                        child: Text(
                          "Product Not Found",
                          style: TextStyle(),
                        ),
                      ),
              );
      }),
    );
  }
}
