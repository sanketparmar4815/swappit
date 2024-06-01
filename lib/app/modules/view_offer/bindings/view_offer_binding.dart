import 'package:get/get.dart';

import '../controllers/view_offer_controller.dart';

class ViewOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewOfferController>(
      () => ViewOfferController(),
    );
  }
}
