import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassEdit extends StatelessWidget {
  ChangePassEdit({super.key});

  final controller = Get.find<ProfileUpdateController>();

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
          key: controller.chanePassFormKey,
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Change password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  )),
              const SizedBox(width: double.infinity, height: 16),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Current password",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  )),
              TextFormField(
                controller: controller.currentPassCtr,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter current password';
                  } else if (value.length < 8) {
                    return 'Enter Minimum 8 Character';
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Current password"),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "New password",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  )),
              TextFormField(
                controller: controller.newPassCtr,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter new password';
                  } else if (value.length < 8) {
                    return 'Enter Minimum 8 Character';
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "New password"),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Confirm New password",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  )),
              TextFormField(
                controller: controller.confirmPassCtr,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter confirm password!';
                  } else if (value != controller.newPassCtr.text) {
                    return 'Does\'t match password!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Confirm new password",
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: Obx(() {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: primaryColor,
                        shadowColor: ashColor,
                        side: const BorderSide(
                            color: primaryColor,
                            strokeAlign: BorderSide.strokeAlignInside),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onPressed: () {
                      if (controller.newPassCtr.text ==
                          controller.confirmPassCtr.text) {
                        Utils.closeKeyBoard(context);
                        controller.changePassword();
                      } else {
                        Get.snackbar("Warning", "Confirm password not matched");
                      }
                    },
                    child: controller.isPasswordChangeLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Save changes'),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
