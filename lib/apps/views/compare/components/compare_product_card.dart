import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/compare/controller/compare_controller.dart';
import 'package:artispark/apps/views/compare/model/compare_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';

class CompareProductCard extends StatelessWidget {
  final Datum adModel;
  final double? width;
  const CompareProductCard({
    super.key,
    required this.adModel,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // box = Hive.box('compareList');

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () {
          print('hjsbhjaskdfjhksaf');
          Get.toNamed(Routes.adDetailsScreen, arguments: adModel.slug);

          // Navigator.pushNamed(context, RouteNames.adDetails,
          //     arguments: widget.adModel!.slug);
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
      // height: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: CustomImage(
                path: adModel.imageUrl,
                // path: widget.adModel!.thumbnail != ''
                //     ? '${RemoteUrls.rootUrl3}${widget.adModel!.thumbnail}'
                //     : null,
                // path: adModel.imageUrl != '' ? adModel.imageUrl : null,
                fit: BoxFit.cover),
          ),
          // _buildOfferInPercentage(),
          // Positioned(
          //   top: 8,
          //   left: 8,
          //   child:
          //   FavoriteButton(productId: adModel!.id, isFav: adModel!.is_wishlist),
          // ),
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
              adModel.title,
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
              adModel.category.name,
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
              "\$${adModel.price ?? "0.0"}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                        adModel.address,
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
                    // GestureDetector(
                    //   onTap: () {
                    //     // if (widget.userData != null) {
                    //     //   Navigator.pushNamed(context, RouteNames.chatDetails,
                    //     //       arguments: widget.adModel?.customer?.username);
                    //     // } else {
                    //     //   Utils.openSignInDialog(context);
                    //     // }
                    //   },
                    //   child: Container(
                    //       padding: EdgeInsets.all(5),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(5),
                    //           color: const Color(0xFF198754)),
                    //       child: Icon(
                    //         Icons.chat_outlined,
                    //         size: 15,
                    //         color: Colors.white,
                    //       )),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // FavoriteButton(productId: adModel!.id, isFav: adModel!.is_wishlist);
                        // await box.delete(widget.index);
                        // print(
                        //     'Compare list length ${box.length} box index ${box.keys.map((e) => e).toList()} box item ${box.values.map((e) => e).toList()}');
                        // Future.microtask(() => context
                        //     .read<CompareListCubit>()
                        //     .getCompareList(
                        //         true, box.values.map((e) => e).toList()));

                        Get.find<CompareController>().deleteAds(adModel.id);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Icon(
                          Icons.close,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
