import 'package:get/get.dart';

import '../controllers/majestic_controller.dart';

class MajesticBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MajesticController>(
      () => MajesticController(),
    );
  }
}
