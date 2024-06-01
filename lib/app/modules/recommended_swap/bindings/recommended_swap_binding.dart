import 'package:get/get.dart';

import '../controllers/recommended_swap_controller.dart';

class RecommendedSwapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendedSwapController>(
      () => RecommendedSwapController(),
    );
  }
}
