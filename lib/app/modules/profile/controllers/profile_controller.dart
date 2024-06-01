import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/string.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  var onTapBack = false.obs;
  ScrollController? messageBodyController;
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
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

  List profileList = [
    {
      'icon': assetsUrl.heartBorder,
      'name': stringsUtils.myFavourite,
    },
    {
      'icon': assetsUrl.myOfferIcon,
      'name': stringsUtils.myOffers,
    },
    {
      'icon': assetsUrl.myMajesticIcon,
      'name': stringsUtils.myMagesticItem,
    },
    {
      'icon': assetsUrl.analiysticIcon,
      'name': stringsUtils.analytics,
    },
    {
      'icon': assetsUrl.changesPasswordIcon,
      'name': stringsUtils.changePassword,
    },
    {
      'icon': assetsUrl.contactUsIcon,
      'name': stringsUtils.contactUs,
    },
    {
      'icon': assetsUrl.termsIcon,
      'name': stringsUtils.termsAndConditions,
    },
    {
      'icon': assetsUrl.privcyIcon,
      'name': stringsUtils.privacyPolicy,
    },
    {
      'icon': assetsUrl.deleteBoxIcon,
      'name': stringsUtils.deleteAccount,
    },
  ];

  launchURLPhone(url) async {
    var linkUrl;
    // Uri linkUrl = Uri(scheme: "tel", path: url);

    print(url);
    print("dukhvdsvuid is Android");
    linkUrl = "$url";

    if (await launchUrl(Uri.parse(linkUrl.toString()))) {}
  }
}
