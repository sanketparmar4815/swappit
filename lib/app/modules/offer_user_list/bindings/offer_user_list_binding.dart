import 'package:get/get.dart';

import '../controllers/offer_user_list_controller.dart';

class OfferUserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferUserListController>(
      () => OfferUserListController(),
    );
  }
}
