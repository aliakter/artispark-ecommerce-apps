import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/compare/components/compare_list_container.dart';
import 'package:artispark/apps/views/compare/controller/compare_controller.dart';
import 'package:artispark/apps/views/home/component/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ComparePage extends GetView<CompareController> {
  ComparePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F7FE),
        appBar: AppBar(
          title: const Text("Compare list"),
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
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () => Future.delayed(
              const Duration(seconds: 1),
              () => controller.getCompareListData(),
            ),
            child: controller.isLoading.value
                ? const ShimmerList()
                : const CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      CompareListContainer(
                          // adModelList: controller.adList,
                          // title: "",
                          // onPressed: (){},
                          ),
                    ],
                  ),
          );
        }));
  }
}
