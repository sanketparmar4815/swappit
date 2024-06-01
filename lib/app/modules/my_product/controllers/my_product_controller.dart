import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/constant.dart';

class MyProductController extends GetxController {
  var isVisible = true.obs, isLoading = true.obs;
  RxInt campusSelected = 0.obs;
  List productStatus = [
    "Active",
    "Accepted",
    "Completed",
  ];
  TextEditingController deliveryPlatformName = TextEditingController();
  TextEditingController trackingId = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      update();
      print("isLodding.value---${isLoading.value}");
    });
    myProductScrollController?..addListener(listenMyProductView);
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

  listenMyProductView() {
    final direction = myProductScrollController!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombarfokvfokvfb");
      isVisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombarfbl,fbf");
      isVisible.value = false;
    }
  }
}
