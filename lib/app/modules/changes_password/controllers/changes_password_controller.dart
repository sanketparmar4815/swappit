import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangesPasswordController extends GetxController {
  TextEditingController newPassword = TextEditingController();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var isVisibility = true.obs, isVisibility2 = true.obs, isVisibility3 = true.obs, onTapBack = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
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
}
