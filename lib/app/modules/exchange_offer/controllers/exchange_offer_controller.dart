import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ExchangeOfferController extends GetxController {
  TextEditingController productName = TextEditingController();
  TextEditingController productDesc = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var flag;

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

  var imagePath, image, imageText, onTapBack = false.obs;
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
