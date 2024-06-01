import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/product_info/views/product_info_view.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<NotificationController>(
        init: NotificationController(),
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
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(10)),
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
              title: commonText.mediumText(" ${stringsUtils.notifications}", fontsize: MySize.getScaledSizeHeight(22)),
            ),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(MySize.getScaledSizeHeight(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Row(
                      children: [
                        commonText.regularText(
                          "Today",
                          fontsize: MySize.getScaledSizeHeight(16),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(10)),
                        CircleAvatar(
                          radius: MySize.getScaledSizeHeight(9),
                          backgroundColor: color.appColor,
                          child: commonText.regularText(
                            "3",
                            fontsize: MySize.getScaledSizeHeight(12),
                            tcolor: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    InkWell(
                      onTap: () {
                        Get.to(ProductInfoView(), arguments: {'flag': 2}, transition: Transition.rightToLeft);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            height: MySize.getScaledSizeHeight(60),
                            width: MySize.getScaledSizeHeight(60),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(assetsUrl.searchProfileImg),
                            )),
                          ),
                          SizedBox(width: MySize.getScaledSizeWidth(12)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MySize.getScaledSizeWidth(270),
                                child: Row(
                                  children: [
                                    commonText.mediumText(
                                      "Robert Fox",
                                      fontsize: MySize.getScaledSizeHeight(15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    commonText.mediumText(
                                      " accepted your offer",
                                      fontsize: MySize.getScaledSizeHeight(15),
                                      tcolor: color.black.withOpacity(.6),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonText.mediumText(
                                "20 March, 2024",
                                fontsize: MySize.getScaledSizeHeight(13),
                                tcolor: Colors.black.withOpacity(.3),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    InkWell(
                      onTap: () {
                        Get.to(ProductInfoView(), arguments: {'flag': 1}, transition: Transition.rightToLeft);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            height: MySize.getScaledSizeHeight(60),
                            width: MySize.getScaledSizeHeight(60),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(assetsUrl.notificationProfile),
                            )),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MySize.getScaledSizeWidth(270),
                                    child: Row(
                                      children: [
                                        commonText.mediumText(
                                          "You have a new offer from",
                                          fontsize: MySize.getScaledSizeHeight(15),
                                          tcolor: Colors.black.withOpacity(.6),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Expanded(
                                          child: commonText.mediumText(
                                            "“Carmen Adele”",
                                            fontsize: MySize.getScaledSizeHeight(15),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonText.mediumText(
                                "20 March, 2024",
                                fontsize: MySize.getScaledSizeHeight(13),
                                tcolor: Colors.black.withOpacity(.3),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Row(
                      children: [
                        Container(
                          height: MySize.getScaledSizeHeight(60),
                          width: MySize.getScaledSizeHeight(60),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(assetsUrl.notificationProfile),
                          )),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MySize.getScaledSizeWidth(270),
                                  child: Row(
                                    children: [
                                      commonText.mediumText(
                                        "Vin Diesel ",
                                        fontsize: MySize.getScaledSizeHeight(15),
                                      ),
                                      Expanded(
                                        child: commonText.mediumText(
                                          "your product added successfully",
                                          fontsize: MySize.getScaledSizeHeight(15),
                                          overflow: TextOverflow.ellipsis,
                                          tcolor: Colors.black.withOpacity(.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            commonText.mediumText(
                              "20 March, 2024",
                              fontsize: MySize.getScaledSizeHeight(13),
                              tcolor: Colors.black.withOpacity(.3),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    commonText.regularText(
                      "Yesterday",
                      fontsize: MySize.getScaledSizeHeight(16),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Row(
                      children: [
                        Container(
                          height: MySize.getScaledSizeHeight(60),
                          width: MySize.getScaledSizeHeight(60),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(assetsUrl.searchProfileImg),
                          )),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                commonText.mediumText(
                                  "Robert Fox",
                                  fontsize: MySize.getScaledSizeHeight(15),
                                ),
                                commonText.mediumText(
                                  " declined your offer",
                                  fontsize: MySize.getScaledSizeHeight(15),
                                  tcolor: color.black.withOpacity(.6),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            commonText.mediumText(
                              "20 March, 2024",
                              fontsize: MySize.getScaledSizeHeight(13),
                              tcolor: Colors.black.withOpacity(.3),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Row(
                      children: [
                        Container(
                          height: MySize.getScaledSizeHeight(60),
                          width: MySize.getScaledSizeHeight(60),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(assetsUrl.notificationProfile),
                          )),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MySize.getScaledSizeWidth(270),
                                  child: Row(
                                    children: [
                                      commonText.mediumText(
                                        "Vin Diesel ",
                                        fontsize: MySize.getScaledSizeHeight(15),
                                      ),
                                      Expanded(
                                        child: commonText.mediumText(
                                          "your product added successfully",
                                          fontsize: MySize.getScaledSizeHeight(15),
                                          overflow: TextOverflow.ellipsis,
                                          tcolor: Colors.black.withOpacity(.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            commonText.mediumText(
                              "20 March, 2024",
                              fontsize: MySize.getScaledSizeHeight(13),
                              tcolor: Colors.black.withOpacity(.3),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Row(
                      children: [
                        Container(
                          height: MySize.getScaledSizeHeight(60),
                          width: MySize.getScaledSizeHeight(60),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(assetsUrl.notificationProfile),
                          )),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MySize.getScaledSizeWidth(270),
                                  child: Row(
                                    children: [
                                      commonText.mediumText(
                                        "Vin Diesel ",
                                        fontsize: MySize.getScaledSizeHeight(15),
                                      ),
                                      Expanded(
                                        child: commonText.mediumText(
                                          "your product added successfully",
                                          fontsize: MySize.getScaledSizeHeight(15),
                                          overflow: TextOverflow.ellipsis,
                                          tcolor: Colors.black.withOpacity(.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                            commonText.mediumText(
                              "20 March, 2024",
                              fontsize: MySize.getScaledSizeHeight(13),
                              tcolor: Colors.black.withOpacity(.3),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
