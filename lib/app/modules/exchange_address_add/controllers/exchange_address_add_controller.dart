import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeAddressAddController extends GetxController {
  var onTapBack = false.obs;
  TextEditingController state = TextEditingController();
  TextEditingController streetaddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController apartmentName = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
