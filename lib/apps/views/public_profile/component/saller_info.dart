import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/public_profile_model.dart';

class SellerInfo extends StatelessWidget {
  const SellerInfo({super.key, required this.profile});

  final PublicProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 1)
        ],
      ),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///image
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(80),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CustomImage(
                    height: 70,
                    width: 70,
                    path: profile!.user.imageUrl != ''
                        ? profile!.user.imageUrl
                        : null,
                    fit: BoxFit.cover),
              ),
            ),
            // CustomImage(path: '',width: 80,height: 50,color: Colors.grey.shade300,),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile!.user.username ?? "",
                  // "test",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: double.parse(profile!.ratingDetails.average),
                      itemBuilder: (context, index) =>
                          const Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 22.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      profile!.ratingDetails.total.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(" Review"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: Get.find<PublicProfileController>()
                          .loginController
                          .userInfo
                          ?.user
                          .id !=
                      profile!.user.id,
                  child: SizedBox(
                    height: 35,
                    width: 180,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // else if(currentUser.userInfo==null){
                        //   Utils.openSignInDialog(context);
                        //   return;
                        // }

                        if (Get.find<PublicProfileController>().isLogin()) {
                          Get.toNamed(Routes.chatDetails,
                              arguments: profile!.user.username);
                        } else {
                          Get.snackbar("Login required", "Please login");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2))),
                      icon:
                          const Icon(Icons.question_answer_outlined, size: 18),
                      label: const Text(
                        "Chat with seller",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
          Visibility(
            visible: Get.find<PublicProfileController>()
                    .loginController
                    .userInfo
                    ?.user
                    .id ==
                profile!.user.id,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      profile!.user.email,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Visibility(
                  visible: profile!.user.phone.isNotEmpty,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: primaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            profile!.user.phone,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
                Visibility(
                  visible: profile!.user.web.isNotEmpty,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.web,
                            color: primaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            profile!.user.web,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
                Visibility(
                  visible: profile!.user.openingHour.isNotEmpty,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: primaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                              "${profile!.user.openingHour.replaceAll(":00", "")} to ${profile!.user.closingHours.replaceAll(":00", "")}"),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Visibility(
                  visible: profile!.user.aboutPublicProfile.isNotEmpty,
                  child: const Text(
                    "About Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
                Text(
                  profile!.user.aboutPublicProfile,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
