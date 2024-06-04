import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/utils.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(
      {Key? key,
      required this.productId,
      this.from,
      required this.isFav,
      this.adsUserId,
      this.logInUserId,
      required this.controller})
      : super(key: key);
  final int productId;
  final bool isFav;
  final String? from;
  final int? adsUserId;
  final int? logInUserId;
  final HomeController controller;

  final double height = 28;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: Utils.isShowFavorite(context),
      visible: true,
      child: InkWell(
          onTap: () async {
            print(
                "${Get.find<LoginController>().userInfo?.user.id} log in id && $adsUserId");

            if (Get.find<LoginController>().userInfo?.user.id == adsUserId &&
                from != 'wist_list_screen') {
              print("This is your ads");
              Utils.showSnackBar(
                  context, "You can not add your ads to your favorite list ");
            } else {
              controller.setUnsetWishlist(productId.toString());
            }
          },
          child: isFav
              ? Icon(
                  Icons.favorite,
                  color: Colors.grey.shade800,
                  size: 20,
                )
              : Icon(
                  Icons.favorite_outline,
                  color: Colors.grey.shade500,
                  size: 20,
                )),
    );
  }
}
