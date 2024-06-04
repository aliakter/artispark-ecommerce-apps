import 'dart:math' as math;

import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/compare_button.dart';
import 'package:artispark/apps/global_widget/favorite_button.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';

class ProductCard extends StatelessWidget {
  final Ad? adModel;
  final double? width;
  final String? from;
  final int? index;
  final int? myId;
  final int? sellerId;
  final int? logInUserId;
  final HomeController homeController;
  final bool isPublicProfile;

  const ProductCard(
      {Key? key,
      this.adModel,
      this.width,
      this.from,
      this.index,
      this.myId,
      this.sellerId,
      this.logInUserId,
      this.isPublicProfile=false,
      required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.adDetailsScreen, arguments: "${adModel?.slug}");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildImage()),
            _buildContent(context)
            // widget.from == 'home' || widget.from=='ads_page' ? Expanded(child: _buildImage()) : widget.from =='public_shop' ? _buildImage() : SizedBox(),
            // widget.from == 'public_shop' ? Expanded(child: _buildContent(context)) : widget.from =='home' || widget.from=='ads_page' ? _buildContent(context) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Visibility(
            visible: true,
            child: Text(
              "\$${adModel?.price ?? 0}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2),
          SizedBox(
            child: Text(
              "${adModel?.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                // visible: widget.myId != widget.sellerId,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Visibility(
                        visible: isPublicProfile == false,
                        child: InkWell(
                          onTap: () async {
                            print("Compare");
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.shade200,
                            // child: Icon(Icons.change_circle_outlined),
                            child: CompareButton(
                              index: int.parse("${adModel?.id}"),
                              adsUserId: adModel!.customer!.id,
                              logInUserId: logInUserId,
                              productId: int.parse("${adModel?.id}"),
                              homeController: homeController,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Visibility(
                        visible: isPublicProfile == false,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.shade200,
                          child: FavoriteButton(
                            productId: adModel!.id,
                            isFav: adModel!.isWishlist,
                            from: from,
                            adsUserId: adModel!.customer!.id,
                            controller: homeController,
                            logInUserId: logInUserId,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ashColor)),
      ),
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: CustomImage(
                path: "${RemoteUrls.rootUrl}${adModel!.thumbnail}",
                // path: widget.adModel!.thumbnail != ''
                //     ? '${RemoteUrls.rootUrl3}${widget.adModel!.thumbnail}'
                //     : null,
                // path: adModel.imageUrl != '' ? adModel.imageUrl : null,
                fit: BoxFit.cover),
          ),
          Visibility(
            visible: false,
            child: Positioned(
              top: 5,
              left: -10,
              child: Transform.rotate(
                angle: -math.pi / 4.1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xFF2DBE6C),
                      borderRadius: BorderRadius.circular(10)
                      // borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                      ),
                  child: const Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // _buildOfferInPercentage(),
          // widget.from=='home'||widget.from=='public_shop'||widget.from=='ads_page' ? Container() : Positioned(
          //   top: 8,
          //   left: 8,
          //   child:
          //   FavoriteButton(productId: widget.adModel!.id, isFav: widget.adModel!.is_wishlist),
          // ),
        ],
      ),
    );
  }
}
