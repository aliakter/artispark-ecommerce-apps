import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(height: Get.size.height * 0.15)),

              ///TOP HEADER
              SliverPadding(
                padding: const EdgeInsets.symmetric(),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.signup);
                            },
                            child: Text(
                              'register',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                sliver: SliverToBoxAdapter(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email'),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: controller.emailCtr,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: "Enter your email"),
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
                        const SizedBox(height: 12),
                        Obx(() {
                          return TextFormField(
                            controller: controller.passwordCtl,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isPasswordVisible.value,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              suffixIcon: controller.isPasswordVisible.value
                                  ? IconButton(
                                      onPressed: () {
                                        controller.isPasswordVisible.value =
                                            false;
                                      },
                                      icon: const Icon(Icons.visibility_off),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        controller.isPasswordVisible.value =
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
                        })
                      ],
                    ),
                  ),
                ),
              ),

              ///Forget passwordSliverToBoxAdapter(
              //               //   child: Align(
              //               //     alignment: Alignment.centerRight,
              //               //     child: TextButton(
              //               //       onPressed: () {
              //               //         Get.toNamed(Routes.forgotPass);
              //               //       },
              //               //       child: const Text(
              //               //         "Forget password?",
              //               //         style: TextStyle(color: Colors.black),
              //               //       ),
              //               //     ),
              //               //   ),
              //               // ),
              // SliverToBoxAdapter(
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: TextButton(
              //       onPressed: () {
              //         Get.toNamed(Routes.forgotPass);
              //       },
              //       child: const Text(
              //         "Forget password?",
              //         style: TextStyle(color: Colors.black),
              //       ),
              //     ),
              //   ),
              // ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                    child: Obx(() => GestureDetector(
                          onTap: () {
                            controller.login();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: primaryColor),
                            child: Center(
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text(
                                      'Log In',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        ))),
              ),
              // SliverPadding(
              //   padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
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
            ],
          ),
        ),
      ),
    );
  }
}
