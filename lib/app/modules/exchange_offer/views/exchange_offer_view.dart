import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/exchange_offer_controller.dart';

class ExchangeOfferView extends GetView<ExchangeOfferController> {
  const ExchangeOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return GetBuilder<ExchangeOfferController>(
        init: ExchangeOfferController(),
        builder: (logic) {
          bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MySize.getScaledSizeHeight(55),
                titleSpacing: 0.0,
                elevation: 0.0,
                backgroundColor: color.white,
                //leadingWidth: Get.width / 1.8,
                leading: Padding(
                  padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(12), right: MySize.getScaledSizeHeight(8)),
                  child: Obx(() {
                    return commonWidget.commonBackButton(
                        onTap: () {
                          controller.onTapBack.value = !controller.onTapBack.value;
                          Get.back(result: 1);
                        },
                        containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                        imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                  }),
                ),
                title: commonText.mediumText(
                  controller.flag == 1 ? "${stringsUtils.exchangewith}" : "${stringsUtils.whatdoyouwant}",
                  fontsize: MySize.getScaledSizeHeight(22),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: controller.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              commonText.regularText(
                                controller.flag == 1 ? "Add item details you want in exchange" : stringsUtils.additemyou,
                                fontsize: MySize.getScaledSizeHeight(14),
                                tcolor: Colors.black.withOpacity(.5),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.productimage,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                    tcolor: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              InkWell(
                                onTap: () async {
                                  if (await cameraAudioPermission(flag: 2)) {
                                    controller.fromCamera();
                                  }
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: controller.imagePath == null
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: MySize.getScaledSizeHeight(260),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Color(0xffEFEFEF)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    assetsUrl.uploadImgIcon,
                                                    height: MySize.getScaledSizeHeight(30),
                                                    width: MySize.getScaledSizeHeight(30),
                                                    // height: 30,
                                                    // width: 30,
                                                  ),
                                                  commonText.mediumText(
                                                    "Upload Images",
                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                    tcolor: Color(0xffA9ABAC),
                                                  )
                                                ],
                                              )),
                                          controller.imageText != null
                                              ? commonText.regularText(
                                                  controller.imageText,
                                                  fontsize: MySize.getScaledSizeHeight(14),
                                                  tcolor: Colors.red,
                                                )
                                              : SizedBox(),
                                        ],
                                      )
                                    : Container(
                                        height: MySize.getScaledSizeHeight(260),
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: color.appColor),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(11.5),
                                          child: Image.file(
                                            File(controller.imagePath),
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.productName,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                    tcolor: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonWidget.customTextfield(
                                  controller: controller.productName,
                                  hintText: stringsUtils.enterproductname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Product Name";
                                    }
                                    return null;
                                  }),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    "Description",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                    tcolor: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonWidget.customTextfield(
                                  controller: controller.productDesc,
                                  hintText: "Enter description",
                                  maxLines: 5,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter description";
                                    }
                                    return null;
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                    isKeyboard
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeHeight(16)),
                            child: commonWidget.customButton(
                              onTap: () {
                                if (controller.imagePath == null) {
                                  controller.imageText = "Please Enter Product Image";
                                  controller.update();
                                } else if (controller.formKey.currentState!.validate()) {
                                  showSendRequestDailog();
                                }
                              },
                              height: MySize.getScaledSizeHeight(58),
                              textfontsize: MySize.getScaledSizeHeight(18),
                              text: controller.flag == 1 ? "Submit" : "Send Request",
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSendRequestDailog() {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: controller.flag == 1 ? 0 : MySize.getScaledSizeHeight(20)),
                  controller.flag == 1
                      ? Lottie.asset("assets/animation/productAddSuccess.json")
                      : Image.asset(
                          assetsUrl.sendrequestImg,
                          height: MySize.getScaledSizeHeight(75),
                          width: MySize.getScaledSizeWidth(75),
                        ),
                  SizedBox(height: MySize.getScaledSizeHeight(19)),
                  controller.flag == 1
                      ? commonText.mediumText(
                          "${stringsUtils.productaddedsuccessfully}",
                          fontsize: MySize.getScaledSizeHeight(18),
                          textAlign: TextAlign.center,
                          tcolor: Colors.black,
                        )
                      : commonText.regularText(
                          "${stringsUtils.theproductexchangerequest}",
                          fontsize: MySize.getScaledSizeHeight(16),
                          textAlign: TextAlign.center,
                          tcolor: Colors.black.withOpacity(.8),
                        ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  commonWidget.customButton(
                    onTap: () {
                      Get.back();
                      Get.back();
                      Get.back();
                      Get.back();
                      Get.back();
                    },
                    height: MySize.getScaledSizeHeight(58),
                    textfontsize: MySize.getScaledSizeHeight(18),
                    text: "OKay",
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(20)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
