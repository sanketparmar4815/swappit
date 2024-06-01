import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/bottombar/views/bottombar_view.dart';
import 'package:swapit/app/modules/create_account/views/create_account_view.dart';
import 'package:swapit/app/modules/forgot_password/views/forgot_password_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<LoginController>(
        init: LoginController(),
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
                            // child: Image.asset(
                            //   assetsUrl.appicon,
                            //   height: MySize.getScaledSizeHeight(110),
                            //   width: MySize.getScaledSizeWidth(110),
                            //   // height: 110,
                            //   // width: 110,
                            // ),
                          ),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(20)),
                        Align(
                          alignment: Alignment.center,
                          child: commonText.mediumText(
                            stringsUtils.welcometoSwappit,
                            fontsize: MySize.getScaledSizeHeight(24),
                          ),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(12)),
                        commonText.mediumText(
                          stringsUtils.pleaseenteryourregistered,
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
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.email.text = value;
                            }),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          children: [
                            commonText.mediumText(
                              "${stringsUtils.password}",
                              fontsize: 16.0,
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
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          );
                        }),
                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.to(ForgotPasswordView(), transition: Transition.rightToLeft);
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: commonText.regularText(
                              stringsUtils.forgotPassword,
                              fontsize: MySize.getScaledSizeHeight(14),
                              tcolor: Colors.black.withOpacity(.80),
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(30)),
                        commonWidget.customButton(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              print("get home screen");
                              Get.offAll(BottombarView(), transition: Transition.rightToLeft);

                              print('Email: ${controller.email}');
                            } else {
                              print("else part is here");
                            }
                          },
                          height: MySize.getScaledSizeHeight(58),
                          text: stringsUtils.logIn,
                          textfontsize: MySize.getScaledSizeHeight(18),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            commonText.regularText(
                              "You don’t have an account?",
                              fontsize: MySize.getScaledSizeHeight(14),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(CreateAccountView(), transition: Transition.rightToLeft);
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: commonText.mediumText(
                                  " Create account",
                                  fontsize: 14.0,
                                  tcolor: color.appColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              assetsUrl.LineImg1,
                              width: 110,
                            ),
                            commonText.mediumText(
                              " Or ",
                              fontsize: 14.0,
                              tcolor: color.grey,
                            ),
                            Image.asset(
                              assetsUrl.LineImg2,
                              width: 110,
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
                                        SizedBox(width: MySize.getScaledSizeWidth(16)),
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
                        SizedBox(height: 15),
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
