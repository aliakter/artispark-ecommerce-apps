import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/order/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width / 3,
            child: Text(
              orderModel.product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // SizedBox(width: 2.w),
          Container(
            width: Get.width / 5,
            child: Text(
              '\$${orderModel.product.price}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // SizedBox(width: 2.w),
          Container(
            width: Get.width / 4.5,
            child: Text(
              DateFormat('dd-MM-yyyy').format(orderModel.product.updatedAt),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // SizedBox(width: 2.w),
          // SizedBox(
          //   width: Get.width / 9,
          //   child: PopupMenuButton(
          //     icon: const Icon(Icons.more_vert, color: primaryColor),
          //     onSelected: (value) {
          //
          //     },
          //     offset: Offset(Get.width / 10, Get.height / 20),
          //     shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(8.0),
          //           bottomRight: Radius.circular(8.0),
          //           topLeft: Radius.circular(8.0),
          //           topRight: Radius.circular(8.0)),
          //     ),
          //     itemBuilder: (ctx) => [
          //       _buildPopupMenuItem('View', 10),
          //       _buildPopupMenuItem('Delete', 10),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
