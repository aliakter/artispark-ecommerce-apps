import 'dart:convert';
import 'dart:io';
import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/custom_avatar.dart';
import 'package:artispark/apps/global_widget/profile_custom_dialog.dart';
import 'package:artispark/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:artispark/apps/views/public_profile/model/public_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../core/utils/custom_image.dart';
import '../../../core/utils/k_images.dart';
import '../../../core/utils/utils.dart';

class BasicInfoEdit extends StatefulWidget {
  final PublicProfileModel? profile;

  const BasicInfoEdit({super.key, required this.profile});

  @override
  State<BasicInfoEdit> createState() => _BasicInfoEditState();
}

class _BasicInfoEditState extends State<BasicInfoEdit> {
  ProfileUpdateController controller = Get.find();

  Future<void> chooseImage() async {
    await Utils.pickSingleImage().then((value) async {
      if (value != null) {
        //originalImage = value;
        // CroppedFile? file = await Utils.cropper(value, 1.0, 1.0);
        // if (file != null) {
        //   controller.image.value = file.path;
        //   List<int> imageBytes = await file.readAsBytes();
        //   controller.base64Image =
        //       'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';
        //   // context.read<AdEditProfileCubit>().base64Image = base64Image!;
        // }
        controller.image.value = value;
        List<int> imageBytes = await File(value).readAsBytes();
        controller.base64Image =
            'data:image/${value.split('.').last};base64,${base64Encode(imageBytes)}';
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.image.value = widget.profile!.user.image;
    controller.image.value = widget.profile!.user.image;
    controller.nameCtr.text = widget.profile!.user.name;
    controller.userNameCtr.text = widget.profile!.user.username;
    controller.emailCtr.text = widget.profile!.user.email;
    controller.phoneCtr.text = widget.profile!.user.phone;
    controller.webSiteCtr.text = widget.profile!.user.web;
    controller.aboutCtr.text = widget.profile!.user.aboutPublicProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.transparent),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 5))
            ]),
        child: Form(
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Account information",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )),

              ///IMAGE TAKER.
              SizedBox(
                height: 140,
                width: 140,
                child: Stack(
                  children: [
                    Obx(
                      () => CustomAvatar(
                          height: 140,
                          width: 140,
                          image: controller.profileImage.value.path.isEmpty &&
                                  controller.image.isNotEmpty
                              ? '${RemoteUrls.rootUrl}/${controller.image}'
                              : controller.profileImage.value.path.isNotEmpty
                                  ? controller.profileImage.value.path
                                  : KImages.defaultImage,
                          network: controller.profileImage.value.path.isEmpty &&
                              controller.image.isNotEmpty,
                          file: controller.profileImage.value.path.isNotEmpty),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: primaryColor, width: 3.w)),
                        child: Material(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: () {
                              profileCustomDialog(
                                  context,
                                  'Upload Profile',
                                  'Select from you want to upload your profile',
                                  'Gallery',
                                  'Camera', () async {
                                final pickedFile =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                  maxWidth: 1800,
                                  maxHeight: 1800,
                                );
                                if (pickedFile != null) {
                                  controller
                                      .setProfileImage(File(pickedFile.path));
                                  Navigator.pop(context);
                                }
                              }, () async {
                                final pickedFile =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                  maxWidth: 1800,
                                  maxHeight: 1800,
                                );
                                if (pickedFile != null) {
                                  controller
                                      .setProfileImage(File(pickedFile.path));
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.camera,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: double.infinity, height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Full name",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TextFormField(
                controller: controller.nameCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                ),
              ),
              const Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'User Name',
                          textAlign: TextAlign.left,
                        ),
                      )),
                  Text("*")
                ],
              ),
              TextFormField(
                controller: controller.userNameCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    //return '${AppLocalizations.of(context).translate('required')} ${AppLocalizations.of(context).translate('user_name')}*';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'User Name',
                ),
              ),
              const Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Email',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Text("*")
                ],
              ),
              TextFormField(
                controller: controller.emailCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // return '${AppLocalizations.of(context).translate('required')} ${AppLocalizations.of(context).translate('email')}*';
                  } else if (!Utils.isEmail(value)) {
                    return 'Enter valid email*';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "'Enter email address'",
                ),
              ),
              const SizedBox(height: 10),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 30,
              //       height: 24,
              //       child: Checkbox(
              //         value: widget.bloc.showEmail,
              //         onChanged: (value) {
              //           setState(() {
              //             widget.bloc.showEmail = value!;
              //           });
              //         },
              //         activeColor: const Color(0xFF0b5ed7),
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     Text(
              //         "${AppLocalizations.of(context).translate('hide_email_address')}")
              //   ],
              // ),
              // const SizedBox(height: 10),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 30,
              //       height: 24,
              //       child: Checkbox(
              //         value: widget.bloc.receivedEmail,
              //         onChanged: (value) {
              //           setState(() {
              //             widget.bloc.receivedEmail = value!;
              //           });
              //         },
              //         activeColor: const Color(0xFF0b5ed7),
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     Text(
              //         "${AppLocalizations.of(context).translate('stop_receive_email')}")
              //   ],
              // ),
              const Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Phone Number',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Text("*")
                ],
              ),
              TextFormField(
                controller: controller.phoneCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {}
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Phone number',
                ),
              ),
              // Container(
              //   height: Get.height / 14,
              //   padding: const EdgeInsets.only(left: 5),
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       width: 1,
              //       color: Colors.grey.withOpacity(0.22),
              //     ),
              //     borderRadius: BorderRadius.circular(5.0),
              //   ),
              //   child: InternationalPhoneNumberInput(
              //     ignoreBlank: true,
              //     onInputChanged: (PhoneNumber value) {},
              //     textFieldController: controller.phoneCtr,
              //     initialValue: PhoneNumber(isoCode: 'VU'),
              //     countries: const ['VU', 'BD'],
              //     inputDecoration: const InputDecoration(
              //       hintText: "Phone Number",
              //     ),
              //     isEnabled: true,
              //     onFieldSubmitted: (String value) {},
              //     validator: (phoneNumber) {
              //       if (phoneNumber!.isEmpty) {}
              //       return null;
              //     },
              //     onSaved: (PhoneNumber number) {},
              //     selectorTextStyle: const TextStyle(
              //         fontSize: 16, fontWeight: FontWeight.w600),
              //     spaceBetweenSelectorAndTextField: 2,
              //     selectorConfig: const SelectorConfig(
              //         trailingSpace: false,
              //         selectorType: PhoneInputSelectorType.DIALOG),
              //   ),
              // ),

              /*

              TextFormField(
                controller: widget.bloc.phoneCtr,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '${AppLocalizations.of(context).translate('required')} ${AppLocalizations.of(context).translate('phone_number')}*';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText:
                      "${AppLocalizations.of(context).translate('phone_number')}",
                ),
              ),
               */
              const SizedBox(height: 10),
              const Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Website links",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Text(" (optional)")
                ],
              ),
              TextFormField(
                controller: controller.webSiteCtr,
                decoration: const InputDecoration(
                  hintText: "https://demo.com",
                ),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 8.0),
              //     child: Text(
              //       "Opening Hours",
              //       textAlign: TextAlign.left,
              //     ),
              //   ),
              // ),
              // TextFormField(
              //   keyboardType: TextInputType.name,
              //   controller: controller.openingHour,
              //   textInputAction: TextInputAction.next,
              //   readOnly: true,
              //   onTap: () {
              //     openingSelectTime(context);
              //   },
              //   onChanged: (value) {
              //     print("agdhas ${(value)}");
              //     //widget.bloc.openingHour.text = value;
              //   },
              //   decoration: const InputDecoration(
              //     prefixIcon: Icon(
              //       Icons.watch_later_outlined,
              //       color: Colors.black45,
              //     ),
              //     hintText: "Opening Hours",
              //   ),
              // ),
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 8.0),
              //       child: Text(
              //         "Closing Hours",
              //         textAlign: TextAlign.left,
              //       ),
              //     )),
              // TextFormField(
              //   keyboardType: TextInputType.name,
              //   controller: controller.closingHour,
              //   textInputAction: TextInputAction.next,
              //   readOnly: true,
              //   onTap: () {
              //     closingSelectTime(context);
              //   },
              //   onChanged: (value) {
              //     print("agdhas ${(value)}");
              //     // widget.bloc.closingHour.text = value;
              //   },
              //   decoration: const InputDecoration(
              //       prefixIcon: Icon(
              //         Icons.watch_later_outlined,
              //         color: Colors.black45,
              //       ),
              //       hintText: "Closing Hours"),
              // ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "About Public Profile",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TextFormField(
                controller: controller.aboutCtr,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'About public profile',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      shadowColor: ashColor,
                      side: const BorderSide(
                          width: 0.5,
                          color: primaryColor,
                          strokeAlign: BorderSide.strokeAlignInside),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    controller.saveEditProfileData();
                  },
                  child: Obx(() {
                    return controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text(
                            "Save changes",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w400),
                          );
                  }),
                ),
              )
            ],
          ),
        ));
  }

  /// .......... time choose .....................
  ///
  TimeOfDay fromSelectedTime = TimeOfDay.now();

  openingSelectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: fromSelectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: primaryColor,
              onPrimary: Color(0xFF31A3DD),
              surface: Colors.white,
              onSurface: Color(0xFF000000),
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      fromSelectedTime = newTime;
      controller.openingHour
        ..text = newTime.format(context)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: controller.openingHour.text.length,
            affinity: TextAffinity.upstream));
      // widget.bloc.openingTime = widget.bloc.openingHour.text;
      // pageBloc.add(CreateEventEventStartTime("$fromTime"));
      // setState(() {});
    }
  }

  TimeOfDay toSelectedTime = TimeOfDay.now();

  closingSelectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: toSelectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: primaryColor,
              onPrimary: Color(0xFF31A3DD),
              surface: Colors.white,
              onSurface: Color(0xFF000000),
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      toSelectedTime = newTime;
      controller.closingHour
        ..text = newTime.format(context)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: controller.closingHour.text.length,
            affinity: TextAffinity.upstream));
      // bloc.closingTime = bloc.closingHour.text;
      // pageBloc.add(CreateEventEventStartTime("$fromTime"));
      //setState(() {});
    }
  }
}
