import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:artispark/apps/views/home/models/category_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NewAdPostCategoryChooser extends GetView<AdPostController> {
  const NewAdPostCategoryChooser(this.onPressed, this.categoryList,
      {super.key});

  final List<Categories> categoryList;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdPostController>(builder: (controller) {
      return CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Text("Select a category",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  )
                : SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var category = categoryList[index];
                          return Column(
                            children: [
                              Material(
                                color: secondaryColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(6),
                                child: InkWell(
                                  onTap: () {
                                    controller.getSubcategory(category.id);
                                    controller.selectedCategory =
                                        category.id.toString();
                                    Future.delayed(
                                            const Duration(milliseconds: 200))
                                        .then((value2) {
                                      onPressed();
                                    });
                                  },
                                  splashColor: secondaryColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Text(
                                              category.name,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Icon(Icons.arrow_forward)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                        childCount: categoryList.length,
                      ),
                    ),
                  ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          )
        ],
      );
    });
  }
}
