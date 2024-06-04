import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/k_images.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/custom_text_feild.dart';
import 'package:artispark/apps/views/ad_details/model/ad_details_model.dart';
import 'package:artispark/apps/views/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({super.key});

  // final AdDetailsModel adDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(color: Colors.white)),
        // backgroundColor: Colors.transparent,
        // leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.width / 3,
                    width: Get.width / 3,
                    margin: EdgeInsets.only(right: Get.width / 20),
                    child: CustomImage(
                      path: "${controller.adDetailsModel?.adDetails.imageUrl}",
                    ),
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: NetworkImage("${controller.adDetailsModel?.adDetails.imageUrl}"),
                    //         fit: BoxFit.cover),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: Get.width / 1.9,
                          child: Text(
                            "${controller.adDetailsModel?.adDetails.title}",
                          )),
                      Text("\$${controller.adDetailsModel?.adDetails.price}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              CustomTextField(
                  controller: controller.nameController,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.blue.shade50,
                  hintext: 'Name'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: controller.emailController,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.blue.shade50,
                  hintext: 'Email'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: controller.phoneController,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.blue.shade50,
                  keyboardType: TextInputType.number,
                  hintext: 'Phone'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: controller.cityController,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.blue.shade50,
                  hintext: 'City'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: controller.zipController,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.blue.shade50,
                  hintext: 'Zip Code'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: controller.addressController,
                  textInputAction: TextInputAction.done,
                  fillColor: Colors.blue.shade50,
                  hintext: 'Address'),
              SizedBox(height: 40),
              Obx(() => controller.isLoading.value
                  ? Container(
                      width: Get.width / 2,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: primaryColor),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(color: Colors.white),
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.checkout();
                      },
                      child: Container(
                        width: Get.width / 2,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor),
                        alignment: Alignment.center,
                        child: const Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
