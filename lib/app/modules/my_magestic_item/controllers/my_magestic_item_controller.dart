import 'package:get/get.dart';

class MyMagesticItemController extends GetxController {
  var onTapBack = false.obs, isLoading = true.obs;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      update();
      print("isLodding.value---${isLoading.value}");
    });
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

  List majesticList = [
    {
      'image': "assets/image/majesticImg1.png",
    },
    {
      'image': "assets/image/majesticImg2.png",
    },
    {
      'image': "assets/image/majesticImg3.png",
    },
    {
      'image': "assets/image/majesticImg4.png",
    },
    {
      'image': "assets/image/majesticImg1.png",
    },
    {
      'image': "assets/image/majesticImg2.png",
    },
    {
      'image': "assets/image/majesticImg3.png",
    },
    {
      'image': "assets/image/majesticImg4.png",
    },
    {
      'image': "assets/image/majesticImg3.png",
    },
    {
      'image': "assets/image/majesticImg4.png",
    },
    {
      'image': "assets/image/majesticImg3.png",
    },
    {
      'image': "assets/image/majesticImg4.png",
    },
  ];
}
