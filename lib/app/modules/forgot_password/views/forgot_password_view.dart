import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/verification/views/verification_view.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (logic) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
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
                        child: Form(
                          key: controller.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  assetsUrl.appicon,
                                  height: MySize.getScaledSizeHeight(110),
                                  width: MySize.getScaledSizeWidth(110),
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(20)),
                              Align(
                                alignment: Alignment.center,
                                child: commonText.mediumText(
                                  stringsUtils.forgotPassword,
                                  fontsize: MySize.getScaledSizeHeight(24),
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(12)),
                              commonText.mediumText(
                                stringsUtils.pleaseenteryourregisterednewPassword,
                                fontsize: MySize.getScaledSizeHeight(16),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    "${stringsUtils.email}",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    fontsize: 12.0,
                                    tcolor: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonWidget.customTextfield(
                                  textInputAction: TextInputAction.done,
                                  controller: controller.email,
                                  hintText: stringsUtils.enteremail,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Email";
                                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.']+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.email.text)) {
                                      return 'Please enter valid email';
                                    }
                                    return null;
                                  }),
                              SizedBox(height: Get.height * 0.15),
                              commonWidget.customButton(
                                onTap: () {
                                  if (controller.formKey.currentState!.validate()) {
                                    Get.to(VerificationView(), transition: Transition.rightToLeft, arguments: {'flag': 1});
                                  }
                                },
                                height: MySize.getScaledSizeHeight(58),
                                text: stringsUtils.sendCode,
                                textfontsize: MySize.getScaledSizeHeight(18),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
