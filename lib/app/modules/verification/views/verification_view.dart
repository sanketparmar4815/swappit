import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/create_password/views/create_password_view.dart';
import 'package:swapit/app/modules/profile_information/views/profile_information_view.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<VerificationController>(
        init: VerificationController(),
        builder: (logic) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      SizedBox(height: MySize.getScaledSizeHeight(14)),
                      SafeArea(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Obx(() {
                            return commonWidget.commonBackButton(
                              onTap: () {
                                controller.isBack.value = true;
                                Get.back();
                              },
                              height: MySize.getScaledSizeHeight(36),
                              width: MySize.getScaledSizeWidth(36),
                              containerColor: controller.isBack.value == true ? color.appColor : color.white,
                              imageColor: controller.isBack.value == true ? color.white : color.appColor,
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  assetsUrl.appicon,
                                  height: MySize.getScaledSizeHeight(110),
                                  width: MySize.getScaledSizeHeight(110),
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(20)),
                              commonText.mediumText(
                                stringsUtils.verifications,
                                fontsize: MySize.getScaledSizeHeight(24),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(12)),
                              commonText.mediumText(
                                stringsUtils.entertheverification,
                                fontsize: MySize.getScaledSizeHeight(16),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Pinput(
                                textInputAction: TextInputAction.done,
                                controller: controller.otpPin,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter OTP";
                                  }
                                  return null;
                                },
                                submittedPinTheme: PinTheme(
                                  width: 62,
                                  height: 62,
                                  textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SemiBold',
                                  ),
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: color.appColor.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(32),
                                    border: Border.all(color: color.appColor.withOpacity(.5), width: 1),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  width: 62,
                                  height: 62,
                                  margin: EdgeInsets.only(right: 5),
                                  textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SemiBold',
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffEFEFEF),
                                    borderRadius: BorderRadius.circular(32),
                                    border: Border.all(color: color.appColor.withOpacity(.5), width: 1),
                                  ),
                                ),
                                defaultPinTheme: PinTheme(
                                  height: 62,
                                  margin: EdgeInsets.only(right: 5),
                                  width: 62,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Bold',
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Color(0xffEFEFEF),
                                    border: Border.all(color: color.appColor.withOpacity(.5), width: 1),
                                  ),
                                ),
                                errorPinTheme: PinTheme(
                                  width: 62,
                                  height: 62,
                                  textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SemiBold',
                                  ),
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(40)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  commonText.regularText(
                                    stringsUtils.didntreceive,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.regularText(
                                    " Resend",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                    tcolor: color.appColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(50)),
                              commonWidget.customButton(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  if (controller.formKey.currentState!.validate()) {
                                    controller.flag == 1 ? Get.to(CreatePasswordView(), transition: Transition.rightToLeft) : Get.to(ProfileInformationView(), transition: Transition.rightToLeft);
                                  }
                                },
                                height: MySize.getScaledSizeHeight(58),
                                text: stringsUtils.confirmCode,
                                textfontsize: MySize.getScaledSizeHeight(18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
