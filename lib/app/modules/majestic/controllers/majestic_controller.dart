import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';

class MajesticController extends GetxController {
  TextEditingController searchText = TextEditingController();
  var text = false.obs;
  var onTapBack = false.obs;
  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();

  var isLodding = true.obs;
  @override
  void onInit() {
    isLodding.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLodding.value = false;
      update();
      print("isLodding.value---${isLodding.value}");
    });
    scrollControllerMajestic!..addListener(listenMajesticView);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var isVisible = true.obs;
  listenMajesticView() {
    final direction = scrollControllerMajestic!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombar");
      isVisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombar");
      isVisible.value = false;
    }
  }

  List majesticList = [
    {
      'image': "assets/image/majesticImg1.png",
      'name': "Jumpsuit",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg2.png",
      'name': "Girls Top",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg3.png",
      'name': "Romper",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg4.png",
      'name': "Pent",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg1.png",
      'name': "Jumpsuit",
      'desc': "New Winter Wear",
    },
    {
      'image': "assets/image/majesticImg2.png",
      'name': "Girls Top",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg3.png",
      'name': "Romper",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg4.png",
      'name': "Pent",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg3.png",
      'name': "Romper",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg4.png",
      'name': "Pent",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg3.png",
      'name': "Romper",
      'desc': "Unique Collection",
    },
    {
      'image': "assets/image/majesticImg4.png",
      'name': "Pent",
      'desc': "Unique Collection",
    },
  ];
}
