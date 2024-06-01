import 'package:get/get.dart';
import 'package:swapit/app/common/string.dart';

class AddNewSwapProductController extends GetxController {
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

  List addSwapList = [
    {
      'text1': stringsUtils.swaps,
      'text2': stringsUtils.createSwap,
    },
    {
      'text1': stringsUtils.workit,
      'text2': stringsUtils.freelanceWork,
    },
    {
      'text1': stringsUtils.campus,
      'text2': stringsUtils.shareMaterial,
    },
  ];
}
