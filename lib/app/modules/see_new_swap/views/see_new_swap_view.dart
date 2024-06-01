import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/product_info/views/product_info_view.dart';
import '../controllers/see_new_swap_controller.dart';

class SeeNewSwapView extends GetView<SeeNewSwapController> {
  const SeeNewSwapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<SeeNewSwapController>(
        init: SeeNewSwapController(),
        builder: (logic) {
          return Obx(() {
            return Scaffold(
                backgroundColor: Colors.white,
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  // key: controller.globalKey,
                  headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        titleSpacing: 0.0,
                        flexibleSpace: SizedBox(),
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
                        backgroundColor: Colors.white,
                        title: commonText.mediumText(" ${stringsUtils.newSwaps}", fontsize: MySize.getScaledSizeHeight(22)),
                      )
                    ];
                  },
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                    child: Column(
                      children: [
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        controller.isLoading.value
                            ? CategoryDetailViewShimmer()
                            : Expanded(
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(ProductInfoView(), transition: Transition.rightToLeft);
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
                                                      image: DecorationImage(image: AssetImage(assetsUrl.searchProfileImg)),
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
                                                      controller.isAnimationList[index] = true;
                                                      controller.isLike.remove(index);
                                                    } else {
                                                      Future.delayed(Duration(milliseconds: 800), () {
                                                        controller.isAnimationList[index] = !controller.isAnimationList[index];

                                                        controller.update();
                                                      });

                                                      controller.isLike.add(index);
                                                    }

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
                                                      child: !controller.isLike.contains(index)
                                                          ? Padding(
                                                              padding: EdgeInsets.all(9.0),
                                                              child: Image.asset(
                                                                assetsUrl.heartBorder,
                                                              ),
                                                            )
                                                          : controller.isAnimationList[index] == false
                                                              ? Padding(
                                                                  padding: EdgeInsets.all(9.0),
                                                                  child: Image.asset(
                                                                    assetsUrl.heartFill,
                                                                  ),
                                                                )
                                                              : Lottie.asset(
                                                                  "assets/animation/isLikeIcon.json",
                                                                  height: 45,
                                                                  width: 45,
                                                                )),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: MySize.getScaledSizeHeight(10)),
                                            Container(
                                              // height: 234,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
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
                                                        assetsUrl.newSwapImg2,
                                                        height: 180,
                                                        width: Get.height * 0.18,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Image.asset(
                                                      assetsUrl.swapArroeIcon,
                                                      height: 18,
                                                      width: 18,
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
                                                        assetsUrl.newSwapImg,
                                                        height: 180,
                                                        width: Get.height * 0.18,
                                                      ),
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
                ));
          });
        });
  }
}
