import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/custom_image.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/views/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffF5F6FD),
          body: SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Color(0xffFFEFE7)],
                ),
              ),
              child: Obx(() => Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(1, 1)),
                            ],
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CircleAvatar(
                                radius: 96,
                                backgroundColor: primaryColor.withOpacity(0.1),
                                child: const CustomImage(
                                  path: "assets/images/lock.png",
                                  height: 100,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Align(
                                alignment: Alignment.center,
                                child: Text('Forgot password',
                                    style: GoogleFonts.poppins(
                                        height: 1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Would you like to reset your password? Please enter the email address',
                                    style: GoogleFonts.poppins(
                                        height: 1.5,
                                        fontSize: 16,
                                        color: Colors.black54),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 22),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter email';
                                  } else if (!Utils.isEmail(value.trim())) {
                                    return "Enter valid email";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter your email'),
                              ),
                              const SizedBox(height: 28),
                              SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.forgotPassWord();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero),
                                      backgroundColor: primaryColor),
                                  child: controller.isLoading.value
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text("Request Reset Link"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
