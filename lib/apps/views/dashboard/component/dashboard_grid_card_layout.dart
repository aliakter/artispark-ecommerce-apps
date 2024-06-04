import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';
import '../controller/dashboard_controller.dart';

class DashboardGridCardLayout extends StatefulWidget {
  const DashboardGridCardLayout({Key? key, required this.dashboardController})
      : super(key: key);

  final DashboardController dashboardController;

  @override
  State<DashboardGridCardLayout> createState() =>
      _DashboardGridCardLayoutState();
}

class _DashboardGridCardLayoutState extends State<DashboardGridCardLayout> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          widget.dashboardController.loginController.userInfo!.user.userMode
                      .compareTo('1') ==
                  0
              ? DCardView(
                  index: 0,
                  title: "Posted Products Count",
                  image: Icons.library_books_rounded,
                  color: Colors.blue,
                  value:
                      '${Get.find<DashboardController>().dashboardModel?.data.adsCount.postedAdsCount} \nproducts',
                )
              : DCardView(
                  index: 0,
                  title: "Orders Products Count",
                  image: Icons.library_books_rounded,
                  color: Colors.blue,
                  value:
                      '${Get.find<DashboardController>().dashboardModel?.data.ordersCount} \nproducts',
                ),
          DCardView(
            index: 1,
            title: "Favourite Products Count",
            image: Icons.done_outline,
            color: Colors.green,
            value:
                '${Get.find<DashboardController>().dashboardModel?.data.adsCount.favouriteAdsCount} \nproducts',
          ),
        ],
      ),
    );
  }

  String getGreenText(String title, int value) {
    if (title.contains("Remaining")) {
      return "Expiry Date : 12-08-23";
    } else if (title.contains("Expire")) {
      return '${(value / 2).floor()} Ads Expired';
    }
    return 'Last Week ${(value / 2).floor()} Ads';
  }
}

class DCardView extends StatelessWidget {
  const DCardView(
      {Key? key,
      required this.index,
      required this.title,
      required this.image,
      required this.color,
      required this.value})
      : super(key: key);
  final int index;
  final String title;
  final IconData image;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(950),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            const BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 3,
                color: ashColor,
                blurStyle: BlurStyle.inner)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: color.withOpacity(0.1),
                // elevation: 1,
                shadowColor: const Color(0xFFFFFFFF),
                borderOnForeground: true,
                shape: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    image,
                    color: color,
                    size: 10,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: SizedBox(
                      child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )))
            ],
          ),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
          const Spacer(),
          // Text(getGreenText(dashboardCardList[index].title,dashboardCardList[index].value),
          Text(
            '',
            style: TextStyle(
                color: index == 2 ? Colors.red : Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
