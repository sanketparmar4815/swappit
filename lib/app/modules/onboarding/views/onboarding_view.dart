import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/login/views/login_view.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    // return Scaffold(
    //   body: SvgPicture.asset(
    //     assetsUrl.OnboardingBackground,
    //     height: Get.height,
    //     width: Get.width,
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/image/newOnBoardingImg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    "assets/image/finalOnBoarding.gif",
                    //assetsUrl.appicon,
                    height: MySize.getScaledSizeHeight(150),
                    width: MySize.getScaledSizeHeight(150),
                  ),
                ),
                // Image.asset(
                //   assetsUrl.appicon,
                //   height: MySize.getScaledSizeHeight(120),
                //   width: MySize.getScaledSizeWidth(120),
                //   // height: 150,
                //   // width: 150,
                // ),
                SizedBox(height: MySize.getScaledSizeHeight(30)),
                commonText.semiBoldText(
                  stringsUtils.welcometoSwappit,
                  fontsize: MySize.getScaledSizeHeight(28),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(16)),
                commonText.mediumText(
                  stringsUtils.swapclothesaccessories,
                  fontsize: MySize.getScaledSizeHeight(16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MySize.getScaledSizeHeight(20)),
                commonWidget.customButton(
                  onTap: () {
                    Get.offAll(LoginView());
                  },
                  height: MySize.getScaledSizeHeight(54),
                  text: stringsUtils.letsGeStarted,
                  textfontsize: MySize.getScaledSizeHeight(18),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
