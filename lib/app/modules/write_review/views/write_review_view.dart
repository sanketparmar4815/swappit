import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/write_review_controller.dart';

class WriteReviewView extends GetView<WriteReviewController> {
  const WriteReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<WriteReviewController>(
        init: WriteReviewController(),
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
                          Get.back();
                        },
                        containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                        imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                  }),
                ),
                title: commonText.mediumText(
                  " ${stringsUtils.writeReview}",
                  fontsize: MySize.getScaledSizeWidth(22),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MySize.getScaledSizeWidth(16)),
                            Row(
                              children: [
                                Container(
                                  height: MySize.getScaledSizeHeight(48),
                                  width: MySize.getScaledSizeHeight(48),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: color.appColor, width: 1),
                                  ),
                                  child: Image.asset(
                                    assetsUrl.searchProfileImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(9)),
                                commonText.mediumText(
                                  "Robert Fox",
                                  fontsize: MySize.getScaledSizeWidth(18),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeWidth(16)),
                            commonText.mediumText(
                              stringsUtils.rateyourexperience,
                              fontsize: MySize.getScaledSizeWidth(16),
                            ),
                            SizedBox(height: MySize.getScaledSizeWidth(16)),
                            RatingBar(
                              ratingWidget: RatingWidget(
                                full: Image.asset(assetsUrl.RatingImg),
                                half: Image.asset(assetsUrl.starBlackImg),
                                empty: Image.asset(assetsUrl.starBlackImg),
                              ),
                              initialRating: 0,
                              minRating: 0,
                              itemSize: 30,
                              direction: Axis.horizontal,
                              updateOnDrag: true,
                              itemCount: 5,
                              glow: false,
                              unratedColor: color.white,
                              itemPadding: EdgeInsets.symmetric(horizontal: 10),
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(height: MySize.getScaledSizeWidth(16)),
                            commonText.mediumText(
                              stringsUtils.writePublicReview,
                              fontsize: MySize.getScaledSizeWidth(16),
                            ),
                            SizedBox(height: MySize.getScaledSizeWidth(8)),
                            commonWidget.customTextfield(
                              hintText: stringsUtils.writeHere,
                              maxLines: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                    isKeyBoard
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: commonWidget.customButton(
                              onTap: () {
                                Get.back();
                                Get.back();
                              },
                              height: MySize.getScaledSizeHeight(58),
                              textfontsize: MySize.getScaledSizeHeight(18),
                              text: "Submit",
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
