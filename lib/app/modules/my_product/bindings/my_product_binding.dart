import 'package:get/get.dart';

import '../controllers/my_product_controller.dart';

class MyProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductController>(
      () => MyProductController(),
    );
  }
}
