import 'package:artispark/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:artispark/apps/views/profile_update/widgets/basic_info_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/change_password.dart';
import '../widgets/delete_account.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account setting"),
      ),
      body: Obx(
        () => controller.isEditLoading.value
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return controller.getPublicProfile();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      sliver: SliverToBoxAdapter(
                        child: BasicInfoEdit(
                          profile: controller.publicProfileModel,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      sliver: SliverToBoxAdapter(
                        child: ChangePassEdit(),
                      ),
                    ),
                    // const SliverPadding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    //   sliver: SliverToBoxAdapter(
                    //     child: DeleteAccount(),
                    //   ),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
