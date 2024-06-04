import 'package:artispark/apps/views/home/component/product_card.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/home/models/ad_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:flutter/material.dart';

// class GridProductContainer2 extends StatefulWidget {
//   const GridProductContainer2({
//     Key? key,
//     required this.adModelList, required this.onPressed,
//   }) : super(key: key);
//   final List<AdModel> adModelList;
//   final Function onPressed;
//
//   @override
//   State<GridProductContainer2> createState() => GridProductContainer2State();
// }

// class GridProductContainer2State extends State<GridProductContainer2> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           const SizedBox(height: 20),
//           LayoutBuilder(
//             builder: (context,constraints){
//               if (widget.adModelList.isNotEmpty) {
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                     mainAxisExtent: 300,
//                   ),
//                   itemBuilder: (context,index){
//                     return ProductCard(adModel: widget.adModelList[index],from: 'ads_screen',);
//                   },
//                   itemCount: widget.adModelList.length,
//                 );
//               } else {
//                 return SizedBox(
//                   height: 150,
//                   width: double.infinity,
//                   child: Center(
//                     child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(color: Colors.black54)
//                         ),
//                         child: const Text("Ads not found",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)),
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

class GridProductContainer2 extends StatelessWidget {
  const GridProductContainer2(
      {Key? key,
      required this.adModelList,
      required this.onPressed,
      required this.homeController})
      : super(key: key);
  final List<Ad> adModelList;
  final Function onPressed;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              if (adModelList.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 300),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      adModel: adModelList[index],
                      homeController: homeController,
                    );
                  },
                  itemCount: adModelList.length,
                );
              } else {
                return SizedBox(
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
                          "Ads not found",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
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