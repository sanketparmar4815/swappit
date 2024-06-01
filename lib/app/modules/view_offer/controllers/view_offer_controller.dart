import 'package:get/get.dart';

class ViewOfferController extends GetxController {
  var onTapBack = false.obs, flag, editFlag;
  var isVisible = false.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      flag = Get.arguments['flag'];
      editFlag = Get.arguments['editFlag'];
    }
    print("sdjhcihdvhd${editFlag}");
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
