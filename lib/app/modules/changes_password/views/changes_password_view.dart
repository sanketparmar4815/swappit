import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/changes_password_controller.dart';

class ChangesPasswordView extends GetView<ChangesPasswordController> {
  const ChangesPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangesPasswordController>(
        init: ChangesPasswordController(),
        builder: (logic) {
          bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: MySize.getScaledSizeHeight(50),
              titleSpacing: 0.0,
              elevation: 0.0,
              backgroundColor: color.white,
              //leadingWidth: Get.width / 1.8,
              leading: Padding(
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(14), right: MySize.getScaledSizeHeight(8)),
                child: Obx(() {
                  return commonWidget.commonBackButton(
                      onTap: () {
                        controller.onTapBack.value = !controller.onTapBack.value;
                        Get.back();
                      },
                      containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                      imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                }),
              ),
              title: commonText.mediumText(
                " ${stringsUtils.changePassword}",
                fontsize: MySize.getScaledSizeHeight(22),
              ),
            ),
            body: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            Row(
                              children: [
                                commonText.mediumText(
                                  "${stringsUtils.currentPassword}",
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
                                    return "Please Enter Current Password";
                                  }
                                  return null;
                                },
                                controller: controller.currentPassword,
                                hintText: stringsUtils.enterCurrentPassword,
                                obscureText: controller.isVisibility3.value ? true : false,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.isVisibility3.value = !controller.isVisibility3.value;
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image.asset(
                                    controller.isVisibility3.value ? assetsUrl.hidePassword : assetsUrl.showPaasword,
                                    scale: 3.5,
                                  ),
                                ),
                              );
                            }),
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
                                  "Confirm New Password",
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
                                hintText: "Enter Confirm New Password",
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(18)),
                    isKeyBoard
                        ? SizedBox()
                        : commonWidget.customButton(
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                Get.back();
                              }
                            },
                            height: MySize.getScaledSizeHeight(58),
                            text: stringsUtils.save,
                            textfontsize: MySize.getScaledSizeHeight(18),
                          ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
