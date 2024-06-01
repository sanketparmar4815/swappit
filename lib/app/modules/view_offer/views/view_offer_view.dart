import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/edit_exchange_product/views/edit_exchange_product_view.dart';
import 'package:swapit/app/modules/edit_product/views/edit_product_view.dart';
import '../controllers/view_offer_controller.dart';

class ViewOfferView extends GetView<ViewOfferController> {
  const ViewOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<ViewOfferController>(
        init: ViewOfferController(),
        builder: (logic) {
          return GestureDetector(
            onTap: () {
              controller.isVisible.value = false;
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
                  padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(18), right: MySize.getScaledSizeHeight(8)),
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
                title: commonText.mediumText(" ${stringsUtils.newOfferProductInfo}", fontsize: MySize.getScaledSizeHeight(22)),
                actions: [
                  controller.editFlag == 1
                      ? InkWell(
                          onTap: () {
                            controller.isVisible.value = !controller.isVisible.value;
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            assetsUrl.dotsIcon,
                            height: MySize.getScaledSizeHeight(24),
                            width: MySize.getScaledSizeWidth(24),
                            // height: 24,
                            // width: 24,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(width: MySize.getScaledSizeWidth(16)),
                ],
              ),
              body: Obx(() {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  commonText.regularText(stringsUtils.youwillgetthis, fontsize: MySize.getScaledSizeHeight(15)),
                                  SizedBox(height: MySize.getScaledSizeHeight(12)),
                                  commonText.mediumText(stringsUtils.productimage, fontsize: MySize.getScaledSizeHeight(16)),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  Image.asset(
                                    "assets/image/viewOfferImg.png",
                                    height: MySize.getScaledSizeHeight(260),
                                    width: Get.width,
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  commonText.mediumText(stringsUtils.productName, fontsize: MySize.getScaledSizeHeight(16)),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonText.regularText("Brown Shirt", fontsize: MySize.getScaledSizeHeight(16)),
                                  SizedBox(height: MySize.getScaledSizeHeight(7)),
                                  commonText.mediumText("Product Description", fontsize: MySize.getScaledSizeHeight(16)),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonText.regularText(
                                    "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          controller.editFlag == 1
                              ? SizedBox()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: MySize.getScaledSizeHeight(10)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: commonWidget.customButton(
                                          onTap: () {
                                            showSendRequestDailog();
                                          },
                                          height: MySize.getScaledSizeHeight(58),
                                          textfontsize: MySize.getScaledSizeHeight(18),
                                          text: stringsUtils.accept,
                                        ),
                                      ),
                                      SizedBox(width: MySize.getScaledSizeWidth(16)),
                                      Expanded(
                                        child: commonWidget.customButton(
                                          onTap: () {
                                            if (controller.flag == 1) {
                                              Get.back();
                                            } else {
                                              Get.back();
                                              Get.back();
                                            }
                                          },
                                          height: MySize.getScaledSizeHeight(58),
                                          textfontsize: MySize.getScaledSizeHeight(18),
                                          backgroundColor: color.white,
                                          Tcolor: color.appColor,
                                          border: Border.all(color: color.appColor),
                                          text: stringsUtils.decline,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    controller.isVisible.value
                        ? Positioned(
                            right: 15,
                            top: 4,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                // border: Border.all(color: color.appColor.withOpacity(.5)),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                color: Color(0xffF9FAFD),
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.isVisible.value = false;
                                      Get.to(EditExchangeProductView(), arguments: {'editFlag': controller.editFlag}, transition: Transition.rightToLeft);
                                      controller.update();
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(50),
                                      width: Get.width / 1.9,
                                      alignment: Alignment.center,
                                      //margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: color.appColor.withOpacity(.5)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: commonText.mediumText(
                                          "    Edit",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  InkWell(
                                    onTap: () {
                                      controller.isVisible.value = false;
                                      Get.back();
                                      Get.back();

                                      controller.update();
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(50),
                                      width: Get.width / 1.9,
                                      alignment: Alignment.center,
                                      //margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: color.appColor.withOpacity(.5)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: commonText.mediumText(
                                          "    Delete",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                );
              }),
            ),
          );
        });
  }

  showSendRequestDailog() {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MySize.getScaledSizeHeight(20)),
                  Image.asset(
                    assetsUrl.sendrequestImg,
                    height: MySize.getScaledSizeHeight(75),
                    width: MySize.getScaledSizeWidth(75),
                    // height: 75,
                    // width: 75,
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(19)),
                  commonText.regularText(
                    stringsUtils.yourofferacceptrequest,
                    fontsize: MySize.getScaledSizeHeight(18),
                    textAlign: TextAlign.center,
                    tcolor: Colors.black.withOpacity(.8),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  commonWidget.customButton(
                    onTap: () {
                      if (controller.flag == 1) {
                        Get.back();
                        Get.back();
                      } else {
                        Get.back();
                        Get.back();
                        Get.back();
                      }
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
