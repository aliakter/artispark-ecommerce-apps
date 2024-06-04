import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/home/component/shimmer_list.dart';
import 'package:artispark/apps/views/wishlist/component/wish_list_produtc_container.dart';
import 'package:artispark/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends GetView<WishlistController> {
  WishListScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FE),
      appBar: AppBar(
        title: Text("Wishlist Products"),
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
            () => controller.getWishlistData(),
          ),
          child: controller.isLoading.value
              ? const Center(
                  child: ShimmerList(),
                )
              : const CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    WishListProductContainer(
                        // adModelList: state.adList,
                        // onPressed: (){},
                        // form: 'wist_list_screen',
                        ),
                  ],
                ),
        );
      }),
    );
  }
}
