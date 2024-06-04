import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/compare_button.dart';
import 'package:artispark/apps/global_widget/favorite_button.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CollaborateProducts extends StatelessWidget {
  const CollaborateProducts(
      {super.key,
      required this.colobarate,
      required this.logInUserId,
      required this.index,
      required this.controller});

  final Colobarate colobarate;
  final int? logInUserId;
  final int index;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.adDetailsScreen, arguments: colobarate.slug);
      },
      child: Container(
        height: 250,
        width: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: "${RemoteUrls.rootUrl}${colobarate.thumbnail}",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(colobarate.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text(
                      "\$${colobarate.price}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey.shade300,
                              child: CompareButton(
                                productId: colobarate.id.toInt(),
                                adsUserId: colobarate.customer.id,
                                logInUserId: logInUserId,
                                index: index,
                                homeController: controller,
                              ),
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey.shade200,
                                child: FavoriteButton(
                                    productId: colobarate.id.toInt(),
                                    isFav: colobarate.isWishlist,
                                    adsUserId: colobarate.customer.id,
                                    logInUserId: logInUserId,
                                    controller: controller,
                                    from: "")),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
