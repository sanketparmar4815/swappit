import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  var titleName, isLoading = true.obs, onTapBack = false.obs;
  List isLike = [];

  List isAnimationList = [true, true, true];
  @override
  void onInit() {
    if (Get.arguments != null) {
      titleName = Get.arguments['name'];
    }
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
