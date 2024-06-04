import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/favourite/controller/favourite_controller.dart';
import 'package:artispark/apps/views/favourite/favourite_screen.dart';
import 'package:artispark/apps/views/home/component/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteMainScreen extends GetView<FavouriteController> {
  FavouriteMainScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: controller.loginController.userInfo == null
          ? Center(
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.login);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "Signin Please",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () => Future.delayed(
                const Duration(seconds: 1),
                () => controller.getFavouriteListData(),
              ),
              child: Obx(() {
                return controller.isLoading.value
                    ? const Center(
                        child: ShimmerList(),
                      )
                    : const CustomScrollView(
                        scrollDirection: Axis.vertical,
                        slivers: [
                          SliverAppBar(
                            title: Text('Favourite List'),
                          ),
                          FavouriteScreen(),
                        ],
                      );
              }),
            ),
    );
  }
}
