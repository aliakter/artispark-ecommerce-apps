import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/global_widget/custom_text_feild.dart';
import 'package:artispark/apps/views/ad_details/controllers/ad_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key, required this.controller, required this.productId});

  final AdDetailsController controller;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Center(
                    child: Text('What is your rate?',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 15.h),
                  Obx(() => RatingBar.builder(
                        initialRating: controller.ratingVal.value,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 40,
                        itemPadding: const EdgeInsets.only(right: 2),
                        itemBuilder: (context, index) {
                          return const Icon(Icons.star, color: primaryColor);
                        },
                        onRatingUpdate: (rating) {
                          controller.ratingChange(rating);
                        },
                      )),
                  SizedBox(height: 15.h),
                  Center(
                    child: Text(
                      'Please share your opinion about the product',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                      controller: controller.reviewController,
                      lines: 5,
                      hintext: 'Your Review'),
                ],
              ),
              SizedBox(height: 24.h),
              Obx(() => controller.isSendingReview.value
                  ? Container(
                      height: 40,
                      width: Get.width / 1.2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      alignment: Alignment.center,
                      child:
                          const CircularProgressIndicator(color: Colors.white),
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.sendReview(context, productId);
                      },
                      child: Container(
                        height: 40,
                        width: Get.width / 1.2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(6)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Send Review",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )),
              SizedBox(height: 32.h)
            ],
          ),
        ),
      ),
    );
  }
}
