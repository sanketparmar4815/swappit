import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditExchangeProductController extends GetxController {
  var onTapBack = false.obs, editFlag;
  TextEditingController productCategory = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController exchangeAddress = TextEditingController();
  @override
  void onInit() {
    if (Get.arguments != null) {
      editFlag = Get.arguments['editFlag'];
    }
    productName.text = "Purple Shirt";
    productCategory.text = "Women Clothes";
    productDescription.text = "1 Piece Dress For Girls";
    exchangeAddress.text = "125, Blocker Street, New York, USA-214578";
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

  var imagePath, image;
  final picker = ImagePicker();

  fromCamera({flag}) async {
    final pickedFile = await picker.pickImage(source: flag == 0 ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      imagePath = pickedFile.path;
    } else {
      print('No image selected.');
    }
    update();
  }
}
