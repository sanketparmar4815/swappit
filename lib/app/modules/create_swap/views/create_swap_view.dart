import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/exchange_address_add/views/exchange_address_add_view.dart';
import 'package:swapit/app/modules/exchange_offer/views/exchange_offer_view.dart';
import 'package:swapit/app/modules/see_all_category/views/see_all_category_view.dart';

import '../controllers/create_swap_controller.dart';

class CreateSwapView extends GetView<CreateSwapController> {
  const CreateSwapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateSwapController>(
        init: CreateSwapController(),
        builder: (logic) {
          bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MySize.getScaledSizeHeight(50),
                titleSpacing: 0.0,
                elevation: 0.0,
                backgroundColor: color.white,
                //leadingWidth: Get.width / 1.8,
                leading: Padding(
                  padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(10)),
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
                title: commonText.mediumText(" ${stringsUtils.createSwap}", fontsize: MySize.getScaledSizeHeight(22)),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: controller.scrollController,
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: controller.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MySize.getScaledSizeHeight(10)),
                              commonText.regularText(
                                stringsUtils.addyouritem,
                                fontsize: MySize.getScaledSizeHeight(14),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(12)),
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
                                                  ),
                                                ],
                                              )),
                                          controller.isErrorText != null
                                              ? Padding(
                                                  padding: EdgeInsets.only(top: 4.0),
                                                  child: commonText.mediumText(
                                                    "${controller.isErrorText ?? ""}",
                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                    tcolor: Colors.red,
                                                  ),
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
                                  hintText: stringsUtils.enterproductname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Product name";
                                    }
                                    return null;
                                  }),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.category,
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
                                  onTap: () {
                                    Get.to(SeeAllCategoryView(), arguments: {'flag': 1}, transition: Transition.rightToLeft)!.then((value) {
                                      if (value != null) {
                                        controller.productCategory.text = value['name'];
                                        controller.update();
                                      }
                                    });
                                  },
                                  controller: controller.productCategory,
                                  readOnly: true,
                                  hintText: stringsUtils.selectCategory,
                                  suffixIcon: Image.asset(
                                    assetsUrl.arrow_forword,
                                    scale: 4.0,
                                    color: Colors.black,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Select Category";
                                    }
                                    return null;
                                  }),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.description,
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
                                  controller: controller.productDescription,
                                  hintText: stringsUtils.enterdescription,
                                  maxLines: 4,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Description";
                                    }
                                    return null;
                                  }),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.preferredExchangeAddress,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    tcolor: Colors.red,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ExchangeAddressAddView(), transition: Transition.rightToLeft)!.then((value) {
                                        if (value != null) {
                                          controller.preferredExchangeAddress.text = value['exchange_address'];
                                          controller.update();
                                        }
                                        FocusScope.of(context).requestFocus(FocusNode());
                                      });
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                        height: MySize.getScaledSizeHeight(28),
                                        width: MySize.getScaledSizeWidth(28),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: color.appColor),
                                          shape: BoxShape.circle,
                                        ),
                                        child: controller.preferredExchangeAddress.text.isEmpty
                                            ? Icon(
                                                Icons.add,
                                                color: color.appColor,
                                                size: MySize.getScaledSizeHeight(18),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Image.asset(assetsUrl.editIcon),
                                              )),
                                  )
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              controller.preferredExchangeAddress.text.isEmpty
                                  ? SizedBox()
                                  : commonWidget.customTextfield(
                                      readOnly: true,
                                      controller: controller.preferredExchangeAddress,
                                      hintText: "",
                                      maxLines: 4,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    isKeyBoard
                        ? SizedBox()
                        : commonWidget.customButton(
                            onTap: () {
                              if (controller.imagePath == null) {
                                controller.scrollController?.animateTo(
                                  controller.scrollController!.position.minScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                                controller.isErrorText = "Please Add Product image";
                                controller.update();
                              } else if (controller.formKey.currentState!.validate()) {
                                if (controller.preferredExchangeAddress.text.isEmpty) {
                                  // ShowFlushbar.showFlushbar(
                                  //   "Add Preferred Exchange Address",
                                  //   backgroundColor: Colors.lightBlueAccent,
                                  //   context: Get.context,
                                  // );
                                  ShowFlushbar.showFlushbar(
                                    "Add Preferred Exchange Address",
                                    context: Get.context,
                                    backgroundColor: Color(0xFFE1F5FE),
                                    messageColor: Colors.black,
                                    borderColor: Color(0xFFB3E5FC),
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  );
                                } else {
                                  Get.to(ExchangeOfferView(), arguments: {'flag': 1}, transition: Transition.rightToLeft);
                                }
                              }
                            },
                            height: MySize.getScaledSizeHeight(58),
                            text: stringsUtils.next,
                            textfontsize: MySize.getScaledSizeHeight(18),
                          ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
