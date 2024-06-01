import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/create_password_controller.dart';

class CreatePasswordView extends GetView<CreatePasswordController> {
  const CreatePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<CreatePasswordController>(
        init: CreatePasswordController(),
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
                              SafeArea(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    assetsUrl.appicon,
                                    height: MySize.getScaledSizeHeight(110),
                                    width: MySize.getScaledSizeWidth(110),
                                  ),
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(20)),
                              Align(
                                alignment: Alignment.center,
                                child: commonText.mediumText(
                                  "Reset Password",
                                  fontsize: MySize.getScaledSizeHeight(24),
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(12)),
                              commonText.mediumText(
                                stringsUtils.yournewpasswordmust,
                                fontsize: MySize.getScaledSizeHeight(16),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    "${stringsUtils.newPassword}",
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
                              Obx(() {
                                return commonWidget.customTextfield(
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter New Password";
                                    }
                                    return null;
                                  },
                                  controller: controller.newPassword,
                                  hintText: stringsUtils.enterNewPassword,
                                  obscureText: controller.isVisibility.value ? true : false,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      controller.isVisibility.value = !controller.isVisibility.value;
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Image.asset(
                                      controller.isVisibility.value ? assetsUrl.hidePassword : assetsUrl.showPaasword,
                                      scale: 3.5,
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    "${stringsUtils.confirmPassword}",
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
                              Obx(() {
                                return commonWidget.customTextfield(
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Confirm Password";
                                    }
                                    return null;
                                  },
                                  controller: controller.confirmPassword,
                                  hintText: stringsUtils.enterConfirmPassword,
                                  obscureText: controller.isVisibility2.value ? true : false,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      controller.isVisibility2.value = !controller.isVisibility2.value;
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Image.asset(
                                      controller.isVisibility2.value ? assetsUrl.hidePassword : assetsUrl.showPaasword,
                                      scale: 3.5,
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: MySize.getScaledSizeHeight(72)),
                              commonWidget.customButton(
                                onTap: () {
                                  if (controller.formKey.currentState!.validate()) {
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                  }
                                },
                                height: MySize.getScaledSizeHeight(58),
                                text: "Update Password",
                                textfontsize: MySize.getScaledSizeHeight(18),
                              ),
                              SizedBox(height: 10),
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
