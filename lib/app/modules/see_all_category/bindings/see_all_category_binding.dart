import 'package:get/get.dart';

import '../controllers/see_all_category_controller.dart';

class SeeAllCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllCategoryController>(
      () => SeeAllCategoryController(),
    );
  }
}
