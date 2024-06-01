import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/product_info/views/product_info_view.dart';

import '../controllers/my_offer_controller.dart';

class MyOfferView extends GetView<MyOfferController> {
  const MyOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOfferController>(
        init: MyOfferController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleSpacing: 0.0,
              leading: Padding(
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(5)),
                child: Obx(
                  () {
                    return commonWidget.commonBackButton(
                        onTap: () {
                          controller.onTapBack.value = !controller.onTapBack.value;
                          Get.back();
                        },
                        containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                        imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                  },
                ),
              ),
              title: commonText.mediumText(
                "  My Offer",
                fontsize: MySize.getScaledSizeHeight(22),
              ),
            ),
            body: ListView.builder(
                // physics: BouncingScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                            ProductInfoView(),
                            arguments: {'flag': 2, 'flag2': index == 0 ? 1 : 3, 'editFlag': 1},
                            transition: Transition.rightToLeft,
                          );
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(8), vertical: MySize.getScaledSizeHeight(12)),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffEFEFEF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonText.mediumText(
                                        "This Items",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      SizedBox(height: MySize.getScaledSizeHeight(8)),
                                      Image.asset(
                                        assetsUrl.newSwapImg,
                                        height: MySize.getScaledSizeHeight(176),
                                        width: MySize.getScaledSizeHeight(151),
                                        // height: 180,
                                        // width: Get.height * 0.18,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Image.asset(
                                      assetsUrl.swapArroeIcon,
                                      height: MySize.getScaledSizeHeight(24),
                                      width: MySize.getScaledSizeWidth(24),
                                      // height: 18,
                                      // width: 18,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonText.mediumText(
                                        "In Exchange",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      SizedBox(height: MySize.getScaledSizeHeight(8)),
                                      Image.asset(
                                        assetsUrl.newSwapImg2,
                                        height: MySize.getScaledSizeHeight(176),
                                        width: MySize.getScaledSizeHeight(151),
                                        // height: 180,
                                        // width: Get.height * 0.18,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              commonText.mediumText(
                                index == 0 ? "Active" : "Completed",
                                fontsize: MySize.getScaledSizeWidth(16),
                                tcolor: index == 0 ? color.appColor : Color(0xffFC6913),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MySize.getScaledSizeHeight(12)),
                      Divider(),
                      SizedBox(height: MySize.getScaledSizeHeight(12)),
                    ],
                  );
                }),
          );
        });
  }
}
