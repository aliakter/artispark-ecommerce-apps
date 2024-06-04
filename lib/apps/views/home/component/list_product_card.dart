import 'dart:math' as math;

import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/compare_button.dart';
import 'package:artispark/apps/global_widget/favorite_button.dart';
import 'package:artispark/apps/views/ad_details/model/ad_details_model.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/ad_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';

class ListProductCard extends StatelessWidget {
  final Ad adsModel;
  final int? logInUserId;
  final String? form;
  final int index;
  final HomeController homeController;

  const ListProductCard(
      {Key? key,
      this.logInUserId,
      required this.adsModel,
      this.form,
      required this.index,
      required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(0, 0),
                blurRadius: 3),
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        // border: Border(bottom: BorderSide(color: borderColor)),
      ),
      height: 130,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: CustomImage(
                path: "${RemoteUrls.rootUrl}${adsModel.thumbnail}",
                //   path: adModel.galleries.isNotEmpty ? adModel.galleries[0].imageUrl : null,
                // path: widget.adModel.thumbnail != ''
                //     ? '${RemoteUrls.rootUrl3}${widget.adModel.thumbnail}'
                //     : null,
                fit: BoxFit.cover),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              top: 17,
              left: -10,
              child: Transform.rotate(
                angle: -math.pi / 4.1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xFF2DBE6C),
                      borderRadius: BorderRadius.circular(10)
                      // borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                      ),
                  child: const Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )

          /*_buildOfferInPercentage(),
          Positioned(
            top: 8,
            left: 8,
            child: FavoriteButton(productId: productModel.id),
          ),*/
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: adsModel.price != null,
            child: Text(
              "\$${adsModel.price}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 3),
          SizedBox(
            child: Text(
              "${adsModel.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: blackColor, fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Expanded(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Icon(
              //         Icons.location_on_outlined,
              //         color: Colors.grey.shade500,
              //         size: 16,
              //       ),
              //       // Icon(Icons.location_on,color: Colors.grey.shade500,size: 16,),
              //       Expanded(
              //         child: Text(
              //           "${adModel.city}",
              //           // maxLines: 1,
              //           style: TextStyle(color: Colors.grey.shade500),
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.shade300,
                      // child: const Icon(Icons.change_circle_outlined),
                      child: CompareButton(
                        productId: adsModel.id,
                        adsUserId: adsModel.customer!.id,
                        logInUserId: logInUserId,
                        index: index,
                        homeController: homeController,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.shade200,
                      // child: const Icon(Icons.favorite),
                      child: FavoriteButton(
                        productId: adsModel.id,
                        isFav: adsModel.isWishlist,
                        // isFav: false,
                        adsUserId: adsModel.customer!.id,
                        logInUserId: logInUserId,
                        controller: homeController,
                        from: form,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.max,
          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Icon(Icons.location_on_outlined,color: redColor,size: 16,),
          //     const SizedBox(
          //       width: 8,
          //     ),
          //     Expanded(
          //       child: SizedBox(
          //         child: Text(adModel.address,maxLines: 1,
          //           // overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //     ),
          //     // const Spacer(),
          //     PriceCardWidget(
          //       price: double.parse(adModel.price.toString()),
          //       offerPrice: -1,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
