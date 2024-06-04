import 'dart:io';

import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewBasicInfoView extends GetView<AdPostController> {
  const NewBasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdPostController>(builder: (controller) {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: controller.featureFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///title
                    Row(
                      children: [
                        Text("Title"),
                        const Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
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
                          filled: true,
                          fillColor: Colors.blue.shade50),
                    ),
                    const SizedBox(height: 6),

                    ///sub-category
                    // Text(
                    //     AppLocalizations.of(context).translate('subcategory')!),
                    // const SizedBox(
                    //   height: 6
                    // ),
                    // Obx(
                    //   () => DropdownButtonFormField<Subcategory>(
                    //     isExpanded: true,
                    //     decoration: const InputDecoration(
                    //       hintText: "Sub Category",
                    //       // contentPadding: EdgeInsets.symmetric(vertical: 15)
                    //     ),
                    //     value: controller.subcategory,
                    //     items: controller.subcategoryList
                    //         .map<DropdownMenuItem<Subcategory>>((e) {
                    //       return DropdownMenuItem<Subcategory>(
                    //         value: e,
                    //         child: Text(e.name),
                    //       );
                    //     }).toList(),
                    //     onChanged: (Subcategory? value) {
                    //       controller.selectedSubcategory = value!.id.toString();
                    //       // controller.getSubcategory(value!);
                    //       // setState(() {
                    //       //   subCategory = null;
                    //       // });
                    //       // postAdBloc.add(NewPostAdEventSubCategory(value!.id.toString(),value));
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(height: 16),

                    ///Country
                    // const Text(
                    //   "Country",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(height: 7),
                    // DropdownButtonFormField(
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return null;
                    //     }
                    //     return null;
                    //   },
                    //   isExpanded: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Select Country",
                    //   ),
                    //   items:
                    //   postAdBloc.countryList.map<DropdownMenuItem<TopCountry>>((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     Future.delayed(const Duration(milliseconds: 300))
                    //         .then((value2) {
                    //       postAdBloc
                    //           .add(NewPostAdEventProductCountryId(value!.id.toString()));
                    //     });
                    //   },
                    // ),
                    // const SizedBox(height: 16,),
                    //
                    // ///States
                    // const Text(
                    //   "States",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(height: 7),
                    // DropdownButtonFormField(
                    //   value: postAdBloc.stateModel,
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return null;
                    //     }
                    //     return null;
                    //   },
                    //   isExpanded: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Select State",
                    //   ),
                    //   items: postAdBloc.stateList.map<DropdownMenuItem<StateModel>>((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     postAdBloc.add(NewPostAdEventProductStateId(value!.id.toString(),value));
                    //   },
                    // ),
                    // const SizedBox(height: 16),
                    //
                    // ///City
                    // const Text(
                    //   "City",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(height: 7),
                    // DropdownButtonFormField(
                    //   value: postAdBloc.cityModel,
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return null;
                    //     }
                    //     return null;
                    //   },
                    //   isExpanded: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Select City",
                    //   ),
                    //   items: postAdBloc.cityList.map<DropdownMenuItem<City>>((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     postAdBloc.add(NewPostAdEventProductCityId(value!.id.toString(),value));
                    //   },
                    // ),

                    ///Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text("Price"),
                            const Text(
                              "*",
                              style: TextStyle(color: Colors.red),
                            ),
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
                              return 'Enter Price';
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
                    const Text("City"),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<CityModel>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          hintText: "City",
                          filled: true,
                          fillColor: Colors.blue.shade50),
                      value: controller.city,
                      items: controller.homeController.cities
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
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.digitsOnly
                      // ],
                      // initialValue: state.price,
                      controller: controller.locationController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Address';
                        }
                        return null;
                      },
                      // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
                      decoration: InputDecoration(
                          hintText: "Address",
                          filled: true,
                          fillColor: Colors.blue.shade50),
                    ),

                    ///Description
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text("Description"),
                        const Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
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
                          return 'Enter Description';
                        }
                        return null;
                      },
                      // onChanged: (value) => postAdBloc.add(NewPostAdEventDescription(value)),
                      decoration: InputDecoration(
                          hintText: "Description",
                          filled: true,
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
                              // postAdBloc.add(NewPostAdEventFeatureImage(value ?? ''));
                            });
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueGrey.shade100,
                            ),
                            alignment: Alignment.center,
                            child: const Text("Choose File"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        controller.featureImage != null
                            ? Expanded(
                                child: SizedBox(
                                child: Text(
                                  controller.base64featureImage,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                            : Container(),
                      ],
                    ),
                    const SizedBox(height: 16),

                    ///Images
                    const Row(
                      children: [
                        Text("Gallery image"),
                        Text(" (Can add up to 5 only photos)")
                      ],
                    ),
                    const SizedBox(height: 16),
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
                                  // postAdBloc.add(NewPostAdEventImages(value ?? []));
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: ashColor),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add_circle_outlined,
                                    color: primaryColor,
                                  ),
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
                                borderRadius: BorderRadius.circular(3)),
                            child: Image(
                              // image: FileImage(File(controller.images2![index].path))
                              image: FileImage(
                                  File(controller.images[index - 1].path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      itemCount: controller.images.length + 1,
                    ),

                    ///Contact info phone email
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const SizedBox(
                    //       height: 16,
                    //     ),
                    //     Text(
                    //       AppLocalizations.of(context)
                    //           .translate('contact_information')!,
                    //       style: const TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.bold),
                    //     ),
                    //     const SizedBox(
                    //       height: 16
                    //     ),
                    //
                    //     ///Phone
                    //     Row(
                    //       children: [
                    //         SizedBox(
                    //             width: 30,
                    //             height: 24,
                    //             child: Obx(
                    //               () => Checkbox(
                    //                 value: controller.isShowPhone.value,
                    //                 onChanged: (value) {
                    //                   controller.isShowPhone.value =
                    //                       !controller.isShowPhone.value;
                    //                 },
                    //                 activeColor: const Color(0xFF0b5ed7),
                    //               ),
                    //             )),
                    //         const SizedBox(
                    //           width: 0,
                    //         ),
                    //         Text(
                    //           AppLocalizations.of(context)
                    //               .translate('show_phone_to_public')!,
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(
                    //       height: 5,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           AppLocalizations.of(context).translate('phone')!,
                    //           style: const TextStyle(fontSize: 16),
                    //         ),
                    //         const SizedBox(
                    //           height: 7
                    //         ),
                    //         TextFormField(
                    //           keyboardType: TextInputType.number,
                    //           // initialValue: state.phone,
                    //           controller: controller.phoneController,
                    //           textInputAction: TextInputAction.next,
                    //           // validator: (value) {
                    //           //   if (value == null && state.isShowPhone) {
                    //           //     return "Phone field is required";
                    //           //   }
                    //           //   return null;
                    //           // },
                    //           // onChanged: (value) => postAdBloc.add(NewPostAdEventPhone(value)),
                    //           decoration: InputDecoration(
                    //               hintText: "Phone",
                    //               filled: true,
                    //               fillColor: Colors.blue.shade50),
                    //         ),
                    //         const SizedBox(
                    //           height: 16
                    //         ),
                    //       ],
                    //     ),
                    //
                    //     ///Email
                    //     Row(
                    //       children: [
                    //         SizedBox(
                    //           width: 30,
                    //           height: 24,
                    //           child: Obx(() => Checkbox(
                    //                 value: controller.isShowEmail.value,
                    //                 onChanged: (value) {
                    //                   controller.isShowEmail.value =
                    //                       !controller.isShowEmail.value;
                    //                 },
                    //                 activeColor: const Color(0xFF0b5ed7),
                    //               )),
                    //         ),
                    //         const SizedBox(
                    //           width: 0,
                    //         ),
                    //         Text(
                    //           AppLocalizations.of(context)
                    //               .translate('show_email_to_public')!,
                    //           style: const TextStyle(fontSize: 16),
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(
                    //       height: 5
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //             AppLocalizations.of(context)
                    //                 .translate('email')!,
                    //             style: TextStyle(fontSize: 16)),
                    //         const SizedBox(height: 7),
                    //         TextFormField(
                    //           keyboardType: TextInputType.emailAddress,
                    //           // initialValue: state.phone,
                    //           controller: controller.emailController,
                    //           textInputAction: TextInputAction.next,
                    //           // validator: (value) {
                    //           //   if (value == null && state.isShowEmail) {
                    //           //     return "Email field is required";
                    //           //   }
                    //           //   return null;
                    //           // },
                    //           // onChanged: (value) => postAdBloc.add(NewPostAdEventEmail(value)),
                    //           decoration: InputDecoration(
                    //               hintText: AppLocalizations.of(context)
                    //                   .translate('email')!,
                    //               filled: true,
                    //               fillColor: Colors.blue.shade50),
                    //         ),
                    //         const SizedBox(
                    //           height: 16,
                    //         ),
                    //       ],
                    //     ),
                    //
                    //     ///Whatsapp
                    //     Row(
                    //       children: [
                    //         SizedBox(
                    //           width: 30,
                    //           height: 24,
                    //           child: Obx(() => Checkbox(
                    //                 value: controller.isShowWhatsapp.value,
                    //                 onChanged: (value) {
                    //                   controller.isShowWhatsapp.value =
                    //                       !controller.isShowWhatsapp.value;
                    //                 },
                    //                 activeColor: const Color(0xFF0b5ed7),
                    //               )),
                    //         ),
                    //         const SizedBox(
                    //           width: 0,
                    //         ),
                    //         Text(
                    //           AppLocalizations.of(context)
                    //               .translate('show_whatsapp_to_public')!,
                    //           style: const TextStyle(fontSize: 16),
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(
                    //       height: 5,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           AppLocalizations.of(context)
                    //               .translate('whatsapp')!,
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //         const SizedBox(
                    //           height: 7,
                    //         ),
                    //         TextFormField(
                    //           keyboardType: TextInputType.number,
                    //           controller: controller.whatsappController,
                    //           textInputAction: TextInputAction.next,
                    //           // onChanged: (value) => postAdBloc.add(NewPostAdEventWhatsapp(value)),
                    //           decoration: InputDecoration(
                    //               hintText: AppLocalizations.of(context)
                    //                   .translate('whatsapp')!,
                    //               filled: true,
                    //               fillColor: Colors.blue.shade50),
                    //         ),
                    //         const SizedBox(
                    //           height: 16,
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    ///Website
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //         AppLocalizations.of(context).translate('website')!),
                    //     const SizedBox(
                    //       height: 6,
                    //     ),
                    //     TextFormField(
                    //       keyboardType: TextInputType.text,
                    //       controller: controller.webSiteController,
                    //       textInputAction: TextInputAction.next,
                    //       // onChanged: (value) => postAdBloc.add(NewPostAdEventWebsite(value)),
                    //       decoration: InputDecoration(
                    //           hintText: AppLocalizations.of(context)
                    //               .translate('website')!,
                    //           filled: true,
                    //           fillColor: Colors.blue.shade50),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 16),

                    ///Payment for feature ads
                    Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: controller.isPaymentChecked.value,
                              onChanged: (value) {
                                controller.isPaymentChecked.value =
                                    !controller.isPaymentChecked.value;
                              },
                              activeColor: const Color(0xFF0b5ed7),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(10),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mark as featured",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                          border: Border.all(color: Colors.grey.shade400),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mark as collaborate",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
