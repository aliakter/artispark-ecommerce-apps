import 'dart:developer';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/constants.dart';
import '../controller/home_controller.dart';
import 'list_product_card.dart';

class HorizontalProductContainer extends StatelessWidget {
  const HorizontalProductContainer(
      {super.key,
      required this.adsModel,
      required this.title,
      required this.onPressed,
      required this.controller});

  final List<Ad> adsModel;
  final String title;
  final Function onPressed;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Visibility(
                visible: adsModel.isNotEmpty,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.carouselController.previousPage();
                      },
                      onTapDown: controller.onTapPreviousDown,
                      onTapUp: controller.onTapPreviousUp,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey.shade300),
                          color: controller.isPreviousTap.value
                              ? primaryColor
                              : Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: controller.isPreviousTap.value
                              ? Colors.white
                              : primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        controller.carouselController.nextPage();
                      },
                      onTapDown: controller.onTapNextDown,
                      onTapUp: controller.onTapNextUp,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey.shade300),
                          color: controller.isNextTap.value
                              ? primaryColor
                              : Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 18,
                          color: controller.isNextTap.value
                              ? Colors.white
                              : primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: LayoutBuilder(builder: (context, constraints) {
              if (adsModel.isEmpty) {
                return SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black54)),
                        child: const Text(
                          "No product found",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                );
              }
              return SizedBox(
                height: 220,
                child: CarouselSlider.builder(
                  carouselController: controller.carouselController,
                  itemCount: adsModel.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.adDetailsScreen,
                            arguments: adsModel[index].slug);
                      },
                      child: ListProductCard(
                        adsModel: adsModel[index],
                        logInUserId:
                            controller.loginController.userInfo?.user.id,
                        index: index, homeController: controller,
                        // form: 'details_page',
                      ),
                    );
                  },
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                    viewportFraction: 1.5,
                    height: 220,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
