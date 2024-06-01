import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/login/views/login_view.dart';
import 'package:swapit/app/modules/verification/views/verification_view.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateAccountController controller = Get.put(CreateAccountController());
    MySize().init(context);
    return GetBuilder<CreateAccountController>(
        init: CreateAccountController(),
        builder: (logic) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MySize.getScaledSizeHeight(20)),
                        SafeArea(
                          child: Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                                "assets/image/finalOnBoarding.gif",
                                //assetsUrl.appicon,
                                height: MySize.getScaledSizeHeight(110),
                                width: MySize.getScaledSizeHeight(110),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(20)),
                        Align(
                          alignment: Alignment.center,
                          child: commonText.mediumText(
                            stringsUtils.createAccount,
                            fontsize: MySize.getScaledSizeHeight(24),
                          ),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(12)),
                        commonText.mediumText(
                          stringsUtils.pleaseenteryourregisteredCreateAccount,
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
                                return 'Please enter your email';
                              } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.']+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.email.text)) {
                                return "Please enter valid email";
                              }
                              return null;
                            }),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          children: [
                            commonText.mediumText(
                              "${stringsUtils.password}",
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
                              controller: controller.confirPassword,
                              hintText: stringsUtils.enterPassword,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              });
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
                              controller: controller.password,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your confirm password";
                                }
                                return null;
                              });
                        }),
                        SizedBox(height: MySize.getScaledSizeHeight(70)),
                        commonWidget.customButton(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              Get.to(VerificationView(), transition: Transition.rightToLeft, arguments: {'flag': 0});
                            }
                          },
                          height: MySize.getScaledSizeHeight(58),
                          text: stringsUtils.createAccount,
                          textfontsize: MySize.getScaledSizeHeight(18),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            commonText.regularText(
                              stringsUtils.alreadyhaveanaccount,
                              fontsize: MySize.getScaledSizeHeight(14),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(LoginView());
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: commonText.mediumText(
                                  " ${stringsUtils.logIn}",
                                  fontsize: MySize.getScaledSizeHeight(15),
                                  tcolor: color.appColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              assetsUrl.LineImg1,
                              width: MySize.getScaledSizeWidth(110),
                            ),
                            commonText.mediumText(
                              " Or ",
                              fontsize: MySize.getScaledSizeHeight(18),
                              tcolor: color.grey,
                            ),
                            Image.asset(
                              assetsUrl.LineImg2,
                              width: MySize.getScaledSizeWidth(110),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(30)),
                        Material(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: MySize.getScaledSizeHeight(52),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: color.appColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetsUrl.googleImg,
                                    height: MySize.getScaledSizeHeight(24),
                                    width: MySize.getScaledSizeWidth(24),
                                  ),
                                  SizedBox(width: MySize.getScaledSizeWidth(10)),
                                  commonText.semiBoldText(
                                    stringsUtils.continueWithGoogle,
                                    fontsize: MySize.getScaledSizeHeight(14),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        device_type == 2
                            ? Material(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: MySize.getScaledSizeHeight(52),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: color.appColor),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          assetsUrl.appleImg,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                        ),
                                        SizedBox(width: MySize.getScaledSizeWidth(10)),
                                        commonText.semiBoldText(
                                          stringsUtils.continueWithApple,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
