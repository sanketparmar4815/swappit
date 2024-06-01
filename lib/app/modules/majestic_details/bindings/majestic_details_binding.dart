import 'package:get/get.dart';

import '../controllers/majestic_details_controller.dart';

class MajesticDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MajesticDetailsController>(
      () => MajesticDetailsController(),
    );
  }
}
