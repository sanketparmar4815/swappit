import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/my_favourite_controller.dart';

class MyFavouriteView extends GetView<MyFavouriteController> {
  const MyFavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<MyFavouriteController>(
        init: MyFavouriteController(),
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
                "  My Favourite",
                fontsize: MySize.getScaledSizeHeight(22),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  controller.isLoading.value
                      ? CategoryDetailViewShimmer()
                      : controller.favourite.length == 0
                          ? Center(
                              child: commonText.mediumText(
                                "No Data Found",
                                fontsize: MySize.getScaledSizeHeight(20),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.favourite.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: MySize.getScaledSizeHeight(48),
                                                width: MySize.getScaledSizeWidth(48),
                                                // height: 48,
                                                // width: 48,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(image: AssetImage(controller.favourite[index]['image'])),
                                                    border: Border.all(
                                                      color: color.appColor,
                                                      width: 1,
                                                    )),
                                              ),
                                              SizedBox(width: MySize.getScaledSizeWidth(8)),
                                              commonText.mediumText(
                                                "Robert Fox",
                                                fontsize: MySize.getScaledSizeHeight(18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  if (controller.isLike.contains(index)) {
                                                    print("yes IF on tap${index}");
                                                  } else {
                                                    print("yes Else on tap${index}");
                                                    controller.isLike.remove(index);
                                                    controller.favourite.removeAt(index);
                                                  }
                                                  // if (controller.isLike.contains(index)) {
                                                  //   controller.isAnimationList[index] = true;
                                                  //   controller.isLike.remove(index);
                                                  // } else {
                                                  //
                                                  //   Future.delayed(Duration(milliseconds: 400), () {
                                                  //     controller.isAnimationList[index] = !controller.isAnimationList[index];
                                                  //
                                                  //     controller.update();
                                                  //   });
                                                  //
                                                  //   controller.isLike.add(index);
                                                  // }

                                                  controller.update();
                                                },
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                child: Container(
                                                    height: MySize.getScaledSizeHeight(45),
                                                    width: MySize.getScaledSizeWidth(45),
                                                    // height: 40,
                                                    // width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffCDF2CF),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: controller.isLike.contains(index)
                                                        ? Padding(
                                                            padding: EdgeInsets.all(9.0),
                                                            child: Image.asset(
                                                              assetsUrl.heartBorder,
                                                            ),
                                                          )
                                                        : Padding(
                                                            padding: EdgeInsets.all(9.0),
                                                            child: Image.asset(
                                                              assetsUrl.heartFill,
                                                            ),
                                                          )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                                          Container(
// height: 234,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(8), vertical: MySize.getScaledSizeHeight(12)),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xffEFEFEF),
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
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
                                          ),
                                          SizedBox(height: MySize.getScaledSizeHeight(16)),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                ],
              ),
            ),
          );
        });
  }
}
