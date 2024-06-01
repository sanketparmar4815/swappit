import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';

class MyFavouriteController extends GetxController {
  List isLike = [];
  List isAnimationList = [true, true, true, true, true];
  var isLoading = true.obs, onTapBack = false.obs;
  @override
  void onInit() {
    isLoading.value = true;
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

  List favourite = [
    {
      'image': assetsUrl.searchProfileImg,
    },
    {
      'image': assetsUrl.messageProfile,
    },
    {
      'image': assetsUrl.messageProfile2,
    },
    {
      'image': assetsUrl.notificationProfile,
    },
    {
      'image': assetsUrl.searchProfileImg,
    },
  ];
}
