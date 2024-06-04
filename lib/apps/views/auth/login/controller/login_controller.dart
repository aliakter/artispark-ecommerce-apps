import 'package:artispark/apps/data/error/failure.dart';
import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/auth/login/model/login_model.dart';
import 'package:artispark/apps/views/auth/repository/auth_repository.dart';
import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:artispark/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  final MainController mainController;

  LoginController(this.authRepository, this.mainController);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  String? deviceId = '';
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = true.obs;

  ///google auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  UserLoginResponseModel? _user;

  bool get isLoggedIn => _user != null && _user!.token.isNotEmpty;

  UserLoginResponseModel? get userInfo => _user;

  set user(UserLoginResponseModel userData) => _user = userData;

  void cacheUserData() => authRepository.saveCashedUserInfo(_user!);

  void cacheUserWithData(UserLoginResponseModel userData) =>
      authRepository.saveCashedUserInfo(userData);

  @override
  void onInit() {
    super.onInit();
    /// set user data if user already login
    final result = authRepository.getCashedUserInfo();
    result.fold(
      (l) => _user = null,
      (r) {
        user = r;
      },
    );
  }

  bool isEmailOkay() {
    if (emailCtr.text.isNotEmpty && GetUtils.isEmail(emailCtr.text)) {
      return true;
    }
    return false;
  }

  bool isPasswordOkay() {
    if (passwordCtl.text.isNotEmpty && passwordCtl.text.length > 2) return true;
    return false;
  }

  void login() async {
    deviceId = await FirebaseMessaging.instance.getToken();

    if (formKey.currentState!.validate()) {
      final body = <String, String>{};
      body.addAll({"username": emailCtr.text.trim()});
      body.addAll({"password": passwordCtl.text.trim()});
      body.addAll({"device_id": deviceId.toString()});

      isLoading.value = true;
      final result = await authRepository.login(body);

      result.fold((error) {
        isLoading.value = false;
        print(error.message);
        Get.snackbar('Error', error.message,
            backgroundColor: Colors.red.shade300, colorText: Colors.black);
      }, (data) async {
        _user = data;
        emailCtr.text = "";
        passwordCtl.text = "";
        cacheUserData();
        isLoading.value = false;
        mainController.changePage(0);
        Get.offAllNamed(Routes.main);
      });
    }
  }

  Future<void> handleGoogleSignIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        signInOption: SignInOption.standard,
        scopes: [
          'email',
        ],
      );

      await googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
        GoogleSignInAuthentication auth = await acc!.authentication;
        if (kDebugMode) {
          print(acc.id);
          print(acc.email);
          print(acc.displayName);
          print(acc.photoUrl);
        }
        if (kReleaseMode) {
          print(acc.id);
          print(acc.email);
          print(acc.displayName);
          print(acc.photoUrl);
        }
        // Utils.showSnackBar(event.context, "${acc.email}\n${acc.displayName}");
        ///
        if (auth.accessToken != null) {
          final body = <String, dynamic>{};

          body.addAll({'id': acc.id});
          body.addAll({'name': acc.displayName});
          body.addAll({'username': acc.displayName});
          body.addAll({'email': acc.email});
          body.addAll({'token': auth.accessToken});
          body.addAll({'provider': 'google'});

          print(auth.accessToken);

          final result = await authRepository.socialLogin(body);

          print(result);

          result.fold(
            (Failure failure) {
              // Utils.closeDialog(Get.context!);
            },
            (user) {
              // print("gggggggggggggg $user ggggggggggggg");
              // Utils.closeDialog(Get.context!);
              _user = user;
              Get.offAndToNamed(Routes.main);
            },
          );
        }

        // final result = await authRepository.socialLogin(body);
        //
        // print(result);
        //
        // result.fold(
        //       (Failure failure) {
        //     Utils.closeDialog(Get.context!);
        //   },
        //       (user) {
        //     print("gggggggggggggg $user ggggggggggggg");
        //     Utils.closeDialog(Get.context!);
        //     _user = user;
        //   },
        // );

        ///
        // Helper().toastMsg("${acc.email}\n${acc.displayName}");
        // socialLogin(acc.id,acc.displayName, acc.email, acc.photoUrl,google);

        // acc.authentication.then((GoogleSignInAuthentication auth) async {
        //   print('Auth id token${auth.idToken!}');
        //   print('Auth access token${auth.accessToken!}');
        // });
      });

      // final GoogleSignInAccount? googleSignInAccount =
      //     await googleSignIn.signIn();
      // final GoogleSignInAuthentication googleSignInAuthentication =
      //     await googleSignInAccount!.authentication;
      // final AuthCredential credential = GoogleAuthProvider.credential(
      //   accessToken: googleSignInAuthentication.accessToken,
      //   idToken: googleSignInAuthentication.idToken,
      // );
      // return await _auth.signInWithCredential(credential);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
