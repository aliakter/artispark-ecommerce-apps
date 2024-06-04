import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/home/component/product_card.dart';
import 'package:artispark/apps/views/home/component/shimmer_list.dart';
import 'package:artispark/apps/views/public_profile/component/saller_info.dart';
import 'package:artispark/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../core/utils/utils.dart';

class PublicProfileScreen extends StatelessWidget {
  const PublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicProfileController>(builder: (controller) {
      return Scaffold(
          backgroundColor: const Color(0xFFF6F7FE),
          appBar: AppBar(
            title: const Text('Public Profile'),
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
          body: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: ShimmerList(),
                  )
                : RefreshIndicator(
                    onRefresh: () => Future.delayed(
                      const Duration(seconds: 1),
                      () => controller.getPublicProfile(),
                    ),
                    child: CustomScrollView(
                      slivers: [
                        ///SELLER INFO SECTION
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          sliver: SliverToBoxAdapter(
                            child: SellerInfo(
                                profile: controller.publicProfileModel!),
                          ),
                        ),

                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              children: [
                                ///BUTTONS SECTIONS
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.changeBtnOne();
                                          },
                                          child: Container(
                                            height: 48,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: controller.shopSelect.value
                                                  ? primaryColor
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              // border: Border.all(color: Colors.grey.shade300),
                                            ),
                                            child: Text('Shop',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: controller
                                                          .shopSelect.value
                                                      ? Colors.white
                                                      : Colors.black,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.changeBtnTwo();
                                          },
                                          child: Container(
                                            height: 48,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: controller
                                                      .sellerReviewSelect.value
                                                  ? primaryColor
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              // border: Border.all(color: Colors.grey.shade300),
                                            ),
                                            child: Text('Seller Review',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: controller
                                                          .sellerReviewSelect
                                                          .value
                                                      ? Colors.white
                                                      : Colors.black,
                                                )),
                                          ),
                                        ),
                                      ),
                                      /*bloc.isMe(state.data.user.id) ? const SizedBox() :*/

                                      /// write review
                                      // Expanded(
                                      //   child: GestureDetector(
                                      //     onTap: () {
                                      //       controller.changeBtnThree();
                                      //     },
                                      //     child: Container(
                                      //       height: 48,
                                      //       alignment: Alignment.center,
                                      //       decoration: BoxDecoration(
                                      //         color: controller
                                      //                 .writeReviewSelect.value
                                      //             ? primaryColor
                                      //             : Colors.transparent,
                                      //         borderRadius:
                                      //             BorderRadius.circular(30),
                                      //         // border: Border.all(color: Colors.grey.shade300),
                                      //       ),
                                      //       child: Text(
                                      //         'Write Review',
                                      //         style: TextStyle(
                                      //           fontSize: 12,
                                      //           fontWeight: FontWeight.bold,
                                      //           color: controller
                                      //                   .writeReviewSelect.value
                                      //               ? Colors.white
                                      //               : Colors.black,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                LayoutBuilder(
                                  builder: (p0, p1) {
                                    if (controller.shopSelect.value) {
                                      return controller.publicProfileModel
                                                      ?.recentAds !=
                                                  null ||
                                              controller.publicProfileModel
                                                      ?.recentAds !=
                                                  [] ||
                                              controller.publicProfileModel!
                                                  .recentAds.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.publicProfileModel?.recentAds.length} Item Available Listings",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                // Container(
                                                //   padding: const EdgeInsets
                                                //       .symmetric(
                                                //       vertical: 10,
                                                //       horizontal: 20),
                                                //   decoration: BoxDecoration(
                                                //       color: Colors.white,
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               5),
                                                //       boxShadow: [
                                                //         BoxShadow(
                                                //             color: Colors.grey
                                                //                 .withOpacity(
                                                //                     0.4),
                                                //             offset:
                                                //                 const Offset(
                                                //                     0, 0),
                                                //             blurRadius: 3),
                                                //       ]),
                                                //   child: Column(
                                                //     children: [
                                                //       Text(
                                                //         "${controller.publicProfileModel!.recentAds.length} Item Available Listings",
                                                //         style: const TextStyle(
                                                //           fontWeight:
                                                //               FontWeight.w600,
                                                //         ),
                                                //       ),
                                                //       const SizedBox(
                                                //         height: 10,
                                                //       ),
                                                //       // Row(
                                                //       //
                                                //       //   children: [
                                                //       //     const Text(
                                                //       //       "Sort By: ",
                                                //       //       style: TextStyle(
                                                //       //           fontWeight:
                                                //       //               FontWeight
                                                //       //                   .w600),
                                                //       //     ),
                                                //       //     const SizedBox(
                                                //       //       width: 10,
                                                //       //     ),
                                                //       //     Expanded(
                                                //       //       child: Container(
                                                //       //         height: 40,
                                                //       //         padding:
                                                //       //             const EdgeInsets
                                                //       //                 .symmetric(
                                                //       //           horizontal: 5,
                                                //       //         ),
                                                //       //         decoration: BoxDecoration(
                                                //       //             border: Border.all(
                                                //       //                 color: Colors
                                                //       //                     .grey
                                                //       //                     .shade400),
                                                //       //             borderRadius:
                                                //       //                 BorderRadius
                                                //       //                     .circular(
                                                //       //                         8)),
                                                //       //         child:
                                                //       //             DropdownButtonHideUnderline(
                                                //       //           child:
                                                //       //               DropdownButton<
                                                //       //                   String>(
                                                //       //             hint:
                                                //       //                 const Text(
                                                //       //               'Sort By',
                                                //       //               style:
                                                //       //                   TextStyle(
                                                //       //                 color: Colors
                                                //       //                     .black,
                                                //       //               ),
                                                //       //             ),
                                                //       //             isDense: true,
                                                //       //             isExpanded:
                                                //       //                 true,
                                                //       //             onChanged:
                                                //       //                 (dynamic
                                                //       //                     value) {
                                                //       //               controller
                                                //       //                       .selectedValue =
                                                //       //                   value;
                                                //       //               // bloc.getPublicProfile(widget.username, selectedValue);
                                                //       //               // print(selectedValue);
                                                //       //               // setState(() {});
                                                //       //             },
                                                //       //             value: controller
                                                //       //                 .selectedValue,
                                                //       //             items: myItemSortListData
                                                //       //                 .map(
                                                //       //                     (location) {
                                                //       //               return DropdownMenuItem<
                                                //       //                   String>(
                                                //       //                 value: location[
                                                //       //                     'value'],
                                                //       //                 child: Text(
                                                //       //                     "${location['name']}"),
                                                //       //               );
                                                //       //             }).toList(),
                                                //       //           ),
                                                //       //         ),
                                                //       //       ),
                                                //       //     ),
                                                //       //   ],
                                                //       // )
                                                //     ],
                                                //   ),
                                                // ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  child: GridView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 8,
                                                      mainAxisSpacing: 8,
                                                      mainAxisExtent: 250,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ProductCard(
                                                        isPublicProfile: true,
                                                        adModel: controller
                                                            .publicProfileModel
                                                            ?.recentAds[index],
                                                        from: 'Public Shop',
                                                        myId: controller
                                                            .publicProfileModel
                                                            ?.user
                                                            .id,
                                                        sellerId: controller
                                                            .publicProfileModel
                                                            ?.recentAds[index]
                                                            .customer!
                                                            .id,
                                                        logInUserId: controller
                                                            .loginController
                                                            .userInfo
                                                            ?.user
                                                            .id,
                                                        homeController:
                                                            controller
                                                                .homeController,
                                                      );
                                                    },
                                                    itemCount: controller
                                                        .publicProfileModel
                                                        ?.recentAds
                                                        .length,
                                                  ),
                                                )
                                              ],
                                            )
                                          : SizedBox(
                                              height: 100,
                                              width: double.infinity,
                                              child: Center(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16,
                                                    vertical: 8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      6,
                                                    ),
                                                    border: Border.all(
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'No Ads Found',
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                    }

                                    if (controller.sellerReviewSelect.value) {
                                      if (controller.publicProfileModel!.reviews
                                          .isNotEmpty) {
                                        return SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .shade300,
                                                            child: const Icon(
                                                              Icons.image,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .publicProfileModel!
                                                                    .reviews[
                                                                        index]
                                                                    .user
                                                                    .username,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              RatingBarIndicator(
                                                                rating: double
                                                                    .parse(
                                                                        "${controller.publicProfileModel!.reviews[index].stars}"),
                                                                itemBuilder: (context,
                                                                        index) =>
                                                                    const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                itemCount: 5,
                                                                itemSize: 25.0,
                                                                direction: Axis
                                                                    .horizontal,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      Text(
                                                        controller
                                                            .publicProfileModel!
                                                            .reviews[index]
                                                            .comment,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              itemCount: controller
                                                  .publicProfileModel!
                                                  .reviews
                                                  .length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                  height: 10,
                                                );
                                              },
                                            ));
                                      } else {
                                        return SizedBox(
                                          height: 100,
                                          width: double.infinity,
                                          child: Center(
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                        color: Colors.black54)),
                                                child: const Text(
                                                  'No Review Found',
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ),
                                        );
                                      }
                                    }

                                    if (controller.writeReviewSelect.value) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  controller.ratings.value,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemSize: 20,
                                              itemPadding:
                                                  const EdgeInsets.only(
                                                      right: 2),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star_border,
                                                color: Color(0xffF0A732),
                                                // size: 5,
                                              ),
                                              onRatingUpdate: (rating) {
                                                controller.ratingChange(rating);
                                                print(rating);
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    hintText: "Write Review"),
                                                controller:
                                                    controller.reviewController,
                                                maxLines: 5,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 45,
                                              width: 120,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  if (controller.ratings.value >
                                                          0 &&
                                                      controller
                                                              .reviewController
                                                              .text !=
                                                          '') {
                                                    controller.setRating();
                                                  } else {
                                                    Utils.showSnackBar(context,
                                                        "Give Rating and write review");
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    backgroundColor:
                                                        primaryColor,
                                                    foregroundColor:
                                                        Colors.white),
                                                child: Text("Save"),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                    return Container();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ));
    });
  }
}
