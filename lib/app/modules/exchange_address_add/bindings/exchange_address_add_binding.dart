import 'package:get/get.dart';

import '../controllers/exchange_address_add_controller.dart';

class ExchangeAddressAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExchangeAddressAddController>(
      () => ExchangeAddressAddController(),
    );
  }
}
