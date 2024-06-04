import 'dart:io';
import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/global_widget/custom_dialog.dart';
import 'package:artispark/apps/views/story/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateStory extends StatelessWidget {
  const CreateStory({super.key});

  @override
  Widget build(BuildContext context) {
    StoryController storyController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Stories'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: storyController.createStoryFormKey,
                child: Column(
                  children: [
                    /// title
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: storyController.titleController,
                      textInputAction: TextInputAction.next,
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
                                      storyController.setProfileImage(
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
                                      storyController.setProfileImage(
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
                                child: storyController.path.value == ""
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "No file chosen",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          storyController.path.value,
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
                      controller: storyController.descController,
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
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
                      child:
                          Obx(() => storyController.isCreateStoryLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  onPressed: () {
                                    storyController.createStoryData(context);
                                  },
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
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
}
