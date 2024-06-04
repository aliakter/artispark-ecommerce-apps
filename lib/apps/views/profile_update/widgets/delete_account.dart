import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileUpdateController>();
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
        child: Column(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(
                    "Delete account",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Delete account alert",
                    // "By clicking below button your account will be deleted permanently. You won't able to retrieve your account anymore.",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black45),
                  ),
                )),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: Obx(() {
                return OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      shadowColor: ashColor,
                      side: const BorderSide(
                          color: Colors.red,
                          strokeAlign: BorderSide.strokeAlignInside),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Utils.showCustomDialog(
                      context,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 10),
                        height: Get.height / 3.75,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Type 'delete' to delete your account.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Center(
                              child: Text(
                                "All contacts and other data associated with this account will be permanently deleted. This cannot be undone.",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: controller.deleteController,
                              validator: (value) {
                                if (value != null || value!.isNotEmpty) {
                                  // setState(() {
                                  //   bloc.deleteController.text = value.toString();
                                  // });
                                  return null;
                                }
                                return 'this filed is required';
                              },
                              decoration: const InputDecoration(
                                  hintText:
                                      "Type 'delete' to delete your account.",
                                  hintStyle: TextStyle(fontSize: 12)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: primaryColor),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: primaryColor),
                                  onPressed: () {
                                    if (controller
                                        .deleteController.text.isNotEmpty) {
                                      if (controller.deleteController.text ==
                                          "delete") {
                                        Navigator.pop(context);
                                        controller.deleteAccount();
                                      } else {
                                        Utils.errorSnackBar(
                                            context, "key does not match");
                                      }
                                    } else {
                                      Utils.errorSnackBar(
                                          context, 'This feild is required');
                                      print('this filed is required');
                                    }
                                  },
                                  child: const Text("Ok"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      barrierDismissible: true,
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  label: controller.isAcDeleteLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : const Text(
                          "Delete account",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w400),
                        ),
                );
              }),
            )
          ],
        ));
  }
}
