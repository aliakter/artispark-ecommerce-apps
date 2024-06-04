import 'dart:math' as math;

import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/my_ads/controller/my_ads_controller.dart';
import 'package:artispark/apps/views/my_ads/model/user_ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerAdListCard extends StatefulWidget {
  final Datum adModel;
  final MyAdsController myAdsController;

  // final Function deleteAd;
  const CustomerAdListCard({
    Key? key,
    required this.adModel,
    required this.myAdsController,
    // required this.deleteAd,
  }) : super(key: key);

  @override
  State<CustomerAdListCard> createState() => _CustomerAdListCardState();
}

class _CustomerAdListCardState extends State<CustomerAdListCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.adDetailsScreen, arguments: widget.adModel.slug);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImage(),
                const SizedBox(height: 0),
                _buildContent(context),
              ],
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  Widget _buildContent(context) {
    return Container(
      width: Get.width / 1.2,
      // padding: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.fromBorderSide(
              BorderSide(color: Color(0xffd5d2d2), width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                const Icon(Icons.layers_outlined, color: Colors.grey, size: 20),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.adModel.category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                ),
                // Text('${productModel.rating}'),
              ],
            ),
          ),
          const SizedBox(height: 6),
          //Post Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    widget.adModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: paragraphColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          //Active status and date
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: widget.adModel.status == "active" ? const Color(0xFF198754) : widget.adModel.status == "sold" ? const Color(0xFF0DCAF0) : const Color(0xFFFFC107),
                    color: const Color(0xFF198754),
                  ),
                  child: Text(
                    widget.adModel.status,
                    style: const TextStyle(
                      // color: widget.adModel.status == "active" ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                      color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  // Utils.dateFormat("${widget.adModel.createdAt}"),
                  Utils.dateFormat("${DateTime.now()}"),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          const Divider(
            color: Color(0xffd5d2d2),
          ),

          //Price and Edit delete option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  // visible:  widget.adModel.price != 0,
                  visible: true,
                  child: Text(
                    '\$ ${widget.adModel.price}',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 5),
                  child: Row(
                    children: [
                      Visibility(
                        // visible: widget.adModel.featured != "1",
                        visible: false,
                        child: GestureDetector(
                          onTap: () {
                            print('Promoted ads');
                            // showPromoteDialog(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFF198754)),
                              child: Icon(
                                Icons.link_sharp,
                                color: Colors.white,
                                size: 15,
                              )
                              // child: const FaIcon(
                              //   FontAwesomeIcons.moneyBill,
                              //   color: Colors.white,
                              //   size: 15,
                              // ),
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.adsEdit,
                              arguments: widget.adModel.id.toString());
                          // Navigator.pushNamed(context, RouteNames.adEditScreen,
                          //     arguments: widget.adModel);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF198754)),
                          // child: Text('${adModel.galleries.length}'),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Utils.showCustomDialog(context,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                height: 150,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Are you sure?",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Do you want to delete this product?",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor: primaryColor),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        Obx(() => widget.myAdsController
                                                .isDeleteLoading.value
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: primaryColor),
                                              )
                                            : TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        primaryColor),
                                                onPressed: () async {
                                                  widget.myAdsController
                                                      .deleteAds(widget
                                                          .adModel.id
                                                          .toString());
                                                },
                                                child: Text("Ok"),
                                              )),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 200,
      width: Get.width / 1.2,
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              width: 120,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              child: CustomImage(
                width: 120,
                fit: BoxFit.cover,
                path: "${RemoteUrls.rootUrl}${widget.adModel.thumbnail}",
                // path: widget.adModel.thumbnail != ''
                //     ? '${RemoteUrls.rootUrl3}${widget.adModel.thumbnail}'
                //     : null,
              ),
            ),
          ),
          Visibility(
            visible: widget.adModel.featured == "1",
            child: Positioned(
              top: 17,
              left: -6,
              child: Transform.rotate(
                angle: -math.pi / 4.1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xFF2DBE6C),
                      borderRadius: BorderRadius.circular(6)
                      // borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                      ),
                  child: Text(
                    "Featured",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

// void showPromoteDialog(context) {
//   showModalBottomSheet(context: context, isDismissible: true, builder: (context) {
//     return StatefulBuilder(
//       builder: (context, setState) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           height: MediaQuery.of(context).size.height * 0.4,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: IconButton(onPressed: () => Navigator.pop(context),icon: const Icon(Icons.close,size: 25,)),
//               ),
//               Row(
//                 children: const [
//                   Text('Promotion Package ',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),),
//                   Text('*',style: TextStyle(color: Colors.red, fontSize: 14,fontWeight: FontWeight.bold),)
//                 ],
//               ),
//               const SizedBox(height: 15),
//
//               DropdownButtonFormField(
//                 isExpanded: true,
//                 decoration: const InputDecoration(
//                   hintText: "Select Plan",
//                 ),
//                 items:
//                 customerAdsBloc.pricingList.map<DropdownMenuItem<PricingModel>>((e) {
//                   return DropdownMenuItem(
//                     value: e,
//                     child: Text("${e.title} for R${e.price}.00"),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     customerAdsBloc.id = value!.id;
//                     customerAdsBloc.price = value.price;
//                     customerAdsBloc.title = value.title;
//                   });
//                 },
//               ),
//
//               const SizedBox(height: 20),
//
//               SizedBox(
//                 height: 45,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
//                   onPressed: (){
//                     if(customerAdsBloc.price.isNotEmpty) {
//                       print("Redirect in payment screen");
//                       Navigator.pushNamed(context, RouteNames.planDetailsScreen, arguments: PlanDetailsScreenArguments(widget.adModel, customerAdsBloc.id, customerAdsBloc.title, customerAdsBloc.price)).then((value){
//                         Navigator.pop(context);
//                       });
//                     }else{
//                       Navigator.pop(context);
//                       Utils.showSnackBar(context, "Select Your Plan");
//                     }
//                     // Navigator.pushNamed(context, RouteNames.privacyPolicyScreen);
//                   },
//                   child: const Text('Promote',style: TextStyle(color: Colors.white),),
//                 ),
//               ),
//             ],
//           ),);
//       },
//     );
//   },).then((value){
//     setState(() {
//       customerAdsBloc.price = '';
//     });
//   });
// }
}
