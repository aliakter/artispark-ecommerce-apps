import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/profile/controllers/profile_controller.dart';
import 'package:artispark/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.loginController.userInfo == null
            ? Center(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.login);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: const Text(
                "Signin Please",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
            : CustomScrollView(
          controller: controller.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverAppBar(
              title: Text("Overview"),
              pinned: true,
            ),
            _buildProfileOptions(context, controller),
            const SliverToBoxAdapter(child: SizedBox(height: 65)),
          ],
        ));
  }

  SliverPadding _buildProfileOptions(BuildContext context,
      ProfileController controller) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.dashBoard);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.home_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: const Text("Dashboard", style: TextStyle(fontSize: 16)),
            ),
            Visibility(
              visible: controller.loginController.userInfo!.user.userMode
                  .compareTo('1') ==
                  0,
              child: ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Get.toNamed(Routes.artistList);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.list,
                  size: 27,
                  color: Colors.black54,
                ),
                title:
                const Text("Artist List", style: TextStyle(fontSize: 16)),
              ),
            ),
            // ListTile(
            //   minLeadingWidth: 0,
            //   onTap: () {
            //     Get.toNamed(Routes.checkout);
            //   },
            //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            //   leading: const Icon(
            //     Icons.shopping_cart_outlined,
            //     size: 27,
            //     color: Colors.black54,
            //   ),
            //   title: Text(
            //       "Checkout",
            //       style: const TextStyle(fontSize: 16)),
            // ),
            Visibility(
              visible: controller.loginController.userInfo!.user.userMode
                  .compareTo('1') ==
                  0,
              child: ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Get.toNamed(Routes.challengeProduct);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.inventory_2_outlined,
                  size: 27,
                  color: Colors.black54,
                ),
                title: const Text("Challenge Product",
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.orderList);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.list,
                size: 27,
                color: Colors.black54,
              ),
              title: const Text("Order List", style: TextStyle(fontSize: 16)),
            ),
            Visibility(
              visible: controller.loginController.userInfo!.user.userMode
                  .compareTo('1') ==
                  0,
              child: ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Get.toNamed(Routes.storyList);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.list,
                  size: 27,
                  color: Colors.black54,
                ),
                title:
                const Text("Stories List", style: TextStyle(fontSize: 16)),
              ),
            ),
            Visibility(
              visible: controller.loginController.userInfo!.user.userMode
                  .compareTo('1') ==
                  0,
              child: ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Get.toNamed(Routes.publicProfile,
                      arguments:
                      controller.loginController.userInfo!.user.username);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.person_outline,
                  size: 27,
                  color: Colors.black54,
                ),
                title: const Text("Public Profile",
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            Visibility(
              visible: controller.loginController.userInfo!.user.userMode
                  .compareTo('1') ==
                  0,
              child: ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Get.toNamed(Routes.adPostScreen);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.add,
                  size: 27,
                  color: Colors.black54,
                ),
                title:
                const Text("Product Post", style: TextStyle(fontSize: 16)),
              ),
            ),
            Visibility(
              visible: controller.loginController.userInfo!.user.userMode
                  .compareTo('1') ==
                  0,
              child: ListTile(
                minLeadingWidth: 0,
                onTap: () {
                  Get.toNamed(Routes.customerAds);
                  // Navigator.pushNamed(context, RouteNames.customerAds);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: const Icon(
                  Icons.format_list_bulleted,
                  size: 27,
                  color: Colors.black54,
                ),
                title:
                const Text("My Products", style: TextStyle(fontSize: 16)),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.compareAds);
                // Navigator.pushNamed(context, RouteNames.compareScreen);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.change_circle_outlined,
                  size: 27, color: Colors.black54),
              title: const Text("Compare Products",
                  style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.favoriteAds);
                // Navigator.pushNamed(context, RouteNames.wishListScreen);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.favorite_outline,
                size: 27,
                color: Colors.black54,
              ),
              title: const Text("Wishlist Products",
                  style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.chat);
                // Navigator.pushNamed(context, RouteNames.chatScreen);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.question_answer_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: const Text("Chats", style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(Routes.editProfile,
                    arguments:
                    controller.loginController.userInfo!.user.username);
              },
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.settings_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: const Text("Settings", style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.exit_to_app_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: const Text("Logout", style: TextStyle(fontSize: 16)),
              onTap: () {
                sharedPreferences.clear();
                Get.offAllNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
