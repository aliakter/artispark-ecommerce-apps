import 'package:artispark/apps/views/dashboard/component/dashboard_grid_card_layout.dart';
import 'package:artispark/apps/views/dashboard/component/dashboard_topbar.dart';
import 'package:artispark/apps/views/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/component/horizontal_ad_container.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F3F6),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: RefreshIndicator(
                  onRefresh: () => Future.delayed(const Duration(seconds: 1),
                      () => controller.getDashboardData()),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        sliver: SliverToBoxAdapter(
                            child: DashboardTopBar(controller: controller)),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        sliver: DashboardGridCardLayout(
                          dashboardController: controller,
                        ),
                      ),

                      ///.......... Recent Ads horizontal ..........
                      SliverToBoxAdapter(
                        child: HorizontalProductContainer(
                          adsModel: [],
                          title: "Recent Product",
                          onPressed: () {},
                          controller: controller.homeController,
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 30))
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
