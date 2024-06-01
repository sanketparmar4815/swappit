import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/add_majestic_item_controller.dart';

class AddMajesticItemView extends GetView<AddMajesticItemController> {
  const AddMajesticItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<AddMajesticItemController>(
        init: AddMajesticItemController(),
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
                title: commonText.mediumText(" ${stringsUtils.addMajesticItem}", fontsize: MySize.getScaledSizeHeight(22)),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          controller: controller.scrollController,
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MySize.getScaledSizeHeight(18)),
                              commonText.regularText(
                                "Please add the item you may find majestic.",
                                fontsize: MySize.getScaledSizeHeight(14),
                                tcolor: Colors.black.withOpacity(.5),
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
                                            ),
                                          ),
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
                                    stringsUtils.productCategory,
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
                                  controller: controller.productCategory,
                                  hintText: stringsUtils.enterCategoryname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Product Category name";
                                    }
                                    return null;
                                  }),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.price,
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
                                controller: controller.price,
                                keyboardType: TextInputType.number,
                                hintText: "00.00",
                                prefixText: "\$  ",
                                onChanged: (value) {
                                  // if (controller.price.text.isNotEmpty) {
                                  //   controller.price.text.toString().split("\$").last;
                                  //   controller.update();
                                  //   controller.price.text = "\$ ${value}";
                                  // }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Price";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    stringsUtils.productdetailsplaceinfo,
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
                                  hintText: stringsUtils.description,
                                  maxLines: 4,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Product Description";
                                    }
                                    return null;
                                  }),
                            ],
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
                                  Get.back();
                                }
                              },
                              height: MySize.getScaledSizeHeight(58),
                              text: "Submit",
                              textfontsize: MySize.getScaledSizeHeight(18),
                            ),
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                    ],
                  ),
                ),
              ));
        });
  }
}
