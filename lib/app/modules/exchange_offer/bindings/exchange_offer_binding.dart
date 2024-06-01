import 'package:get/get.dart';

import '../controllers/exchange_offer_controller.dart';

class ExchangeOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExchangeOfferController>(
      () => ExchangeOfferController(),
    );
  }
}
