import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swapit/app/modules/bottombar/controllers/bottombar_controller.dart';
import 'package:swapit/app/modules/bottombar/views/bottombar_view.dart';

class ChatController extends GetxController {
  TextEditingController messageText = TextEditingController();
  var showSendButton = false.obs;

  var flag;
  var isVisible = false.obs, onTapBack = false.obs;
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

  List chatList = [
    {'type': 1, 'text': 'Yes We will Meet Soon!'},
    {'type': 0, 'text': 'Hello, sunshine! How are you? Oh, your rays are already making my day brighter!'},
    {'type': 1, 'text': 'How i Help You? Share Your Details'},
    {'type': 0, 'text': 'How i Help You? Share Your Details'},
    {'type': 1, 'text': 'Yes We will Meet Soon!'},
    {'type': 0, 'text': 'Hello, sunshine! How are you? Oh, your rays are already making my day brighter!'},
  ];

  var imagePath, image;
  final picker = ImagePicker();

  fromCamera({argument}) async {
    final pickedFile = await picker.pickImage(source: argument == 1 ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      imagePath = pickedFile.path;
    } else {
      print('No image selected.');
    }
    update();
  }

  onWillPopScope() {
    if (flag == 1 || flag == 2) {
      Get.back();
      Get.back();
      Get.back();
      BottombarController controller = Get.find();
      controller.intPage.value = 1;
      controller.pageController.jumpToPage(1);
    } else {
      Get.back();
    }
  }
}
