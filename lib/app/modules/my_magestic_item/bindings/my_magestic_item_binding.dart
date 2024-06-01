import 'package:get/get.dart';

import '../controllers/my_magestic_item_controller.dart';

class MyMagesticItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyMagesticItemController>(
      () => MyMagesticItemController(),
    );
  }
}
