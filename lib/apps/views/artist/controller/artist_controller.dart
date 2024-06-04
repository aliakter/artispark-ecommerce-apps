import 'dart:convert';
import 'dart:io';

import 'package:artispark/apps/views/artist/model/artist_model.dart';
import 'package:artispark/apps/views/story/model/story_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:artispark/apps/views/auth/login/controller/login_controller.dart';
import 'package:artispark/apps/views/home/models/brand_model.dart';
import 'package:artispark/apps/views/home/models/category_model.dart';
import 'package:artispark/apps/views/home/models/home_model.dart';
import 'package:artispark/apps/views/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main.dart';

class ArtistController extends GetxController {
  final HomeRepository homeRepository;
  final LoginController loginController;

  ArtistController(this.homeRepository, this.loginController);

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getArtistList();
    // TODO: implement onInit
    super.onInit();
  }

  List<ArtistsModel> artistList = [];
  Future<void> getArtistList() async {
    isLoading.value = true;
    final result =
    await homeRepository.getAllArtistList(loginController.userInfo?.token ?? "");
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      artistList = data;
      isLoading.value = false;
    });
  }

}
