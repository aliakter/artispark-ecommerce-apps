import 'package:artispark/apps/views/favourite/favourite_main_screen.dart';
import 'package:artispark/apps/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../compare/screens/compare_screen.dart';
import '../../home/home_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainController extends GetxController {
  RxInt pageIndex = 0.obs;
  var pageController = PageController(initialPage: 0);

  List<Widget> screenList = [
    const HomeScreen(),
    const SearchScreen(),
    FavouriteMainScreen(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    pageIndex.value = index;
    update();
  }

  void onBackPressed(context) async {
    if (pageIndex.value != 0) {
      changePage(0);
      pageController.jumpToPage(0);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          title: Text(
            'Are you sure you want to close application?',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
