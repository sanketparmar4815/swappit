import 'package:get/get.dart';

import '../controllers/changes_password_controller.dart';

class ChangesPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangesPasswordController>(
      () => ChangesPasswordController(),
    );
  }
}
