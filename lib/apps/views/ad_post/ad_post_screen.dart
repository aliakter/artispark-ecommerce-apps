import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdPostScreen extends GetView<AdPostController> {
  const AdPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdPostController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              SizedBox(
                child: Text(
                  "Product Post",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //     statusBarColor: primaryColor,
          //     statusBarIconBrightness: Brightness.light),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(color: primaryColor))
              : StreamBuilder(
                  initialData: 0,
                  stream: controller.naveListener.stream,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    int index = snapshot.data ?? 0;
                    return Column(
                      children: [
                        Expanded(
                          child: FadeTransition(
                            opacity: controller.animationController,
                            child: IndexedStack(
                                index: index, children: controller.pageList),
                          ),
                        ),
                        Visibility(
                          visible: index == 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(1, 1),
                              )
                            ]),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    child: Obx(
                                      () => ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        onPressed: () {
                                          Utils.closeKeyBoard(context);
                                          if (controller
                                              .featureFormKey.currentState!
                                              .validate()) {
                                            controller.postAds();
                                          }
                                        },
                                        child: controller.isPostAdsLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                index == 1
                                                    ? "Post Product"
                                                    : "Next Step",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
        ),
      );
    });
  }
}
