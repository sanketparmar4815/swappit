import 'package:get/get.dart';

import '../controllers/review_details_controller.dart';

class ReviewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewDetailsController>(
      () => ReviewDetailsController(),
    );
  }
}
