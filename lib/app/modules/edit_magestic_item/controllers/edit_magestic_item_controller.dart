import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditMagesticItemController extends GetxController {
  var onTapBack = false.obs;
  TextEditingController productName = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  ScrollController? scrollController = ScrollController();
  var isErrorText;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    productName.text = "Jumpsuit";
    productCategory.text = "Unique Collection";
    price.text = "\$45.00";
    productDescription.text = "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset";
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
