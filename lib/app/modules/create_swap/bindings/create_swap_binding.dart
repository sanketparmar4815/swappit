import 'package:get/get.dart';

import '../controllers/create_swap_controller.dart';

class CreateSwapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateSwapController>(
      () => CreateSwapController(),
    );
  }
}
