import 'dart:io';
import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/k_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar(
      {super.key,
      required this.height,
      required this.width,
      required this.image,
      this.network = false,
      this.file = false});

  final double height, width;
  final String image;
  final bool network, file;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 3.w),
        borderRadius: BorderRadius.circular(90),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: file
            ? Image.file(File(image), fit: BoxFit.cover)
            : network
                ? CachedNetworkImage(
                    height: height,
                    width: width,
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset(KImages.defaultImage, fit: BoxFit.cover),
                  )
                : Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
