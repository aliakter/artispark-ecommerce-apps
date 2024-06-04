import 'package:artispark/apps/views/favourite/component/favourite_list.dart';
import 'package:artispark/apps/views/favourite/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Get.find();

    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        sliver: MultiSliver(
          children: [
            SliverLayoutBuilder(builder: (context, constraints) {
              if (controller.favouriteModel!.data.isNotEmpty) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 250,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                        FavouriteProductCard(
                          adModel: Get
                              .find<FavouriteController>()
                              .favouriteModel!
                              .data[index],
                        ),
                    childCount: Get
                        .find<FavouriteController>()
                        .favouriteModel!
                        .data
                        .length,
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 600,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black54)),
                          child: const Text(
                            "Products Not Found",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ),
                );
              }
            },
            )
          ],
        ),
    );
  }
}
