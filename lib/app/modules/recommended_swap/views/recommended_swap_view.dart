import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/product_info/views/product_info_view.dart';

import '../controllers/recommended_swap_controller.dart';

class RecommendedSwapView extends GetView<RecommendedSwapController> {
  const RecommendedSwapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<RecommendedSwapController>(
        init: RecommendedSwapController(),
        builder: (logic) {
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
                      title: commonText.mediumText(" ${stringsUtils.recommendedSwaps}", fontsize: MySize.getScaledSizeHeight(22)),
                    )
                  ];
                },
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                  child: Column(
                    children: [
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                      controller.isLoading.value
                          ? seeNewSwapViewShimmer()
                          : Expanded(
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: MySize.getScaledSizeHeight(48),
                                                width: MySize.getScaledSizeWidth(48),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(image: AssetImage(assetsUrl.searchProfileImg)),
                                                    border: Border.all(
                                                      color: color.appColor,
                                                      width: 1,
                                                    )),
                                              ),
                                              SizedBox(width: 10),
                                              commonText.mediumText(
                                                "Robert Fox",
                                                fontsize: 18.0,
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          SizedBox(height: 10),
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
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    );
                                  }),
//                               child: ListView.builder(
//                                   padding: EdgeInsets.zero,
//                                   physics: BouncingScrollPhysics(),
//                                   itemCount: 3,
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, index) {
//                                     return InkWell(
//                                       onTap: () {
//                                         Get.to(ProductInfoView(), transition: Transition.rightToLeft);
//                                       },
//                                       splashColor: Colors.transparent,
//                                       highlightColor: Colors.transparent,
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Container(
//                                                 height: MySize.getScaledSizeHeight(48),
//                                                 width: MySize.getScaledSizeWidth(48),
//                                                 decoration: BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     image: DecorationImage(image: AssetImage(assetsUrl.searchProfileImg)),
//                                                     border: Border.all(
//                                                       color: color.appColor,
//                                                       width: 1,
//                                                     )),
//                                               ),
//                                               SizedBox(width: MySize.getScaledSizeWidth(8)),
//                                               commonText.mediumText(
//                                                 "Robert Fox",
//                                                 fontsize: MySize.getScaledSizeHeight(18),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: MySize.getScaledSizeHeight(10)),
//                                           Container(
// // height: 234,
//                                             //  alignment: Alignment.center,
//                                             padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(8), vertical: MySize.getScaledSizeHeight(12)),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: Color(0xffEFEFEF),
//                                               ),
//                                               borderRadius: BorderRadius.circular(12),
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     commonText.mediumText(
//                                                       "This Items",
//                                                       fontsize: MySize.getScaledSizeHeight(16),
//                                                     ),
//                                                     SizedBox(height: MySize.getScaledSizeHeight(8)),
//                                                     Image.asset(
//                                                       assetsUrl.newSwapImg,
//                                                       height: MySize.getScaledSizeHeight(176),
//                                                       width: MySize.getScaledSizeHeight(151),
//                                                       // height: 180,
//                                                       // width: Get.height * 0.18,
//                                                     )
//                                                   ],
//                                                 ),
//                                                 Padding(
//                                                   padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(5)),
//                                                   child: Image.asset(
//                                                     assetsUrl.swapArroeIcon,
//                                                     height: MySize.getScaledSizeHeight(24),
//                                                     width: MySize.getScaledSizeWidth(24),
//                                                     // height: 18,
//                                                     // width: 18,
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     commonText.mediumText(
//                                                       "In Exchange",
//                                                       fontsize: MySize.getScaledSizeHeight(16),
//                                                     ),
//                                                     SizedBox(height: MySize.getScaledSizeHeight(8)),
//                                                     Image.asset(
//                                                       assetsUrl.newSwapImg2,
//                                                       height: MySize.getScaledSizeHeight(176),
//                                                       width: MySize.getScaledSizeHeight(151),
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(height: MySize.getScaledSizeHeight(16)),
//                                         ],
//                                       ),
//                                     );
//                                   }),
                            )
                    ],
                  ),
                ),
              ));
        });
  }
}
