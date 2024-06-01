import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';

class SeeAllCategoryController extends GetxController {
  var onTapBack = false.obs, flag, selectCategoryName, selectedIndex;
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

  List categoryList = [
    {
      'icon': assetsUrl.clothesIcon,
      'name': 'Clothes',
    },
    {
      'icon': assetsUrl.BagsIcon,
      'name': 'Accessories',
    },
    {
      'icon': assetsUrl.dumble,
      'name': 'Sports Gear',
    },
    {
      'icon': assetsUrl.ElectronicsIcon,
      'name': 'Electronics',
    },
  ];
}
