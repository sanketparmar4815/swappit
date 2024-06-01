import 'package:get/get.dart';

import '../controllers/add_majestic_item_controller.dart';

class AddMajesticItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMajesticItemController>(
      () => AddMajesticItemController(),
    );
  }
}
