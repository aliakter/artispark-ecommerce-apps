import 'dart:developer';

import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompareButton extends StatelessWidget {
  const CompareButton(
      {super.key,
      required this.productId,
      this.from,
      this.index,
      this.adsUserId,
      this.logInUserId,
      required this.homeController});

  final int productId;
  final String? from;
  final int? index;
  final int? adsUserId;
  final int? logInUserId;

  final double height = 28;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: true,
        child: InkWell(
          onTap: () async {
            if (logInUserId == adsUserId) {
              Utils.showSnackBar(
                  context, "You can not add your ads to your compare list ");
            } else {
              ///check for 3 item limit
              // if (Get.find<HomeController>().compareList.length < 3) {
              ///remove from compare list.
              if (homeController.compareList.contains(productId)) {
                Utils.showSnackBar(
                    context, "Item remove from your compare list");
                homeController.removedFromCompareList(productId);
              } else {
                ///add to compare list
                Utils.showSnackBar(context, "Item added to your compare list");
                homeController.addToCompareList(productId);
              }
              // } else {
              //   Utils.errorSnackBar(context, "You can not add more than 3 ads");
              // }
            }
            // print('Compare list length ${box.length} box index ${box.keys.map((e) => e).toList()} box item ${box.values.map((e) => e).toList()}');
          },
          child: homeController.compareList.contains(productId) ||
                  homeController.checkIfCompareList(productId)
              ? const Icon(
                  Icons.change_circle,
                  color: Colors.black,
                  size: 20,
                )
              : Icon(
                  Icons.change_circle_outlined,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
        ),
      );
    });
  }
}
