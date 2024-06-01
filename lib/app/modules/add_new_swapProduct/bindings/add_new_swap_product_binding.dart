import 'package:get/get.dart';

import '../controllers/add_new_swap_product_controller.dart';

class AddNewSwapProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewSwapProductController>(
      () => AddNewSwapProductController(),
    );
  }
}
