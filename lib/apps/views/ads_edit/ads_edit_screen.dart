import 'dart:io';

import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/views/ads_edit/controller/ad_edit_controller.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:artispark/apps/views/home/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsEditScreen extends StatelessWidget {
  const AdsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdEditController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Product Update"),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_sharp, color: iconThemeColor),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      sliver: SliverToBoxAdapter(
                        child: Form(
                          key: controller.featureFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///title
                              const Row(
                                children: [
                                  Text("Title"),
                                  Text("*",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                // initialValue: state.name,
                                controller: controller.titleController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter title';
                                  }
                                  return null;
                                },
                                // onChanged: (value) => postAdBloc.add(NewPostAdEventTitle(value)),
                                decoration: InputDecoration(
                                    hintText: "Title",
                                    fillColor: Colors.blue.shade50),
                              ),
                              const SizedBox(height: 16),

                              ///Price
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text("Price"),
                                      Text("*",
                                          style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.digitsOnly
                                    // ],
                                    // initialValue: state.price,
                                    controller: controller.priceController,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      }
                                      return null;
                                    },
                                    // onChanged: (value) => postAdBloc.add(NewPostAdEventPrice(value)),
                                    decoration: InputDecoration(
                                        hintText: "Price",
                                        filled: true,
                                        fillColor: Colors.blue.shade50),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),

                              ///sub-category
                              const Row(
                                children: [
                                  Text("City"),
                                  Text("*",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<CityModel>(
                                isExpanded: true,
                                decoration: InputDecoration(
                                    hintText: "City",
                                    filled: true,
                                    fillColor: Colors.blue.shade50),
                                value: controller.city,
                                items: controller.cities
                                    .map<DropdownMenuItem<CityModel>>((e) {
                                  return DropdownMenuItem<CityModel>(
                                    value: e,
                                    child: Text(e.name),
                                  );
                                }).toList(),
                                onChanged: (CityModel? value) {
                                  controller.changeCity(value!);
                                },
                              ),

                              ///Address
                              const SizedBox(height: 16),
                              const Row(
                                children: [
                                  Text("Address"),
                                  Text("*",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: controller.addressController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    hintText: "Address",
                                    fillColor: Colors.blue.shade50),
                              ),
                              const SizedBox(height: 16),

                              ///Description
                              const SizedBox(height: 16),
                              const Row(
                                children: [
                                  Text("Description"),
                                  Text("*",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                maxLines: 3,
                                // initialValue: state.description,
                                controller: controller.descriptionController,
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                                // onChanged: (value) => postAdBloc.add(NewPostAdEventDescription(value)),
                                decoration: InputDecoration(
                                    hintText: "Description",
                                    fillColor: Colors.blue.shade50),
                              ),
                              const SizedBox(height: 16),

                              Row(
                                children: [
                                  Text("Featured image"),
                                  const Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.pickImage().then((value) {
                                        print("Image value us $value");
                                      });
                                    },
                                    child: Container(
                                      width: 150,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blueGrey.shade100,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text("Choose File"),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  controller.featureImage != ""
                                      ? Expanded(
                                          child: SizedBox(
                                          child: Text(
                                            controller.featureImage.toString(),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                      : Container(),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // const Text("Featured Image"),
                              // const SizedBox(height: 6),
                              // Row(
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         controller.pickImage().then((value) {
                              //           print("Image value us $value");
                              //           // postAdBloc.add(NewPostAdEventFeatureImage(value ?? ''));
                              //         });
                              //       },
                              //       child: Container(
                              //         width: 150,
                              //         padding: const EdgeInsets.symmetric(vertical: 10),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(5),
                              //           color: Colors.blueGrey.shade100,
                              //         ),
                              //         alignment: Alignment.center,
                              //         child: const Text("Choose File"),
                              //       ),
                              //     ),
                              //     const SizedBox(width: 10,),
                              //     controller.featureImage != null ? Expanded(child: SizedBox(child: Text("${controller.base64featureImage}", overflow: TextOverflow.ellipsis,),)) : Container(),
                              //   ],
                              // ),
                              // const SizedBox(height: 16),
                              Visibility(
                                visible: controller.imageGallery.isNotEmpty,
                                child: GridView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (_, index) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                                color: ashTextColor
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: index == 0
                                                ? ClipRect(
                                                    child: Banner(
                                                      message: 'Feature',
                                                      location: BannerLocation
                                                          .topStart,
                                                      child: CustomImage(
                                                        path:
                                                            "${controller.featureImage}",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )
                                                : CustomImage(
                                                    path:
                                                        "${RemoteUrls.rootUrl}${controller.imageGallery[index - 1].image}",
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        Material(
                                          color:
                                              Colors.black87.withOpacity(0.6),
                                          shape: const CircleBorder(),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            onTap: () {
                                              // deletedImages
                                              //     .add(imageGallery[index].id.toString());
                                              // postAdBloc.add(
                                              //     NewEditAdEventDeleteImage(deletedImages));
                                              // setState(() {
                                              //   controller.imageGallery.removeAt(index);
                                              // });
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.delete,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: controller.imageGallery.length + 1,
                                ),
                              ),

                              /// ............. I M A G E ...............
                              const Text(
                                  "Gallery Images  (Can add up to 5 only photos)"),
                              const SizedBox(height: 16),

                              ///.............. Old Images ..............

                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (_, index) {
                                  if (index == 0) {
                                    return Material(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(3),
                                        onTap: () {
                                          controller.pickImages().then((value) {
                                            controller.imageList = value ?? [];
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(color: ashColor),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                                Icons.add_circle_outlined,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Container(
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                          color: ashTextColor.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Image(
                                        // image: FileImage(File(controller.images2![index].path))
                                        image: FileImage(File(controller
                                            .images![index - 1].path)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller.images!.length + 1,
                              ),
                              const SizedBox(height: 16),

                              ///Payment for feature ads
                              Obx(() {
                                return Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value:
                                            controller.isPaymentChecked.value,
                                        onChanged: (value) {
                                          controller.isPaymentChecked.value =
                                              !controller
                                                  .isPaymentChecked.value;
                                        },
                                        activeColor: const Color(0xFF0b5ed7),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(10),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Mark as featured",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(height: 16),

                              ///collaborate for feature ads
                              Obx(() {
                                return Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: controller.isCollaborate.value,
                                        onChanged: (value) {
                                          controller.isCollaborate.value =
                                              !controller.isCollaborate.value;
                                        },
                                        activeColor: const Color(0xFF0b5ed7),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(10),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Mark as collaborate",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(height: 16),
                              SizedBox(
                                  height: 45,
                                  child: Obx(
                                    () => controller.isUpdateAdsLoading.value
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6))),
                                            onPressed: () {
                                              Utils.closeKeyBoard(context);
                                              if (controller
                                                  .featureFormKey.currentState!
                                                  .validate()) {
                                                controller.updateAds();
                                              }
                                            },
                                            child: Text(
                                              'Update',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      );
    });
  }
}
