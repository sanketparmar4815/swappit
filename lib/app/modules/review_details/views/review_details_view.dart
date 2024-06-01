import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/review_details_controller.dart';

class ReviewDetailsView extends GetView<ReviewDetailsController> {
  const ReviewDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewDetailsController>(
        init: ReviewDetailsController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleSpacing: 0.0,
              leading: Padding(
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(5)),
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
                "  Reviews",
                fontsize: MySize.getScaledSizeHeight(22),
              ),
            ),
            body: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: MySize.getScaledSizeHeight(18)),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                commonText.mediumText(
                                  "4.5",
                                  fontsize: MySize.getScaledSizeWidth(30),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: commonText.regularText("/5", fontsize: MySize.getScaledSizeWidth(15)),
                                )
                              ],
                            ),
                            commonText.regularText(
                              "84 Reviews",
                              fontsize: MySize.getScaledSizeWidth(16),
                              tcolor: color.black.withOpacity(.6),
                            )
                          ],
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(12)),
                        VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: Colors.black.withOpacity(.1),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(11)),
                        Column(
                          children: [
                            Row(
                              children: [
                                RatingBar(
                                  ratingWidget: RatingWidget(
                                    full: Image.asset(assetsUrl.RatingImg),
                                    half: Image.asset(assetsUrl.starBlank2),
                                    empty: Image.asset(assetsUrl.starBlank2),
                                  ),
                                  ignoreGestures: true,
                                  initialRating: 5,
                                  minRating: 0,
                                  itemSize: 14,
                                  direction: Axis.horizontal,
                                  updateOnDrag: false,
                                  itemCount: 5,
                                  glow: false,
                                  unratedColor: color.white,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                Container(
                                  height: 4,
                                  width: MySize.getScaledSizeWidth(97),
                                  child: LinearProgressIndicator(
                                    // color: Color(0xffEEBA00),
                                    backgroundColor: Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(4),
                                    value: 10.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffEEBA00)),
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                commonText.semiBoldText(
                                  "70",
                                  fontsize: MySize.getScaledSizeHeight(14),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(9)),
                            Row(
                              children: [
                                RatingBar(
                                  ratingWidget: RatingWidget(
                                    full: Image.asset(assetsUrl.RatingImg),
                                    half: Image.asset(assetsUrl.starBlank2),
                                    empty: Image.asset(assetsUrl.starBlank2),
                                  ),
                                  ignoreGestures: true,
                                  initialRating: 4,
                                  minRating: 0,
                                  itemSize: 14,
                                  direction: Axis.horizontal,
                                  updateOnDrag: false,
                                  itemCount: 5,
                                  glow: false,
                                  unratedColor: color.white,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                Container(
                                  height: 4,
                                  width: MySize.getScaledSizeWidth(97),
                                  child: LinearProgressIndicator(
                                    // color: Color(0xffEEBA00),
                                    backgroundColor: Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(4),
                                    value: 0.2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffEEBA00)),
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                commonText.semiBoldText(
                                  "5",
                                  fontsize: MySize.getScaledSizeHeight(14),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(9)),
                            Row(
                              children: [
                                RatingBar(
                                  ratingWidget: RatingWidget(
                                    full: Image.asset(assetsUrl.RatingImg),
                                    half: Image.asset(assetsUrl.starBlank2),
                                    empty: Image.asset(assetsUrl.starBlank2),
                                  ),
                                  ignoreGestures: true,
                                  initialRating: 3,
                                  minRating: 0,
                                  itemSize: 14,
                                  direction: Axis.horizontal,
                                  updateOnDrag: false,
                                  itemCount: 5,
                                  glow: false,
                                  unratedColor: color.white,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                Container(
                                  height: 4,
                                  width: MySize.getScaledSizeWidth(97),
                                  child: LinearProgressIndicator(
                                    // color: Color(0xffEEBA00),
                                    backgroundColor: Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(4),
                                    value: 0.4,
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffEEBA00)),
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                commonText.semiBoldText(
                                  "8",
                                  fontsize: MySize.getScaledSizeHeight(14),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(9)),
                            Row(
                              children: [
                                RatingBar(
                                  ratingWidget: RatingWidget(
                                    full: Image.asset(assetsUrl.RatingImg),
                                    half: Image.asset(assetsUrl.starBlank2),
                                    empty: Image.asset(assetsUrl.starBlank2),
                                  ),
                                  ignoreGestures: true,
                                  initialRating: 2,
                                  minRating: 0,
                                  itemSize: 14,
                                  direction: Axis.horizontal,
                                  updateOnDrag: false,
                                  itemCount: 5,
                                  glow: false,
                                  unratedColor: color.white,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                Container(
                                  height: 4,
                                  width: MySize.getScaledSizeWidth(97),
                                  child: LinearProgressIndicator(
                                    // color: Color(0xffEEBA00),
                                    backgroundColor: Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(4),
                                    value: 0.2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffEEBA00)),
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                commonText.semiBoldText(
                                  "2",
                                  fontsize: MySize.getScaledSizeHeight(14),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(9)),
                            Row(
                              children: [
                                RatingBar(
                                  ratingWidget: RatingWidget(
                                    full: Image.asset(assetsUrl.RatingImg),
                                    half: Image.asset(assetsUrl.starBlank2),
                                    empty: Image.asset(assetsUrl.starBlank2),
                                  ),
                                  ignoreGestures: true,
                                  initialRating: 1,
                                  minRating: 0,
                                  itemSize: 14,
                                  direction: Axis.horizontal,
                                  updateOnDrag: false,
                                  itemCount: 5,
                                  glow: false,
                                  unratedColor: color.white,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                Container(
                                  height: 4,
                                  width: MySize.getScaledSizeWidth(97),
                                  child: LinearProgressIndicator(
                                    // color: Color(0xffEEBA00),
                                    backgroundColor: Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(4),
                                    value: 0.1,
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffEEBA00)),
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                commonText.semiBoldText(
                                  "1",
                                  fontsize: MySize.getScaledSizeHeight(14),
                                )
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(9)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Divider(),
                  ListView.builder(
                    // padding: EdgeInsets.only(bottom: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.reviewList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Image.asset(
                                    controller.reviewList[index]['image'],
                                    height: MySize.getScaledSizeHeight(45),
                                    width: MySize.getScaledSizeWidth(45),
                                  ),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(16)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: commonText.mediumText(
                                              controller.reviewList[index]['name'],
                                              fontsize: MySize.getScaledSizeHeight(18),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              commonText.mediumText(
                                                "20 March, 2024",
                                                fontsize: MySize.getScaledSizeHeight(14),
                                                tcolor: Colors.black.withOpacity(.5),
                                              ),
                                              commonText.mediumText(
                                                "05:45 PM",
                                                fontsize: MySize.getScaledSizeHeight(14),
                                                tcolor: Colors.black.withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      RatingBar(
                                        ratingWidget: RatingWidget(
                                          full: Image.asset(assetsUrl.RatingImg),
                                          half: Image.asset(assetsUrl.starBlank2),
                                          empty: Image.asset(assetsUrl.starBlank2),
                                        ),
                                        ignoreGestures: true,
                                        initialRating: 4,
                                        minRating: 0,
                                        itemSize: 14,
                                        direction: Axis.horizontal,
                                        updateOnDrag: false,
                                        itemCount: 5,
                                        glow: false,
                                        unratedColor: color.white,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 2),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      SizedBox(height: MySize.getScaledSizeHeight(12)),
                                      Container(
                                        width: MySize.getScaledSizeWidth(285),
                                        child: commonText.mediumText(
                                          "Lorem ipsum dolor sit amet, consectetur iscing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua.consectetur adipis.",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
