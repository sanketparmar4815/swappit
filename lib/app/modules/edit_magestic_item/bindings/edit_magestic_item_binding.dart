import 'package:get/get.dart';

import '../controllers/edit_magestic_item_controller.dart';

class EditMagesticItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMagesticItemController>(
      () => EditMagesticItemController(),
    );
  }
}
