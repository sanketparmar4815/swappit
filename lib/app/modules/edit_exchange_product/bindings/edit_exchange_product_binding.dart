import 'package:get/get.dart';

import '../controllers/edit_exchange_product_controller.dart';

class EditExchangeProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditExchangeProductController>(
      () => EditExchangeProductController(),
    );
  }
}
