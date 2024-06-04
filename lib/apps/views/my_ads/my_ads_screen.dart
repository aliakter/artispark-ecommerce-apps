import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/my_ads/component/my_ads_card.dart';
import 'package:artispark/apps/views/my_ads/controller/my_ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyAdsScreen extends GetView<MyAdsController> {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ashColor,
      appBar: AppBar(
        title: Text("My Products"),
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
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 8,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        /// ....... Grid View Ads ...............
                        // GridView.builder(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 2,
                        //     crossAxisSpacing: 8,
                        //     mainAxisSpacing: 8,
                        //     mainAxisExtent: 300,
                        //   ),
                        //   itemBuilder: (context,index){
                        //     return CustomerAdCard(adModel: adList[index]);
                        //   },
                        //   itemCount: adList.length,
                        // ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CustomerAdListCard(
                              adModel: controller.userAdModel!.data.data[index],
                              myAdsController: controller,
                            );
                          },
                          // itemCount: adList.length,
                          itemCount: controller.userAdModel!.data.data.length,
                        ),
                        if (controller.userAdModel!.data.data.isEmpty)
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Colors.black54)),
                                child: Text(
                                  "No products found",
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  )
                ],
              );
      }),
    );
  }
}
