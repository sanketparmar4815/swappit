import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/edit_exchange_product_controller.dart';

class EditExchangeProductView extends GetView<EditExchangeProductController> {
  const EditExchangeProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<EditExchangeProductController>(
        init: EditExchangeProductController(),
        builder: (logic) {
          bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleSpacing: 0.0,
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
                  " ${stringsUtils.editProductExchangeWith}",
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MySize.getScaledSizeHeight(7)),
                            commonText.mediumText(
                              stringsUtils.productimage,
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            Stack(
                              children: [
                                Container(
                                  height: MySize.getScaledSizeHeight(260),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: color.appColor.withOpacity(.5),
                                      )),
                                  child: controller.imagePath == null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.asset(
                                            "assets/image/viewOfferImg.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.file(
                                            File(controller.imagePath),
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                Positioned(
                                  bottom: MySize.getScaledSizeHeight(10),
                                  right: MySize.getScaledSizeHeight(10),
                                  child: InkWell(
                                    onTap: () {
                                      showPickImageBottom();
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      height: MySize.getScaledSizeHeight(40),
                                      width: MySize.getScaledSizeWidth(40),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        assetsUrl.cameraIcon,
                                        // height: MySize.getScaledSizeHeight(24),
                                        // width: MySize.getScaledSizeWidth(24),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            commonText.mediumText(
                              stringsUtils.productName,
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            commonWidget.customTextfield(
                              controller: controller.productName,
                              hintText: stringsUtils.enterproductname,
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            commonText.mediumText(
                              stringsUtils.description,
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            commonWidget.customTextfield(
                              controller: controller.productDescription,
                              hintText: stringsUtils.enterdescription,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    isKeyBoard
                        ? SizedBox()
                        : commonWidget.customButton(
                            onTap: () {
                              if (controller.editFlag == 1) {
                                Get.back();
                              } else {
                                Get.back();
                                Get.back();
                              }
                            },
                            height: MySize.getScaledSizeHeight(58),
                            text: stringsUtils.save,
                            textfontsize: MySize.getScaledSizeHeight(18),
                          ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showPickImageBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        Get.back();
                        if (await cameraAudioPermission(flag: 1)) {
                          controller.fromCamera(flag: 0);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset(
                            assetsUrl.cameraImg,
                            height: 48,
                            width: 48,
                          ),
                          SizedBox(height: 4),
                          commonText.regularText(
                            stringsUtils.camera,
                            fontsize: 12.0,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Get.back();
                        if (await cameraAudioPermission(flag: 2)) {
                          controller.fromCamera(flag: 1);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset(
                            assetsUrl.galaryImg,
                            height: 48,
                            width: 48,
                          ),
                          SizedBox(height: 4),
                          commonText.regularText(
                            stringsUtils.gallery,
                            fontsize: 12.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: commonText.mediumText(
                    stringsUtils.cancel,
                    fontsize: 16.0,
                    tcolor: color.black.withOpacity(.5),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
