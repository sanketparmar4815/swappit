import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';

class ReviewDetailsController extends GetxController {
  var onTapBack = false.obs;
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

  List reviewList = [
    {
      'image': assetsUrl.searchProfileImg,
      'name': "Eleanor Pena",
    },
    {
      'image': assetsUrl.messageProfile,
      'name': "Eleanor Pena",
    },
    {
      'image': assetsUrl.messageProfile2,
      'name': "Eleanor Pena",
    },
    {
      'image': assetsUrl.notificationProfile,
      'name': "Eleanor Pena",
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': "Eleanor Pena",
    },
    {
      'image': assetsUrl.messageProfile,
      'name': "Eleanor Pena",
    },
    {
      'image': assetsUrl.messageProfile2,
      'name': "Eleanor Pena",
    },
  ];
}
