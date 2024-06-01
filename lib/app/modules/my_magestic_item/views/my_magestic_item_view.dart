import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/edit_magestic_item/views/edit_magestic_item_view.dart';

import '../controllers/my_magestic_item_controller.dart';

class MyMagesticItemView extends GetView<MyMagesticItemController> {
  const MyMagesticItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<MyMagesticItemController>(
        init: MyMagesticItemController(),
        builder: (logic) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      // toolbarHeight: MySize.getScaledSizeHeight(69),
                      titleSpacing: 0.0,
                      flexibleSpace: SizedBox(),
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
                      backgroundColor: Colors.white,
                      title: commonText.mediumText(
                        "  ${stringsUtils.myMagesticItem}",
                        fontsize: MySize.getScaledSizeHeight(22),
                      ),
                    )
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                      controller.isLoading.value
                          ? MyMagesticItemShimmer()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.majesticList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                    padding: EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
                                    // height: MySize.getScaledSizeHeight(155),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Color(0xffEFEFEF),
                                      ),
                                    ),
                                    child: Row(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.asset(
                                            controller.majesticList[index]['image'],
                                            fit: BoxFit.cover,
                                            height: MySize.getScaledSizeHeight(125),
                                            width: MySize.getScaledSizeWidth(157),
                                          ),
                                        ),
                                        SizedBox(width: MySize.getScaledSizeWidth(12)),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: commonText.mediumText(
                                                      "Jumpsuit",
                                                      fontsize: MySize.getScaledSizeHeight(18),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: InkWell(
                                                      onTap: () {
                                                        showDeleteProductDailog(index: index);
                                                      },
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      child: Card(
                                                        elevation: 1.0,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(28.0),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Image.asset(
                                                            assetsUrl.deleteBoxIcon,
                                                            color: Colors.red,
                                                            height: MySize.getScaledSizeHeight(24),
                                                            width: MySize.getScaledSizeWidth(24),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: MySize.getScaledSizeHeight(0)),
                                              commonText.regularText(
                                                "Unique Collection",
                                                fontsize: MySize.getScaledSizeHeight(15),
                                                tcolor: Colors.black.withOpacity(.8),
                                              ),
                                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                                              commonText.semiBoldText(
                                                "\$45.00",
                                                fontsize: MySize.getScaledSizeHeight(16),
                                                tcolor: color.appColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(EditMagesticItemView(), transition: Transition.rightToLeft);
                                                },
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Container(
                                                    height: MySize.getScaledSizeHeight(36),
                                                    width: MySize.getScaledSizeWidth(80),
                                                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(6),
                                                      color: color.appColor,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          assetsUrl.editProductIcon,
                                                          height: MySize.getScaledSizeHeight(20),
                                                          width: MySize.getScaledSizeWidth(20),
                                                        ),
                                                        commonText.mediumText(
                                                          " Edit",
                                                          fontsize: MySize.getScaledSizeHeight(15),
                                                          tcolor: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     InkWell(
                                        //       onTap: () {
                                        //         Get.to(EditMagesticItemView(), transition: Transition.rightToLeft);
                                        //       },
                                        //       splashColor: Colors.transparent,
                                        //       highlightColor: Colors.transparent,
                                        //       child: Container(
                                        //         padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                        //         decoration: BoxDecoration(
                                        //           borderRadius: BorderRadius.circular(6),
                                        //           color: color.appColor,
                                        //         ),
                                        //         child: Row(
                                        //           children: [
                                        //             Image.asset(
                                        //               assetsUrl.editProductIcon,
                                        //               height: MySize.getScaledSizeHeight(20),
                                        //               width: MySize.getScaledSizeWidth(20),
                                        //             ),
                                        //             commonText.mediumText(
                                        //               " Edit",
                                        //               fontsize: MySize.getScaledSizeHeight(15),
                                        //               tcolor: Colors.white,
                                        //             )
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ));
                              },
                            )
                    ],
                  ),
                ),
              ));
        });
  }

  showDeleteProductDailog({index}) {
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
                  commonText.mediumText(
                    stringsUtils.deleteProduct,
                    fontsize: MySize.getScaledSizeHeight(24),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(14)),
                  commonText.regularText(stringsUtils.doyouwanttodelete, fontsize: MySize.getScaledSizeHeight(16)),
                  SizedBox(height: MySize.getScaledSizeHeight(14)),
                  Row(
                    children: [
                      Expanded(
                        child: commonWidget.customButton(
                          onTap: () {
                            Get.back();
                          },
                          height: MySize.getScaledSizeHeight(58),
                          textfontsize: MySize.getScaledSizeHeight(18),
                          text: stringsUtils.cancel,
                          Tcolor: color.appColor,
                          borderRadius: BorderRadius.circular(12),
                          backgroundColor: Colors.white,
                          border: Border.all(color: color.appColor),
                        ),
                      ),
                      SizedBox(width: MySize.getScaledSizeWidth(12)),
                      Expanded(
                        child: commonWidget.customButton(
                          onTap: () {
                            controller.majesticList.removeAt(index);
                            Get.back();
                            controller.update();
                          },
                          height: MySize.getScaledSizeHeight(58),
                          textfontsize: MySize.getScaledSizeHeight(18),
                          text: stringsUtils.yesDelete,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
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
