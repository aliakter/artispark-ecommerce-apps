import 'dart:math' as math;
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/compare_button.dart';
import 'package:artispark/apps/global_widget/favorite_button.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/dashboard/component/collaborate_products.dart';
import 'package:artispark/apps/views/story/component/story_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/custom_image.dart';
import '../../global_widget/custom_text_feild.dart';
import 'component/grid_product_container.dart';
import 'component/home_screen_shinner_widget.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(Get.find(), Get.find(), Get.find()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F7FE),
          appBar: AppBar(
            centerTitle: true,
            title: const Padding(
              padding: EdgeInsets.only(left: 3),
              child: Text(
                "ArtiSpark",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          body: Obx(
            () => controller.isLoading.value
                ? const SingleChildScrollView(child: HomeScreenShimmerWidget())
                : RefreshIndicator(
                    onRefresh: () => Future.delayed(
                      const Duration(seconds: 1),
                      () => controller.getHomeData(),
                    ),
                    child: CustomScrollView(
                      controller: controller.scrollController2,
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        /// SEARCH, FILTER FILED
                        SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 14, bottom: 14),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: const BoxDecoration(
                              color: Color(0XFFF7E7F3),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 8),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  ///Search text filed
                                  Expanded(
                                    flex: 2,
                                    child: CustomTextField(
                                      isObsecure: false,
                                      controller: controller.searchController,
                                      enabled: true,
                                      hintext: "What are you looking for?",
                                    ),
                                  ),

                                  /// Select City
                                  // Container(
                                  //   color: Colors.white,
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 18),
                                  //   height: 48,
                                  //   child: DropdownButtonHideUnderline(
                                  //     child: DropdownButton<String>(
                                  //       hint: const Text('Entire city',
                                  //           style:
                                  //               TextStyle(color: Colors.black)),
                                  //       isDense: true,
                                  //       isExpanded: true,
                                  //       onChanged: (dynamic value) {
                                  //         // selectedCity = value;
                                  //         // print(selectedCity);
                                  //         // setState(() {
                                  //         //
                                  //         // });
                                  //       },
                                  //       // value: selectedCity,
                                  //       items: controller.stateList
                                  //           .map((location) {
                                  //         return DropdownMenuItem<String>(
                                  //           value: location,
                                  //           child: Text("${location}"),
                                  //         );
                                  //       }).toList(),
                                  //     ),
                                  //   ),
                                  // ),

                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (controller
                                                  .searchController.text !=
                                              "") {
                                            Get.toNamed(Routes.adsScreen,
                                                arguments: [
                                                  "",
                                                  controller
                                                      .searchController.text,
                                                  controller.categoryList.value
                                                ]);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.zero),
                                            backgroundColor: primaryColor),
                                        child: const Text("Find it"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///stories
                        SliverToBoxAdapter(
                          child: Center(
                            child: Column(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "Latest",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(text: " "),
                                      TextSpan(
                                          text: "Stories",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  margin: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: const Column(
                                    children: [
                                      Divider(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 40.0,
                                  child:
                                      Divider(height: 6, color: Colors.black),
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 150,
                            child: Obx(() => controller.storyList.isNotEmpty
                                ? ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.storyList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(StoryDetails(
                                            homeController: controller,
                                            id: controller.storyList[index].id
                                                .toString(),
                                            form: 'home',
                                          ));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  // colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.65), BlendMode.dstATop),
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.transparent
                                                          .withOpacity(0.7),
                                                      BlendMode.dstATop),
                                                  image: NetworkImage(
                                                      "${RemoteUrls.rootUrl}${controller.storyList[index].image}"),
                                                  fit: BoxFit.cover)),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5, left: 5),
                                              child: Text(
                                                "${controller.storyList[index].title}",
                                                style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 10);
                                    },
                                  )
                                : const Center(child: Text("Story not found"))),
                          ),
                        ),

                        ///Collaborate product
                        SliverToBoxAdapter(
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: "Collaborate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(text: " "),
                                      TextSpan(
                                          text: "Products",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  margin: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: const Column(
                                    children: [
                                      Divider(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 40.0,
                                  child: Divider(
                                    height: 6,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 250,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  controller.homeModel!.colobarates.length,
                              itemBuilder: (context, index) {
                                return CollaborateProducts(
                                    colobarate: controller
                                        .homeModel!.colobarates[index],
                                    logInUserId: controller
                                        .loginController.userInfo?.user.id,
                                    index: index,
                                    controller: controller);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 20);
                              },
                            ),
                          ),
                        ),

                        ///Category Section
                        SliverToBoxAdapter(
                          child: Visibility(
                            visible: true,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),

                                ///TITLE
                                Center(
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: "Browse",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(text: " "),
                                            TextSpan(
                                                text: "Categories",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: primaryColor,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 70.0,
                                        margin: const EdgeInsets.fromLTRB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: const Column(
                                          children: [
                                            Divider(
                                              height: 1,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40.0,
                                        child: Divider(
                                          height: 6,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 10)
                                    ],
                                  ),
                                ),

                                ///Category cards
                                Container(
                                  // color: Colors.red,
                                  // margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                  // height: MediaQuery.of(context).size.height * 0.6,
                                  alignment: Alignment.center,
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 0,
                                            childAspectRatio: 1.5),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.homeModel?.categories.length,
                                    // itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.adsScreen,
                                              arguments: [
                                                controller.homeModel
                                                    ?.categories[index].slug
                                                    .toString(),
                                                "",
                                                controller.categoryList.value
                                              ]);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: CustomImage(
                                                    path:
                                                        "${RemoteUrls.rootUrl}${controller.homeModel?.categories[index].image}",
                                                    fit: BoxFit.cover,
                                                    height: Get.height,
                                                    width: Get.width,
                                                  ),
                                                ),
                                              ),
                                              // const SizedBox(height: 5),
                                              SizedBox(
                                                child: Text(
                                                  "${controller.homeModel?.categories[index].name}",
                                                  // state.homeModel.categories[index]
                                                  //     .name,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Feature section
                        SliverToBoxAdapter(
                          child: Visibility(
                            visible: true,
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "Featured",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: 'Products',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                                fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70.0,
                                    margin: const EdgeInsets.fromLTRB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: const Column(
                                      children: [
                                        Divider(
                                          height: 1,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40.0,
                                    child: Divider(
                                      height: 6,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///Feature AD SECTION
                        SliverToBoxAdapter(
                          child: Container(
                            height: 220,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.adDetailsScreen,
                                          arguments: controller.homeModel
                                              ?.featureAds[index].slug);
                                    },
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey.shade400)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                                // border: Border(bottom: BorderSide(color: borderColor)),
                                              ),
                                              height: 130,
                                              child: Stack(
                                                fit: StackFit.expand,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    child: CustomImage(
                                                        path:
                                                            "${RemoteUrls.rootUrl}${controller.homeModel?.featureAds[index].thumbnail}",
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
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 2),
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xFF2DBE6C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)
                                                              // borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                                              ),
                                                          child: const Text(
                                                            'Featured',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Visibility(
                                                    visible: controller
                                                            .homeModel
                                                            ?.featureAds[index]
                                                            .price !=
                                                        null,
                                                    child: Text(
                                                      "\$${controller.homeModel?.featureAds[index].price}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  SizedBox(
                                                    child: Text(
                                                      "${controller.homeModel?.featureAds[index].title}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          color: blackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 15,
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .shade300,
                                                            child:
                                                                CompareButton(
                                                              productId: controller
                                                                  .homeModel!
                                                                  .featureAds[
                                                                      index]
                                                                  .id
                                                                  .toInt(),
                                                              adsUserId: controller
                                                                  .homeModel
                                                                  ?.featureAds[
                                                                      index]
                                                                  .customer!
                                                                  .id,
                                                              logInUserId:
                                                                  controller
                                                                      .loginController
                                                                      .userInfo
                                                                      ?.user
                                                                      .id,
                                                              index: index,
                                                              homeController:
                                                                  controller,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 2),
                                                          CircleAvatar(
                                                            radius: 15,
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .shade200,
                                                            child:
                                                                FavoriteButton(
                                                              productId: controller
                                                                  .homeModel!
                                                                  .featureAds[
                                                                      index]
                                                                  .id
                                                                  .toInt(),
                                                              isFav: controller
                                                                  .homeModel!
                                                                  .featureAds[
                                                                      index]
                                                                  .isWishlist,
                                                              // isFav: false,
                                                              adsUserId: controller
                                                                  .homeModel
                                                                  ?.featureAds[
                                                                      index]
                                                                  .customer!
                                                                  .id,
                                                              controller:
                                                                  controller,
                                                              logInUserId:
                                                                  controller
                                                                      .loginController
                                                                      .userInfo
                                                                      ?.user
                                                                      .id,
                                                              from: "",
                                                            ),
                                                          )
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
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 20);
                                },
                                itemCount:
                                    controller.homeModel!.featureAds.length),
                          ),
                        ),

                        ///LATEST AD SECTION
                        const SliverToBoxAdapter(child: SizedBox(height: 15)),

                        SliverToBoxAdapter(
                          child: Visibility(
                            visible: true,
                            child: Center(
                              child: Column(
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      text: "Latest",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(text: " "),
                                        TextSpan(
                                          text: "Products",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0.0, 5.0, 0.0, 0.0),
                                    width: 70.0,
                                    child: const Divider(
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40.0,
                                    child: Divider(
                                      height: 6,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///Latest Ad Section
                        GridProductContainer(
                          adModelList: controller.homeModel!.latestAds,
                          title: "",
                          onPressed: () {}, homeController: controller,
                          // from: "home"
                        ),

                        const SliverToBoxAdapter(child: SizedBox(height: 70)),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
