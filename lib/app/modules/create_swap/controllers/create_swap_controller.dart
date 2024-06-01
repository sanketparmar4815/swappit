import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateSwapController extends GetxController {
  var onTapBack = false.obs;
  TextEditingController productName = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController preferredExchangeAddress = TextEditingController();
  ScrollController? scrollController = ScrollController();
  var isErrorText;
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

  var imagePath;
  final picker = ImagePicker();

  fromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      imagePath = pickedFile.path;
    } else {
      print('No image selected.');
    }
    update();
  }
}
