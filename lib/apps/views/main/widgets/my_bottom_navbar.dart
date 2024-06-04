import 'package:artispark/apps/views/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontSize: 14, color: primaryColor),
      unselectedLabelStyle:
          const TextStyle(fontSize: 14, color: Color(0xff85959E)),
      elevation: 0,
      onTap: (index) {
        controller.changePage(index);
        controller.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      currentIndex: controller.pageIndex.value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: paragraphColor),
          activeIcon: Icon(Icons.home, color: primaryColor),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.search, color: primaryColor),
          icon: Icon(Icons.search, color: paragraphColor),
          label: "Search",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.favorite, color: primaryColor),
          icon: Icon(Icons.favorite_border_rounded, color: paragraphColor),
          label: "Liked",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.person, color: primaryColor),
          icon: Icon(Icons.person_outline, color: paragraphColor),
          label: "Profile",
        ),
      ],
    );
  }
}
