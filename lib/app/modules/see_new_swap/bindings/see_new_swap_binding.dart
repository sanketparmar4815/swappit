import 'package:get/get.dart';

import '../controllers/see_new_swap_controller.dart';

class SeeNewSwapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeNewSwapController>(
      () => SeeNewSwapController(),
    );
  }
}
