import 'package:artispark/apps/views/home/component/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/compare_list_container.dart';
import '../controller/compare_controller.dart';

class CompareScreen extends GetView<CompareController> {
  CompareScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => Future.delayed(const Duration(seconds: 1),
            () => controller.getCompareListData()),
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(child: ShimmerList())
              : const CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverAppBar(title: Text('Compare List')),
                    CompareListContainer(),
                  ],
                );
        }),
      ),
    );
  }
}
