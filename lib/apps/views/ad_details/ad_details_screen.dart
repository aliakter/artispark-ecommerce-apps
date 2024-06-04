import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/custom_bottom_sheet.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/ad_details/component/image_slider.dart';
import 'package:artispark/apps/views/ad_details/component/reviews.dart';
import 'package:artispark/apps/views/ad_details/controllers/ad_details_controller.dart';
import 'package:artispark/apps/views/home/component/horizontal_ad_container.dart';
import 'package:artispark/apps/views/home/component/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class AdDetailsScreen extends GetView<AdDetailsController> {
  const AdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
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
            : CustomScrollView(
                slivers: [
                  //IMAGE SLIDER
                  SliverPadding(
                    sliver: SliverToBoxAdapter(
                      child: controller
                              .adDetailsModel!.adDetails.galleries!.isNotEmpty
                          ? ImageSlider(
                              gallery: controller
                                      .adDetailsModel!.adDetails.galleries ??
                                  [],
                              //   height: MediaQuery.of(context).size.width * 0.8,
                              //   adDetails: state.adDetailsResponseModel.adDetails,
                            )
                          : SizedBox(
                              height: Get.height * 0.4,
                              width: Get.width,
                              child: CustomImage(
                                path: controller
                                    .adDetailsModel!.adDetails.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),

                  ///ADS DETAILS AND SHARE OPTIONS
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  offset: const Offset(0, 0),
                                  blurRadius: 3),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Visibility(
                                visible: controller
                                        .adDetailsModel!.adDetails.price !=
                                    0,
                                child: Text(
                                  "\$${controller.adDetailsModel!.adDetails.price}",
                                  // "\$${120}.00",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                controller.adDetailsModel!.adDetails.title,
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ),

                            Row(
                              children: [
                                Transform.rotate(
                                    angle: -5,
                                    child: const Icon(
                                      Icons.local_offer_outlined,
                                      size: 16,
                                      color: Colors.black54,
                                    )),
                                Text(
                                  "Category: ${controller.adDetailsModel!.adDetails.category.name}",
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),

                            ///Subcategory
                            // Row(
                            //   children: [
                            //     Transform.rotate(
                            //         angle: 0,
                            //         child: const Icon(
                            //           Icons.local_movies_outlined,
                            //           size: 14,
                            //           color: Colors.black54,
                            //         )),
                            //     Expanded(
                            //       child: SizedBox(
                            //         child: Text(
                            //           "Sub-Category: ${controller.adDetailsModel!.adDetails.subcategory?.name}",
                            //           style: GoogleFonts.lato(
                            //               fontSize: 14, color: Colors.black54),
                            //           maxLines: 1,overflow: TextOverflow.ellipsis,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            ///Location
                            // Row(
                            //   children: [
                            //     const Icon(
                            //       Icons.location_on,
                            //       size: 16,
                            //       color: Colors.black54,
                            //     ),
                            //     Text(
                            //       "Location: ${controller.adDetailsModel!.adDetails.city}",
                            //       style: GoogleFonts.lato(
                            //           fontSize: 14, color: Colors.black54),
                            //     ),
                            //   ],
                            // ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.post_add,
                                  size: 16,
                                  color: Colors.black54,
                                ),
                                Text(
                                  "Posted at: ${Utils.timeAgo1(controller.adDetailsModel!.adDetails.customer.createdAt)}",
                                  // "Posted at: 10-12-2020}",
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            ///Chat with seller button
                            SizedBox(
                              height: 48,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (controller.token.isEmpty) {
                                    Get.snackbar(
                                      'Login requires',
                                      "Please login",
                                      backgroundColor: Colors.grey.shade200,
                                      colorText: Colors.red,
                                      duration: const Duration(seconds: 1),
                                    );
                                  } else {
                                    if (controller.isMe(controller
                                        .adDetailsModel!
                                        .adDetails
                                        .customer
                                        .id)) {
                                      Utils.showSnackBar(context,
                                          "You can not message with yourself");
                                      return;
                                    } else {
                                      Get.toNamed(Routes.chatDetails,
                                          arguments: controller.adDetailsModel!
                                              .adDetails.customer.username);
                                    }
                                  }

                                  // } else {
                                  //   Utils.openSignInDialog(context);
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                                icon: const Icon(Icons.message, size: 18),
                                label: const Text(
                                  "Chat with seller",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            ///Buy Now button
                            SizedBox(
                              height: 48,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (controller.isMe(controller
                                      .adDetailsModel!.adDetails.customer.id)) {
                                    Get.snackbar(
                                      "Warning",
                                      "You can not buy your product",
                                      backgroundColor: Colors.grey.shade200,
                                      colorText: Colors.red,
                                      duration: const Duration(seconds: 1),
                                    );
                                    return;
                                  } else {
                                    if (controller.loginController.isLoggedIn) {
                                      Get.toNamed(Routes.checkout,
                                          arguments: controller.adDetailsModel);
                                    } else {
                                      Get.snackbar(
                                          'Login requires', "Please login",
                                          backgroundColor: Colors.grey.shade200,
                                          colorText: Colors.red,
                                          duration: const Duration(seconds: 1));
                                    }
                                  }

                                  // Get.to(CheckoutScreen());
                                  // if (controller.isMe(controller
                                  //     .adDetailsModel!
                                  //     .adDetails
                                  //     .customer
                                  //     .id)) {
                                  //   Utils.showSnackBar(context,
                                  //       "You can not message with yourself");
                                  //   return;
                                  // } else {
                                  //   Get.toNamed(Routes.chatDetails,
                                  //       arguments: controller.adDetailsModel!
                                  //           .adDetails.customer.username);
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                                icon: const Icon(Icons.shopping_cart, size: 18),
                                label: Text(
                                  "Buy Now",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            ///Phone button
                            // Visibility(
                            //   visible: controller
                            //       .adDetailsModel!.adDetails.showPhone &&
                            //       controller.adDetailsModel!.adDetails.phone
                            //           .isNotEmpty,
                            //   child: SizedBox(
                            //     height: 48,
                            //     child: ElevatedButton.icon(
                            //       onPressed: () {
                            //         // userData == null
                            //         //     ? Utils.openSignInDialog(context)
                            //         //     :
                            //         // phoneCall(
                            //         //     controller
                            //         //         .adDetailsModel!.adDetails.phone,
                            //         //     context);
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //           backgroundColor: primaryColor,
                            //           foregroundColor: Colors.white,
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //               BorderRadius.circular(2))),
                            //       icon: const Icon(
                            //         Icons.phone,
                            //         size: 18,
                            //       ),
                            //       label: Text(
                            //         controller.loginController.userInfo !=
                            //             null
                            //             ? controller
                            //             .adDetailsModel!.adDetails.phone
                            //             : "Login to View Phone",
                            //         style: TextStyle(fontSize: 14),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 12,
                            // ),
                            //
                            // ///Email button
                            // Visibility(
                            //   visible: controller.adDetailsModel!.adDetails
                            //       .showEmail ==
                            //       1 &&
                            //       controller.adDetailsModel!.adDetails.email
                            //           .isNotEmpty,
                            //   child: SizedBox(
                            //     height: 48,
                            //     child: ElevatedButton.icon(
                            //       onPressed: () {
                            //         // isClick = true;
                            //         // setState(() {
                            //         //
                            //         // });
                            //         // userData == null
                            //         //     ? Utils.openSignInDialog(context)
                            //         //     :
                            //         // sendEmail(
                            //         //     controller
                            //         //         .adDetailsModel!.adDetails.email,
                            //         //     context);
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //           backgroundColor: primaryColor,
                            //           foregroundColor: Colors.white,
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //               BorderRadius.circular(2))),
                            //       icon: const Icon(
                            //         Icons.email_outlined,
                            //         size: 20,
                            //       ),
                            //       label: SizedBox(
                            //         child: Text(
                            //           controller.loginController.userInfo !=
                            //               null
                            //               ? controller
                            //               .adDetailsModel!.adDetails.email
                            //               : "Login to View Email",
                            //           style: TextStyle(fontSize: 14),
                            //           maxLines: 1,
                            //           overflow: TextOverflow.ellipsis,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 12,
                            // ),
                            //
                            // ///Whatsapp button
                            // Visibility(
                            //   visible: true,
                            //   // visible:
                            //   // controller.adDetailsModel!.adDetails.showWhatsapp ==
                            //   //             '1' &&
                            //   //         controller.adDetailsModel!.adDetails.whatsapp
                            //   //             .isNotEmpty,
                            //   child: SizedBox(
                            //     height: 48,
                            //     child: ElevatedButton.icon(
                            //       onPressed: () {
                            //
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //           backgroundColor: primaryColor,
                            //           foregroundColor: Colors.white,
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //               BorderRadius.circular(2))),
                            //       icon: const Icon(
                            //         Icons.sms,
                            //         size: 20,
                            //       ),
                            //       label: Text("Buy Now",
                            //         style: const TextStyle(fontSize: 14),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            const Text(
                              "Share this ad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Share",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        '${RemoteUrls.rootUrl}ad/details/${controller.adDetailsModel!.adDetails.slug}',
                                        // '{RemoteUrls.rootUrl3}/ad/details/{controller.adDetailsModel!.adDetails.slug}',
                                        // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
                                        subject:
                                            'Click bellow the link to share Artispark product');
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/social/facebook.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        '${RemoteUrls.rootUrl}ad/details/${controller.adDetailsModel!.adDetails.slug}',
                                        // '{RemoteUrls.rootUrl3}/ad/details/{controller.adDetailsModel!.adDetails.slug}',
                                        // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
                                        subject:
                                            'Click bellow the link to share Artispark product');
                                  },
                                  child: const Image(
                                    image:
                                        AssetImage('assets/social/twitter.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        '${RemoteUrls.rootUrl}ad/details/${controller.adDetailsModel!.adDetails.slug}',
                                        // '{RemoteUrls.rootUrl3}/ad/details/{controller.adDetailsModel!.adDetails.slug}',
                                        // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
                                        subject:
                                            'Click bellow the link to share Artispark product');
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/social/linkedin.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        '${RemoteUrls.rootUrl}ad/details/${controller.adDetailsModel!.adDetails.slug}',
                                        // '{RemoteUrls.rootUrl3}/ad/details/{controller.adDetailsModel!.adDetails.slug}',
                                        // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
                                        subject:
                                            'Click bellow the link to share Artispark product');
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/social/pinterest.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        '${RemoteUrls.rootUrl}ad/details/${controller.adDetailsModel!.adDetails.slug}',
                                        // '{RemoteUrls.rootUrl3}/ad/details/{controller.adDetailsModel!.adDetails.slug}',
                                        // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
                                        subject:
                                            'Click bellow the link to share Artispark product');
                                  },
                                  child: const Image(
                                    image: AssetImage('assets/social/mail.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        '${RemoteUrls.rootUrl}ad/details/${controller.adDetailsModel!.adDetails.slug}',
                                        // '{RemoteUrls.rootUrl3}/ad/details/{controller.adDetailsModel!.adDetails.slug}',
                                        // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
                                        subject:
                                            'Click bellow the link to share Artispark product');
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/social/whatsapp.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///DESCRIPTION SECTION
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  offset: const Offset(0, 0),
                                  blurRadius: 3),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///
                            // Visibility(
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .authenticity !=
                            //       null,
                            //   child: Text(
                            //       "Authenticity: ${controller.adDetailsModel!.adDetails.authenticity}"),
                            // ),
                            // Visibility(
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.edition !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Edition: ${controller.adDetailsModel!.adDetails.edition}"),
                            //       // "Edition: 1st "),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.brand !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Brand: ${controller.adDetailsModel!.adDetails.brand}"),
                            //       // "Brand: saloon"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.model !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Models: ${controller.adDetailsModel!.adDetails.model}"),
                            //       // "Models: a1"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .yearOfManufacture !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Manufacture Year: ${controller.adDetailsModel!.adDetails.yearOfManufacture}"),
                            //       // "Manufacture Year: 2012"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .engineCapacity !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Engine Capacity: ${controller.adDetailsModel!.adDetails.engineCapacity} Cc"),
                            //       // "Engine Capacity: 125 Cc"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.fuelType !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       SizedBox(
                            //         child: Text(
                            //           "Fuel Type: ${controller.adDetailsModel!.adDetails.fuelType}",
                            //           // "Fuel Type: disel",
                            //           maxLines: 1,
                            //           overflow: TextOverflow.ellipsis,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .transmission !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Transmission: ${controller.adDetailsModel!.adDetails.transmission}"),
                            //       // "Transmission: manual"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.bodyType !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Body Type: ${controller.adDetailsModel!.adDetails.bodyType}"),
                            //       // "Body Type: Saloon"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.condition !=
                            //       "",
                            //   // visible: true,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Condition: ${controller.adDetailsModel!.adDetails.condition}"),
                            //       // "Condition: Used"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: controller.adDetailsModel!.adDetails. !=null,
                            //   visible: true,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           // "Textbook Type: ${controller.adDetailsModel!.adDetails.textbookType}"),
                            //           "Textbook Type: new"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .registrationYear !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Registration Year: ${controller.adDetailsModel!.adDetails.registrationYear}"),
                            //       // "Registration Year: 2020"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .designation !=
                            //       null,
                            //   // visible: true,
                            //   child: Column(
                            //     children: [
                            //       const SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Designation: ${controller.adDetailsModel!.adDetails.designation}"),
                            //       // "Designation: App Developer"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.experience !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       const SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Experience Year: ${controller.adDetailsModel!.adDetails.experience}"),
                            //       // "Experience Year: 2022"),
                            //     ],
                            //   ),
                            // ),
                            // // Visibility(
                            // //   visible: controller.adDetailsModel!.adDetails.type != null,
                            // //   // visible: true,
                            // //   child: Column(
                            // //     children: [
                            // //       SizedBox(
                            // //         height: 5,
                            // //       ),
                            // //       Text(
                            // //         // "Type: ${controller.adDetailsModel!.adDetails.jobType}"),
                            // //           "Type: used"),
                            // //     ],
                            // //   ),
                            // // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.educations !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       const SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Employment Type: ${controller.adDetailsModel!.adDetails.educations}"),
                            //       // "Employment Type: Fresher"),
                            //     ],
                            //   ),
                            // ),
                            // // Visibility(
                            // //   // visible: true,
                            // //   visible: controller
                            // //           .adDetailsModel!.adDetails.deadline !=
                            // //       null,
                            // //   child: Column(
                            // //     children: [
                            // //       const SizedBox(
                            // //         height: 5,
                            // //       ),
                            // //       controller.adDetailsModel!.adDetails
                            // //                   .deadline !=
                            // //               null
                            // //           ? Text(DateFormat.yMMMMd().format(
                            // //               DateTime.parse(
                            // //                   "${controller.adDetailsModel!.adDetails.deadline}")))
                            // //           : Text(
                            // //               "${controller.adDetailsModel!.adDetails.deadline}"),
                            // //       // Text("2023-10-10"),
                            // //     ],
                            // //   ),
                            // // ),
                            // Visibility(
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .employerName !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Employer Name: ${controller.adDetailsModel!.adDetails.employerName}"),
                            //       // Text("Employer Name: Test"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller.adDetailsModel!.adDetails
                            //           .propertyType !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       const SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "${controller.adDetailsModel!.adDetails.propertyType}"),
                            //     ],
                            //   ),
                            // ),
                            // Visibility(
                            //   // visible: true,
                            //   visible: controller
                            //           .adDetailsModel!.adDetails.sizeType !=
                            //       null,
                            //   child: Column(
                            //     children: [
                            //       const SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //           "Property Size: ${controller.adDetailsModel!.adDetails.size} ${controller.adDetailsModel!.adDetails.sizeType}"),
                            //       // Text("Property Size: 120sqf"),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // Visibility(
                            //   visible: true,
                            //   // visible: controller.adDetailsModel!.adDetails.website.isNotEmpty,
                            //   child: Row(
                            //     children: [
                            //       const Text("Website: "),
                            //       GestureDetector(
                            //         onTap: () {
                            //           // urlLaunch(state
                            //           //     .adDetailsResponseModel.adDetails.website);
                            //         },
                            //         child: const Text(
                            //           "View Site",
                            //           style: TextStyle(color: Colors.blue),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            ///
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Description",
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Html(
                                data: controller
                                    .adDetailsModel!.adDetails.description),
                            // Text(controller
                            //     .adDetailsModel!.adDetails.description),
                            // const Text("Description"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///SELLER INFORMATION'S SECTION
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  offset: const Offset(0, 0),
                                  blurRadius: 3),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Seller information",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade300,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CustomImage(
                                    // path: "",
                                    path: controller.adDetailsModel!.adDetails
                                                .customer.imageUrl !=
                                            ''
                                        ? controller.adDetailsModel!.adDetails
                                            .customer.imageUrl
                                        : null,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                controller
                                    .adDetailsModel!.adDetails.customer.name,
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    // initialRating: double.parse(
                                    //     "${controller.adDetailsModel!.adDetails.customer.averageReview}"),
                                    ignoreGestures: true,
                                    initialRating: double.parse(controller
                                        .adDetailsModel!
                                        .adDetails
                                        .averageRating),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding:
                                        const EdgeInsets.only(right: 2),
                                    itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: primaryColor),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "(${controller.adDetailsModel!.adDetails.reviews.length}) ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text("Reviews"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Joined "),
                                  Text(
                                      DateFormat.yMMMMd().format(controller
                                          .adDetailsModel!
                                          .adDetails
                                          .customer
                                          .createdAt),
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Total Listed Ads "),
                                  Text(
                                      controller.adDetailsModel!.adDetails
                                          .customer.totalUserProducts,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.publicProfile,
                                        arguments: controller.adDetailsModel!
                                                .adDetails.customer.username ??
                                            "");
                                  },
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(2)),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Member shop",
                                      maxLines: 1,
                                      // overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.adDetailsModel!.adDetails
                                                .isUserPurchased ==
                                            true
                                        ?
                                    controller.adDetailsModel!.adDetails.isUserReviewed == false ? customBottomSheet(
                                            context,
                                            CustomBottomSheet(
                                                controller: controller,
                                                productId: controller
                                                    .adDetailsModel!
                                                    .adDetails
                                                    .id)) : Get.snackbar("Warning", "Your feedback is already taken")
                                        : (Get.snackbar("Please Purchase", "Purchase your product first"));
                                  },
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(2)),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Give Us Feedback",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            controller.adDetailsModel!.adDetails.reviews.isEmpty
                                ? const Text('No Reviews')
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.adDetailsModel!
                                        .adDetails.reviews.length,
                                    itemBuilder: (context, index) {
                                      return Reviews(
                                          customer: controller.adDetailsModel!
                                              .adDetails.reviews[index]);
                                    })
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///RELATED ADS SECTION
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    sliver: SliverToBoxAdapter(
                      child: HorizontalProductContainer(
                        adsModel: controller.adDetailsModel!.relatedAds,
                        title: "Recommended ads for you",
                        onPressed: () {},
                        controller: controller.homeController,
                        // from: 'details_page',
                      ),
                    ),
                  ),

                  //.......... Related Ads horizontal ..........
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(vertical: 16),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white.withAlpha(950),
                  //         borderRadius: BorderRadius.circular(16),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //               offset: Offset(5,5),
                  //               blurRadius: 3,
                  //               color: ashColor,
                  //               blurStyle: BlurStyle.inner
                  //           )
                  //         ]
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 16.0),
                  //           child: Text("Related Ads",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  //         ),
                  //         const SizedBox(
                  //           height: 16,
                  //         ),
                  //         SingleChildScrollView(
                  //           scrollDirection: Axis.horizontal,
                  //           padding: const EdgeInsets.symmetric(horizontal: 16),
                  //           child: Row(
                  //             mainAxisSize: MainAxisSize.min,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               ConstrainedBox(
                  //                 constraints: BoxConstraints(
                  //                   // maxHeight: MediaQuery.of(context).size.width * 1.2,
                  //                   maxHeight: 430,
                  //                   minHeight: MediaQuery.of(context).size.width * 0.8,
                  //                 ),
                  //                 child: ListView.separated(
                  //                   clipBehavior: Clip.none,
                  //                   addAutomaticKeepAlives: true,
                  //                   shrinkWrap: true,
                  //                   // padding: const EdgeInsets.symmetric(horizontal: 16),
                  //                   addRepaintBoundaries: true,
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemBuilder: (context,index){
                  //                     // return ListProductCard(productModel: products[index],width: MediaQuery.of(context).size.width * 0.9,);
                  //                     return SizedBox();
                  //                   },
                  //                   itemCount: products.length,
                  //                   separatorBuilder: (BuildContext context, int index) {
                  //                     return const SizedBox(
                  //                       width: 16,
                  //                     );
                  //                   },
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void customBottomSheet(context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return widget;
      },
    );
  }

// phoneCall(phoneNumber, context) async {
//   if (phoneNumber.toString().isNotEmpty) {
//     final url = Uri.parse('tel:${phoneNumber.trim()}');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(
//         url,
//         // webViewConfiguration: const WebViewConfiguration(
//         //   enableJavaScript: true,
//         //   enableDomStorage: true,
//         // ),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('No phone number found')));
//   }
// }
//
// sendEmail(email, context) async {
//   if (email.toString().isNotEmpty) {
//     final url = Uri.parse('mailto:$email');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(
//         url,
//         webViewConfiguration: const WebViewConfiguration(
//           enableJavaScript: true,
//           enableDomStorage: true,
//         ),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('No Email has found')));
//   }
// }
//
// Future<void> sendWhatsappMessage(url, context) async {
//   print(url);
//   try {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url),
//           webViewConfiguration: const WebViewConfiguration(
//             enableJavaScript: true,
//             enableDomStorage: true,
//           ),
//           mode: LaunchMode.externalApplication);
//     }
//   } on Exception {
//     print('WhatsApp is not installed');
//     // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No Whatsapp Number has found')));
//   }
// }
//
// ///Launch url
// Future<void> urlLaunch(url) async {
//   print(url);
//   await launchUrl(Uri.parse(url),
//       webViewConfiguration: const WebViewConfiguration(
//         enableJavaScript: true,
//         enableDomStorage: true,
//       ),
//       mode: LaunchMode.externalApplication);
// }
}
