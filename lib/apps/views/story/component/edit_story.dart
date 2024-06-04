import 'dart:io';
import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/global_widget/webview_container.dart';
import 'package:artispark/apps/views/story/model/story_model.dart';
import 'package:artispark/apps/views/story/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditStory extends StatefulWidget {
  const EditStory(
      {super.key, required this.storyController, required this.storyModel});

  final StoryController storyController;
  final StoryModel storyModel;

  @override
  State<EditStory> createState() => _EditStoryState();
}

class _EditStoryState extends State<EditStory> {
  @override
  void initState() {
    super.initState();
    widget.storyController.titleController.text =
        widget.storyModel.title.toString();
    widget.storyController.descController.text =
        widget.storyModel.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Stories'),
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: widget.storyController.editStoryFormKey,
                child: Column(
                  children: [
                    /// title
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: widget.storyController.titleController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: primaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: primaryColor)),
                          hintText: "Title",
                          hintStyle: const TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: Get.height / 11.5,
                      width: Get.width,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Obx(() => Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  customDialog(
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
                                      widget.storyController.setProfileUpdateImage(
                                          File(pickedFile.path));
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
                                      widget.storyController.setProfileUpdateImage(
                                          File(pickedFile.path));
                                      Navigator.pop(context);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: Get.width / 4,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Choose File',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                height: Get.height,
                                width: Get.width / 2,
                                child: widget.storyController.path.value == ""
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: Colors
                                                              .red.shade700,
                                                          size: 25,
                                                        )),
                                                    // Text('X',style: TextStyle(
                                                    //     color: Colors.red.shade700,
                                                    //     fontSize: 16,
                                                    //     fontWeight: FontWeight.bold
                                                    // ),),
                                                  ),
                                                  content: SizedBox(
                                                    width: double.maxFinite,
                                                    height: 400,
                                                    child: WebViewContainer(
                                                        url:
                                                            "${RemoteUrls.rootUrl}/${widget.storyModel.image}"),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            "View previous image",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 14.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2,
                                              decorationColor: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          widget.storyController.path.value,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          )),
                    ),

                    ///description
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: widget.storyController.descController,
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: primaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: primaryColor)),
                          hintText: "Description",
                          hintStyle: const TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Utils.closeKeyBoard(context);
                          if (widget
                              .storyController.editStoryFormKey.currentState!
                              .validate()) {
                            widget.storyController
                                .editStoryData(context, widget.storyModel.id.toString());
                          }
                        },
                        child: Obx(() =>
                            widget.storyController.isEditStoryLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white))
                                : const Text("Update",
                                    style: TextStyle(color: Colors.white))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void customDialog(
      BuildContext context,
      String title,
      String subTitle,
      String posBtnTitle,
      String negBtnTitle,
      Function() posCallback,
      Function() negCallback) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.grey.shade400,
          child: SizedBox(
            height: Get.height / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width / 20, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width / 20),
                  child: Text(
                    subTitle,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width / 10, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: posCallback,
                        child: Container(
                          height: Get.height / 18,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            posBtnTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: negCallback,
                        child: Container(
                          height: Get.height / 18,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: reddColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            negBtnTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
