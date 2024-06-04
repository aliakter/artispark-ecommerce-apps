import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/k_images.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/custom_avatar.dart';
import 'package:artispark/apps/views/dashboard/controller/dashboard_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar({Key? key, required this.controller}) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 2.w),
            borderRadius: BorderRadius.circular(80),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: CachedNetworkImage(
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              imageUrl: "${controller.dashboardModel?.data.user.imageUrl}",
              placeholder: (context, url) => Image.asset(
                KImages.defaultImage,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.dashboardModel?.data.user.name ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${controller.dashboardModel?.data.adsCount.activeAdsCount} Active Posted Products",
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.white.withAlpha(910),
          elevation: 3,
          shadowColor: const Color(0xFFFFFFFF),
          borderOnForeground: true,
          shape: const CircleBorder(),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              Get.toNamed(Routes.editProfile,
                  arguments:
                      controller.loginController.userInfo!.user.username);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.edit,
                color: primaryColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
