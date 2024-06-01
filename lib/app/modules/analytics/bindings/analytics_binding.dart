import 'package:get/get.dart';

import '../controllers/analytics_controller.dart';

class AnalyticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalyticsController>(
      () => AnalyticsController(),
    );
  }
}
