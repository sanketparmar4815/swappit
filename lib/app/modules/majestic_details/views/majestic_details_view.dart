import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/majestic_details_controller.dart';

class MajesticDetailsView extends GetView<MajesticDetailsController> {
  const MajesticDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<MajesticDetailsController>(
        init: MajesticDetailsController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: MySize.getScaledSizeHeight(60),
              titleSpacing: 0.0,
              elevation: 0.0,
              backgroundColor: color.white,
              //leadingWidth: Get.width / 1.8,
              leading: Padding(
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(13), right: MySize.getScaledSizeHeight(9)),
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
              title: commonText.mediumText(" Product Info", fontsize: MySize.getScaledSizeHeight(22)),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MySize.getScaledSizeHeight(18)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                    child: commonText.mediumText(
                      "Product image",
                      fontsize: MySize.getScaledSizeHeight(16),
                    ),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                    child: Container(
                      height: MySize.getScaledSizeHeight(300),
                      decoration: BoxDecoration(

                          // image: DecorationImage(
                          //   image: AssetImage("assets/image/majesticImg1.png"),
                          // ),
                          ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/image/majesticImg1.png",
                          fit: BoxFit.cover,
                          // height: MySize.getScaledSizeHeight(300),
                          width: Get.width,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Divider(),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(width: MySize.getScaledSizeHeight(8)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText.mediumText(
                                  "Robert Fox",
                                  fontsize: MySize.getScaledSizeHeight(18),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      assetsUrl.RatingImg,
                                      height: MySize.getScaledSizeHeight(18),
                                      width: MySize.getScaledSizeWidth(18),
                                      // height: 16,
                                      // width: 16,
                                    ),
                                    commonText.regularText(
                                      "  4.5",
                                      fontsize: MySize.getScaledSizeHeight(15),
                                      tcolor: Color(0xff121212),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          children: [
                            commonText.mediumText(
                              "Product Name:",
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            commonText.regularText(
                              " Jumpsuit",
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          children: [
                            commonText.mediumText(
                              "Product Category:",
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            commonText.regularText(
                              " Unique Collection",
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        Row(
                          children: [
                            commonText.mediumText(
                              "Price:",
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            commonText.mediumText(
                              " \$ 45.00",
                              fontsize: MySize.getScaledSizeHeight(16),
                              tcolor: color.appColor,
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        commonText.mediumText(
                          "Product Details & Place Info:",
                          fontsize: MySize.getScaledSizeHeight(16),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                        commonText.regularText(
                          "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset",
                          fontsize: MySize.getScaledSizeHeight(16),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
