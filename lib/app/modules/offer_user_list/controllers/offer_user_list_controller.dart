import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';

class OfferUserListController extends GetxController {
  var onTapBack = false.obs, isLoading = true.obs;
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

  List offerList = [
    {
      'name': 'Carmen Adele',
      'image': assetsUrl.notificationProfile,
    },
    {
      'name': 'Grace Moore',
      'image': assetsUrl.searchProfileImg,
    },
    {
      'name': 'Brooklyn Simmons',
      'image': assetsUrl.messageProfile,
    },
    {
      'name': 'Albert Flores',
      'image': assetsUrl.messageProfile2,
    },
  ];
}
