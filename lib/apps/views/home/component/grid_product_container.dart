import 'package:artispark/apps/routes/routes.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/ad_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../main/controller/main_controller.dart';
import 'product_card.dart';

class GridProductContainer extends StatelessWidget {
  const GridProductContainer(
      {super.key,
      required this.adModelList,
      this.from,
      this.title,
      this.onPressed,
      required this.homeController});

  final List<Ad> adModelList;
  final String? title;
  final Function? onPressed;
  final String? from;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Visibility(
              visible: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverLayoutBuilder(
            builder: (context, constraints) {
              if (adModelList.isNotEmpty) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int pIndex) => ProductCard(
                      adModel: adModelList[pIndex],
                      index: pIndex, homeController: homeController,
                      // from: widget.from,
                      // logInUserId: logInBloc.userInfo?.user.id,
                    ),
                    childCount: adModelList.length,
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black54)),
                          child: const Text(
                            "Ads Not Found",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
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

// class GridProductContainer extends StatefulWidget {
//   const GridProductContainer(
//       {Key? key,
//       required this.adModelList,
//       this.from,
//       this.title,
//       this.onPressed})
//       : super(key: key);
//   final List<AdsModel> adModelList;
//   final String? title;
//   final Function? onPressed;
//   final String? from;
//
//   @override
//   State<GridProductContainer> createState() => GridProductContainerState();
// }
//
// class GridProductContainerState extends State<GridProductContainer> {
//   final MainController mainController = MainController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       sliver: MultiSliver(
//         children: [
//           SliverToBoxAdapter(
//             child: Visibility(
//               visible: true,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${widget.title}",
//                     style: TextStyle(
//                         fontSize: 14.sp,
//                         height: 1.5,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(child: SizedBox(height: 15)),
//           SliverLayoutBuilder(
//             builder: (context, constraints) {
//               if (widget.adModelList.isNotEmpty) {
//                 return SliverGrid(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                     mainAxisExtent: 250,
//                   ),
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int pIndex) => ProductCard(
//                       adModel: widget.adModelList[pIndex],
//                       index: pIndex,
//                       // from: widget.from,
//                       // logInUserId: logInBloc.userInfo?.user.id,
//                     ),
//                     childCount: widget.adModelList.length,
//                   ),
//                 );
//               } else {
//                 return SliverToBoxAdapter(
//                   child: SizedBox(
//                     height: 150,
//                     width: double.infinity,
//                     child: Center(
//                       child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(6),
//                               border: Border.all(color: Colors.black54)),
//                           child: const Text(
//                             "Ads Not Found",
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500),
//                           )),
//                     ),
//                   ),
//                 );
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
