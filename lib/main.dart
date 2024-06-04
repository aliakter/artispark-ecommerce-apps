import 'package:artispark/apps/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:overlay_support/overlay_support.dart';
import 'apps/bindings/app_bindings.dart';
import 'apps/core/utils/my_theme.dart';
import 'apps/routes/pages.dart';

late final SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.openBox('compareList');
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    return ScreenUtilInit(
      designSize: const Size(344, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return OverlaySupport(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.theme,
            routingCallback: (routing) {
              if (routing?.current == Routes.initial) {
                if (kDebugMode) {
                  print(".................. main ................");
                }
              }
            },
            navigatorKey: navigatorKey,
            initialBinding: AppBindings(),
            transitionDuration: const Duration(milliseconds: 300),
            defaultTransition: Transition.cupertino,
            home: child,
            getPages: Pages.pages,
          ),
        );
      },
      child: Pages.initial,
    );
  }
}
