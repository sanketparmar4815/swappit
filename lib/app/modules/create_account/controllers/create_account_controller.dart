import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/constant.dart';

class CreateAccountController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirPassword = TextEditingController();
  var isVisibility = true.obs, isVisibility2 = true.obs;
  var leftAnimation = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getDeviceId();
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

  onWillPopScope() {
    Get.back();
    leftAnimation.value = true;
    print("dsvihsovh");
  }
}
