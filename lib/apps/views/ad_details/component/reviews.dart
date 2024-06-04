import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/k_images.dart';
import 'package:artispark/apps/views/ad_details/model/ad_details_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key, required this.customer});

  final ProductReview customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      height: Get.width / 8,
                      width: Get.width / 8,
                      margin: EdgeInsets.symmetric(vertical: 2.5),
                      child: CachedNetworkImage(
                        imageUrl: "${customer.user?.imageUrl}",
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${customer.user?.name}",
                            style: TextStyle(fontSize: 16)),
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: double.parse(customer.stars),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: int.parse(customer.stars),
                          itemSize: 20,
                          itemPadding: const EdgeInsets.only(right: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: primaryColor,
                            // size: 5,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    )
                  ],
                ),
                Text("${printDifferenceFromNow(customer.updatedAt)} days ago")
              ],
            ),
          ),
          Text(customer.comment)
        ],
      ),
    );
  }

  String printDifferenceFromNow(DateTime selectedDateTime) {
    // Calculate the difference
    Duration difference = DateTime.now().difference(selectedDateTime);

    // Print the difference
    print(
        'Difference: ${difference.inDays} days and ${difference.inHours.remainder(24)} hours.');
    return difference.inDays.toString();
  }
}
