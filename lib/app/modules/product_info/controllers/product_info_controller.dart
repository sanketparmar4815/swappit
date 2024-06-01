import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductInfoController extends GetxController with GetSingleTickerProviderStateMixin {
  var isLike = false.obs, flag, flag2, editFlag, onTapBack = false.obs, yourDeliveryPlatformName, yourTrackingId;
  var isVisible = false, productSold = false;
  TextEditingController deliveryPlatformName = TextEditingController();
  TextEditingController trackingId = TextEditingController();
  var ishartFillIcon = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    if (Get.arguments != null) {
      flag = Get.arguments['flag'];
      flag2 = Get.arguments['flag2'];
      editFlag = Get.arguments['editFlag'];
    }

    print("flag2 is ${editFlag}");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  launchURLPhone(url) async {
    var linkUrl;
    // Uri linkUrl = Uri(scheme: "tel", path: url);

    print(url);
    print("dukhvdsvuid is Android");
    linkUrl = "tel:$url";

    if (await launchUrl(Uri.parse(linkUrl.toString()))) {}
  }
}
