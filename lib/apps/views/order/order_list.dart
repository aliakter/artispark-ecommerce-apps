import 'package:artispark/apps/views/order/contrtroller/order_conttroller.dart';
import 'package:artispark/apps/views/order/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order List",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => orderController.isLoading.value
          ? Container(
              height: Get.height / 2,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : orderController.orders.value.isNotEmpty
              ? CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.grey.shade100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 5,
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 4.5,
                                child: Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(width: 35.w),
                              // SizedBox(
                              //   child: Text(
                              //     "Action",
                              //     style: TextStyle(
                              //         fontSize: 12.sp, fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: orderController.orders.value.length,
                          (context, index) {
                            return OrderCard(
                                orderModel:
                                    orderController.orders.value[index]);
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20.h),
                    ),
                  ],
                )
              : Center(
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black54)),
                        child: const Text(
                          "Data Not Found",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
