import 'dart:async';
import 'package:artispark/apps/global_widget/push_notification.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../../core/utils/constants.dart';
import '../../../routes/routes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class SplashController extends GetxController {
  final LoginController loginController;

  SplashController(this.loginController);

  RxBool isLoading = false.obs;
  final formatter = DateFormat("yyyy-MM-dd hh:mm");
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  PushNotification? _notificationInfo;

  @override
  void onInit() {
    super.onInit();
    registerNotification();
    checkForInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      _notificationInfo = notification;
    });
    startTime();
  }

  void registerNotification() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );

        _notificationInfo = notification;
        print(_notificationInfo!.title);
        print(_notificationInfo!.body);

        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            subtitle: Text(_notificationInfo!.body!),
            elevation: 0,
            background: Colors.white,
            foreground: primaryColor,
            slideDismiss: true,
            duration: const Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      _notificationInfo = notification;
    }
  }

  startTime() async {
    isLoading.value = false;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (loginController.isLoggedIn) {
        return Timer(splashKDuration, navigateToMainPage);
      } else {
        return Timer(splashKDuration, navigateToMainPage);
      }
    } else {
      return Timer(splashKDuration, noInternetPage);
    }
  }

  void navigateToMainPage() {
    Get.offAllNamed(Routes.main);
  }

  void noInternetPage() {
    Get.offAllNamed(Routes.noInternet);
  }

  void navigateToLoginPage() {
    Get.offAllNamed(Routes.login);
  }
}
