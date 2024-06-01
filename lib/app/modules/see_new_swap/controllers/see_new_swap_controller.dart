import 'package:get/get.dart';

class SeeNewSwapController extends GetxController {
  List isLike = [];
  List isAnimationList = [true, true, true];
  var isLoading = true.obs, onTapBack = false.obs;
  @override
  void onInit() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 3), () {
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
}
