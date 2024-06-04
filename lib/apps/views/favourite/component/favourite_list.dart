import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/favourite/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';
import '../model/favourite_model.dart';

class FavouriteProductCard extends StatelessWidget {
  final Datum adModel;
  final double? width;

  const FavouriteProductCard({
    super.key,
    required this.adModel,
    this.width,
  });

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
          Get.toNamed(Routes.adDetailsScreen, arguments: adModel.ad.slug);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildImage()),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ashColor)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: CustomImage(path: adModel.ad.imageUrl, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5),
          SizedBox(
            child: Text(
              adModel.ad.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w600,
                color: paragraphColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: Text(
              adModel.ad.category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold, height: 1),
            ),
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: true,
            child: Text(
              "\$${adModel.ad.price ?? "0.0"}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    // Icon(Icons.location_on,color: Colors.grey.shade500,size: 16,),
                    Expanded(
                      child: Text(
                        adModel.ad.address,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey.shade500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        Get.find<FavouriteController>()
                            .setUnsetWishlist(adModel.ad.id);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: Colors.red,
                          ),
                          child: adModel.ad.isWishlist
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.grey.shade800,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.favorite_outline,
                                  color: Colors.grey.shade500,
                                  size: 20,
                                )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
