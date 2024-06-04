import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/global_widget/custom_text_feild.dart';
import 'package:artispark/apps/views/ads/component/ads_appbar.dart';
import 'package:artispark/apps/views/ads/controller/ads_controller.dart';
import 'package:artispark/apps/views/home/component/grid_product_container2.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/city_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AdsScreen extends GetView<AdsController> {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF6F7FE),
          body: RefreshIndicator(
            onRefresh: () async {
              return controller.changePage();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              scrollDirection: Axis.vertical,
              slivers: [
                MultiSliver(children: [
                  AdsAppBar.appBar(context),

                  ///Search and Filtering area
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 14, bottom: 14),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        color: Color(0XFFF7E7F3),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 8),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Obx(
                              () => DropdownButtonFormField<Categories>(
                                isExpanded: true,
                                decoration:
                                    const InputDecoration(hintText: "Category"),
                                value: controller.category,
                                items: controller.categoryList.value
                                    .map<DropdownMenuItem<Categories>>((e) {
                                  return DropdownMenuItem<Categories>(
                                    value: e,
                                    child: Text(e.name),
                                  );
                                }).toList(),
                                onChanged: (Categories? value) {
                                  controller.categoryValue.value =
                                      value!.slug.toString();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Obx(() => DropdownButtonFormField<CityModel>(
                              isExpanded: true,
                              decoration:
                              const InputDecoration(hintText: "City"),
                              value: controller.city,
                              items: controller.cities.value
                                  .map<DropdownMenuItem<CityModel>>((e) {
                                return DropdownMenuItem<CityModel>(
                                    value: e, child: Text(e.name));
                              }).toList(),
                              onChanged: (CityModel? value) {
                                controller.changeCity(value!);
                                // controller.getSubcategory(value!);
                                // setState(() {
                                //   subCategory = null;
                                // });
                                // postAdBloc.add(NewPostAdEventSubCategory(value!.id.toString(),value));
                              },
                            )),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                ///Search text filed
                                Expanded(
                                  flex: 2,
                                  child: CustomTextField(
                                    isObsecure: false,
                                    controller: controller
                                        .homeController.searchController,
                                    hintext: "What are you looking for?",
                                    // onChanged: (value) {
                                    //controller.getAdsListData();
                                    // },
                                  ),
// =======
//                             Expanded(
//                               child: SizedBox(
//                                 height: 48,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     Utils.closeKeyBoard(context);
//                                     controller.getAdsListData();
//                                     // setState(() {
//                                     // Future.microtask(() => context.read<SearchAdsBloc>().add(SearchAdsEventSearch(context.read<SearchAdsBloc>().searchController.text.trim(),'','','','','',categoryBloc.categorySlug,'',selectedCity==null?'':selectedCity,'', context.read<AppSettingCubit>().location.isEmpty ? context.read<AppSettingCubit>().defaultLocation.toString() :  context.read<AppSettingCubit>().location)));
//                                     // });
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                       shape: const RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.zero),
//                                       backgroundColor: primaryColor),
//                                   child: const Text("Find it"),
// >>>>>>> ashraful
                                ),

                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Utils.closeKeyBoard(context);
                                        controller.getAdsListData();
                                        // setState(() {
                                        // Future.microtask(() => context.read<SearchAdsBloc>().add(SearchAdsEventSearch(context.read<SearchAdsBloc>().searchController.text.trim(),'','','','','',categoryBloc.categorySlug,'',selectedCity==null?'':selectedCity,'', context.read<AppSettingCubit>().location.isEmpty ? context.read<AppSettingCubit>().defaultLocation.toString() :  context.read<AppSettingCubit>().location)));
                                        // });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                          backgroundColor: primaryColor),
                                      child: const Text("Find it"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Custom Price filtering
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //               child: CustomTextField(
                  //                 isObsecure: false,
                  //                 controller: controller.minPriceController,
                  //                 hintext: 'Min',
                  //                 keyboardType: TextInputType.number,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               width: 6,
                  //             ),
                  //             Expanded(
                  //               child: CustomTextField(
                  //                 isObsecure: false,
                  //                 controller: controller.maxPriceController,
                  //                 hintext: "Max",
                  //                 keyboardType: TextInputType.number,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               width: 6,
                  //             ),
                  //             Expanded(
                  //               child: SizedBox(
                  //                 height: 50,
                  //                 child: ElevatedButton(
                  //                   onPressed: () {
                  //                     // Utils.closeDialog(context);
                  //                     // Future.microtask(() => context.read<SearchAdsBloc>().add(SearchAdsEventSearch('',minPriceController.text,maxPriceController.text,'','','',categoryBloc.categorySlug,'','','',context.read<AppSettingCubit>().location.isEmpty ? context.read<AppSettingCubit>().defaultLocation.toString() :  context.read<AppSettingCubit>().location)));
                  //                     // setState(() {
                  //                     //   context.read<SearchAdsBloc>().add(SearchAdsEventSearch("",minPriceController.text,maxPriceController.text,'','','',"",'','','',));
                  //                     // });
                  //
                  //                     Utils.closeKeyBoard(context);
                  //                     controller.getAdsListData();
                  //                   },
                  //                   style: ElevatedButton.styleFrom(
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius:
                  //                             BorderRadius.circular(4),
                  //                       ),
                  //                       // backgroundColor: const Color(0xFF212d6e)),
                  //                       backgroundColor: redColor),
                  //                   child: Text("Apply"),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 20),
                  //
                  //         /// Filtering dropdown
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               "Ads",
                  //               style: const TextStyle(
                  //                   fontSize: 18,
                  //                   height: 1.5,
                  //                   fontWeight: FontWeight.w600),
                  //             ),
                  //             const SizedBox(
                  //               width: 50,
                  //             ),
                  //             Obx(() {
                  //               return Expanded(
                  //                 child: Container(
                  //                   height: 40,
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 5),
                  //                   decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                           color: Colors.grey.shade400),
                  //                       borderRadius: BorderRadius.circular(8)),
                  //                   child: DropdownButtonHideUnderline(
                  //                     child: DropdownButton<String>(
                  //                       hint: const Text('Sort By',
                  //                           style:
                  //                               TextStyle(color: Colors.black)),
                  //                       isDense: true,
                  //                       isExpanded: true,
                  //                       onChanged: (dynamic value) {
                  //                         controller.selectedSortingValue
                  //                             .value = value;
                  //                         controller.getAdsListData();
                  //                         // context.read<SearchAdsBloc>().add(SearchAdsEventSearch("${context.read<SearchAdsBloc>().searchController.text.trim()}",'','','',selectedSortingValue!,'',"",'',selectedCity==null?'':selectedCity,'',context.read<AppSettingCubit>().location.isEmpty ? context.read<AppSettingCubit>().defaultLocation.toString() :  context.read<AppSettingCubit>().location));
                  //                         print(
                  //                             "jhgdhjghjc ${controller.selectedSortingValue.value}");
                  //                         // setState(() {});
                  //                       },
                  //                       value: controller.selectedSortingValue
                  //                                   .value ==
                  //                               ""
                  //                           ? null
                  //                           : controller
                  //                               .selectedSortingValue.value,
                  //                       items:
                  //                           myItemSortListData.map((location) {
                  //                         return DropdownMenuItem<String>(
                  //                           value: location['value'],
                  //                           child: Text("${location['name']}"),
                  //                         );
                  //                       }).toList(),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             }),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 10)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //               child: CustomTextField(
                  //                 isObsecure: false,
                  //                 controller: controller.minPriceController,
                  //                 hintext: "Min",
                  //                 keyboardType: TextInputType.number,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               width: 6,
                  //             ),
                  //             Expanded(
                  //               child: CustomTextField(
                  //                 isObsecure: false,
                  //                 controller: controller.maxPriceController,
                  //                 hintext: 'Max',
                  //                 keyboardType: TextInputType.number,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               width: 6,
                  //             ),
                  //             Expanded(
                  //               child: SizedBox(
                  //                 height: 50,
                  //                 child: ElevatedButton(
                  //                   onPressed: () {
                  //                     // Utils.closeDialog(context);
                  //                     // Future.microtask(() => context.read<SearchAdsBloc>().add(SearchAdsEventSearch('',minPriceController.text,maxPriceController.text,'','','',categoryBloc.categorySlug,'','','',context.read<AppSettingCubit>().location.isEmpty ? context.read<AppSettingCubit>().defaultLocation.toString() :  context.read<AppSettingCubit>().location)));
                  //                     // setState(() {
                  //                     //   context.read<SearchAdsBloc>().add(SearchAdsEventSearch("",minPriceController.text,maxPriceController.text,'','','',"",'','','',));
                  //                     // });
                  //
                  //                     Utils.closeKeyBoard(context);
                  //                     controller.getAdsListData();
                  //                   },
                  //                   style: ElevatedButton.styleFrom(
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius:
                  //                             BorderRadius.circular(4),
                  //                       ),
                  //                       // backgroundColor: const Color(0xFF212d6e)),
                  //                       backgroundColor: primaryColor),
                  //                   child: Text('Apply'),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 20),
                  //
                  //         /// Filtering dropdown
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'Ads',
                  //               style: const TextStyle(
                  //                   fontSize: 18,
                  //                   height: 1.5,
                  //                   fontWeight: FontWeight.w600),
                  //             ),
                  //             const SizedBox(width: 50),
                  //             Obx(() {
                  //               return Expanded(
                  //                 child: Container(
                  //                   height: 40,
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 5),
                  //                   decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                           color: Colors.grey.shade400),
                  //                       borderRadius: BorderRadius.circular(8)),
                  //                   child: DropdownButtonHideUnderline(
                  //                     child: DropdownButton<String>(
                  //                       hint: const Text('Sort By',
                  //                           style:
                  //                               TextStyle(color: Colors.black)),
                  //                       isDense: true,
                  //                       isExpanded: true,
                  //                       onChanged: (dynamic value) {
                  //                         controller.selectedSortingValue
                  //                             .value = value;
                  //                         controller.getAdsListData();
                  //                         // context.read<SearchAdsBloc>().add(SearchAdsEventSearch("${context.read<SearchAdsBloc>().searchController.text.trim()}",'','','',selectedSortingValue!,'',"",'',selectedCity==null?'':selectedCity,'',context.read<AppSettingCubit>().location.isEmpty ? context.read<AppSettingCubit>().defaultLocation.toString() :  context.read<AppSettingCubit>().location));
                  //                         print(
                  //                             "jhgdhjghjc ${controller.selectedSortingValue.value}");
                  //                         // setState(() {});
                  //                       },
                  //                       value: controller.selectedSortingValue
                  //                                   .value ==
                  //                               ""
                  //                           ? null
                  //                           : controller
                  //                               .selectedSortingValue.value,
                  //                       items:
                  //                           myItemSortListData.map((location) {
                  //                         return DropdownMenuItem<String>(
                  //                           value: location['value'],
                  //                           child: Text("${location['name']}"),
                  //                         );
                  //                       }).toList(),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             }),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 10)
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Obx(
                    () => controller.isLoading.value
                        ? SizedBox(
                            height: MediaQuery.of(context).size.width * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: primaryColor),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "All Products",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GridProductContainer2(
                                onPressed: () {},
                                adModelList: controller.adsList,
                                homeController: controller.homeController,
                              ),
                              Visibility(
                                visible: controller.gettingMoreData.value,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: const Center(
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator()),
                                    )),
                              ),
                            ],
                          )),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      );
    });
  }
}
