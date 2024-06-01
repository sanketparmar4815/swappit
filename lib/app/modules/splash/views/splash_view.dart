import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: color.appColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Center(
                  child: Image.asset(
                    "assets/image/splashLogoanimation.gif",
                    //assetsUrl.appicon,
                    height: MySize.getScaledSizeHeight(370),
                    width: MySize.getScaledSizeHeight(370),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: commonText.regularText(
                    "0.7",
                    tcolor: Colors.white,
                    fontsize: 14.0,
                  ),
                )
              ],
            ),
          );
        });
  }
}
