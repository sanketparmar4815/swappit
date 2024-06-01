import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  TextEditingController otpPin = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var flag, isBack = false.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      flag = Get.arguments['flag'];
    }
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

  // onWillPopScope() {
  //   Get.back();
  //   leftAnimation.value = true;
  //   print("dsvihsovh");
  // }
}
