import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphic/graphic.dart';

import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/analytics_controller.dart';

class AnalyticsView extends GetView<AnalyticsController> {
  const AnalyticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalyticsController>(
        init: AnalyticsController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: MySize.getScaledSizeHeight(50),
              titleSpacing: 0.0,
              elevation: 0.0,
              backgroundColor: color.white,
              //leadingWidth: Get.width / 1.8,
              leading: Padding(
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(14), right: MySize.getScaledSizeHeight(8)),
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
                " ${stringsUtils.analytics}",
                fontsize: MySize.getScaledSizeHeight(22),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  commonText.mediumText(
                    stringsUtils.monthlyOverview,
                    fontsize: MySize.getScaledSizeHeight(18),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Container(
                    height: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xffEFEFEF),
                      ),
                    ),

                    child: Chart(
                      data: [
                        {'genre': 'Jan', 'sold': 275},
                        {'genre': 'Fab', 'sold': 115},
                        {'genre': 'Mar', 'sold': 120},
                        {'genre': 'Apr', 'sold': 350},
                        {'genre': 'May', 'sold': 150},
                        {'genre': 'Jun', 'sold': 180},
                        {'genre': 'July', 'sold': 80},
                        {'genre': 'Aug', 'sold': 140},
                        {'genre': 'Sept', 'sold': 230},
                        {'genre': 'Oct', 'sold': 120},
                        {'genre': 'Nov', 'sold': 90},
                        {'genre': 'Dec', 'sold': 50},
                      ],
                      variables: {
                        'genre': Variable(
                          accessor: (Map map) => map['genre'] as String,
                        ),
                        'sold': Variable(
                          accessor: (Map map) => map['sold'] as num,
                        ),
                      },
                      marks: [
                        IntervalMark(
                          color: ColorEncode(value: color.appColor),
                          shape: ShapeEncode(
                            value: RectShape(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                      axes: [
                        Defaults.horizontalAxis,
                        Defaults.verticalAxis,
                      ],
                    ),
                    // child: Chart(
                    //   layers: controller.layers(),
                    //   padding: EdgeInsets.only(left: 20.0).copyWith(
                    //     bottom: 12.0,
                    //   ),
                    // ),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      commonText.mediumText(
                        stringsUtils.exchangeHistory,
                        fontsize: MySize.getScaledSizeHeight(18),
                      ),
                      commonText.mediumText(
                        stringsUtils.selectMonth,
                        fontsize: MySize.getScaledSizeHeight(18),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: Get.width / 2.4,
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: color.appColor.withOpacity(.5),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Image.asset(
                            "assets/icon/arrowdown2png.png",
                            height: MySize.getScaledSizeHeight(24),
                            width: MySize.getScaledSizeWidth(24),
                          ),
                          value: controller.selectedMonth,
                          items: controller.thisYearList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (selectedItem) {
                            print("selectedItem=====>>${selectedItem}");

                            controller.selectedMonth = selectedItem;

                            controller.update();
                          },
                          hint: commonText.regularText(
                            "Select Month",
                            fontsize: 14.0,
                            tcolor: color.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffF9FAFD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: MySize.getScaledSizeHeight(48),
                                width: MySize.getScaledSizeHeight(48),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffCDF2CF),
                                ),
                                child: commonText.semiBoldText(
                                  "04",
                                  fontsize: MySize.getScaledSizeHeight(18),
                                ),
                              ),
                              SizedBox(width: MySize.getScaledSizeWidth(14)),
                              commonText.mediumText(
                                "Swaps",
                                fontsize: MySize.getScaledSizeHeight(16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: MySize.getScaledSizeWidth(14)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffF9FAFD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: MySize.getScaledSizeHeight(48),
                                width: MySize.getScaledSizeHeight(48),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffCDF2CF),
                                ),
                                child: commonText.semiBoldText(
                                  "05",
                                  fontsize: MySize.getScaledSizeHeight(18),
                                ),
                              ),
                              SizedBox(width: MySize.getScaledSizeWidth(14)),
                              commonText.mediumText(
                                "Campus",
                                fontsize: MySize.getScaledSizeHeight(16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffF9FAFD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: MySize.getScaledSizeHeight(48),
                                width: MySize.getScaledSizeHeight(48),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffCDF2CF),
                                ),
                                child: commonText.semiBoldText(
                                  "02",
                                  fontsize: MySize.getScaledSizeHeight(18),
                                ),
                              ),
                              SizedBox(width: MySize.getScaledSizeWidth(14)),
                              commonText.mediumText(
                                "Workit",
                                fontsize: MySize.getScaledSizeHeight(16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: MySize.getScaledSizeWidth(14)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffF9FAFD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: MySize.getScaledSizeHeight(48),
                                width: MySize.getScaledSizeHeight(48),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffCDF2CF),
                                ),
                                child: commonText.semiBoldText(
                                  "02",
                                  fontsize: MySize.getScaledSizeHeight(18),
                                ),
                              ),
                              SizedBox(width: MySize.getScaledSizeWidth(14)),
                              commonText.mediumText(
                                "Decline",
                                fontsize: MySize.getScaledSizeHeight(16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  String? text;
}
