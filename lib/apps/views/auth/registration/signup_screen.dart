import 'package:artispark/apps/core/utils/colors.dart';
import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/auth/registration/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Get.size.height * 0.15,
                ),
              ),

              ///TOP HEADER
              SliverPadding(
                padding: const EdgeInsets.symmetric(),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'login',
                              style: TextStyle(color: primaryColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              ///Text input fields
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            // runSpacing: 12,
                            // spacing: 10,
                            children: [
                              Obx(() => GestureDetector(
                                    onTap: () {
                                      controller.userType.value = 1;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio(
                                          activeColor: primaryColor,
                                          value: 1,
                                          groupValue: controller.userType.value,
                                          onChanged: (value) {
                                            controller.changeUserType(value);
                                          },
                                        ),
                                        const Text("Artist"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  )),
                              Obx(() => GestureDetector(
                                    onTap: () {
                                      controller.userType.value = 0;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio(
                                          activeColor: primaryColor,
                                          value: 0,
                                          groupValue: controller.userType.value,
                                          onChanged: (value) {
                                            controller.changeUserType(value);
                                          },
                                        ),
                                        const Text("Buyer"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const Text('Name'),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: controller.nameCtl,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter your name",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Username'),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: controller.userNameCtrl,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Enter your username",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter username";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Email'),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: controller.emailCtl,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Enter your email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        const Text('Password'),
                        const SizedBox(height: 8),
                        Obx(() {
                          return TextFormField(
                            controller: controller.passwordCtl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isVisiblePassword.value,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              suffixIcon: controller.isVisiblePassword.value
                                  ? IconButton(
                                      onPressed: () {
                                        controller.isVisiblePassword.value =
                                            false;
                                      },
                                      icon: const Icon(Icons.visibility_off),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        controller.isVisiblePassword.value =
                                            true;
                                      },
                                      icon: const Icon(Icons.visibility),
                                    ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              } else {
                                return null;
                              }
                            },
                          );
                        }),
                        const SizedBox(height: 16),
                        const Text('Confirm Password'),
                        const SizedBox(height: 8),
                        Obx(() {
                          return TextFormField(
                            controller: controller.confirmPasswordCtl,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                controller.isConfirmVisiblePassword.value,
                            decoration: InputDecoration(
                              hintText: "Enter your confirm password",
                              suffixIcon: controller
                                      .isConfirmVisiblePassword.value
                                  ? IconButton(
                                      onPressed: () {
                                        controller.isConfirmVisiblePassword
                                            .value = false;
                                      },
                                      icon: const Icon(Icons.visibility_off),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        controller.isConfirmVisiblePassword
                                            .value = true;
                                      },
                                      icon: const Icon(Icons.visibility),
                                    ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter confirm password";
                              } else {
                                return null;
                              }
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              ///Register BTN
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Obx(() => GestureDetector(
                        onTap: () {
                          if (controller.passwordCtl.text ==
                              controller.confirmPasswordCtl.text) {
                            controller.userRegistration();
                          } else {
                            Get.snackbar(
                                "Warning", "Confirm password not matched");
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor),
                          child: Center(
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      )),
                ),
              ),
              // const SliverToBoxAdapter(child: SizedBox(height: 10)),
              // SliverPadding(
              //   padding: EdgeInsets.only(left: 16.w, right: 16.w),
              //   sliver: SliverToBoxAdapter(
              //     child: GestureDetector(
              //       onTap: () {
              //         controller.mainController.changePage(0);
              //         Get.offAllNamed(Routes.main);
              //       },
              //       child: Center(
              //           child: Text(
              //         "Back to Home",
              //         style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           fontSize: 14.sp,
              //           color: primaryColor,
              //         ),
              //       )),
              //     ),
              //   ),
              // ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        ),
      );
    });
  }
}
