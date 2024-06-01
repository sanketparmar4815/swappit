import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/category_details/views/category_details_view.dart';
import '../controllers/see_all_category_controller.dart';

class SeeAllCategoryView extends GetView<SeeAllCategoryController> {
  const SeeAllCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<SeeAllCategoryController>(
        init: SeeAllCategoryController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: MySize.getScaledSizeHeight(60),
              titleSpacing: 0.0,
              elevation: 0.0,
              backgroundColor: Colors.white,
              //leadingWidth: Get.width / 1.8,
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
              title: commonText.mediumText(controller.flag == 1 ? " Select Category" : " Category", fontsize: MySize.getScaledSizeHeight(22)),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: MySize.getScaledSizeHeight(15)),
                              InkWell(
                                onTap: () {
                                  if (controller.flag == 1) {
                                    print("on tap is here dfdgfr");
                                    controller.selectedIndex = index;
                                    controller.selectCategoryName = controller.categoryList[index]['name'];
                                    controller.update();
                                  } else {
                                    Get.to(
                                      CategoryDetailsView(),
                                      arguments: {'name': controller.categoryList[index]['name']},
                                      transition: Transition.rightToLeft,
                                    );
                                  }
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      controller.categoryList[index]['icon'],
                                      height: MySize.getScaledSizeHeight(50),
                                      width: MySize.getScaledSizeWidth(50),
                                      // height: 50.0,
                                      // width: 50.0,
                                    ),
                                    SizedBox(width: MySize.getScaledSizeHeight(10)),
                                    commonText.mediumText(
                                      controller.categoryList[index]['name'],
                                      fontsize: MySize.getScaledSizeHeight(16),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      controller.flag == 1 && controller.selectedIndex == index
                                          ? assetsUrl.tickcircleIcon
                                          : controller.flag == 1
                                              ? assetsUrl.unTickCircleIcon
                                              : assetsUrl.arrow_forword,
                                      height: MySize.getScaledSizeHeight(24),
                                      width: MySize.getScaledSizeWidth(24),
                                      // height: 24,
                                      // width: 24,
                                      //scale: 4.3,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(15)),
                              Divider(
                                color: Colors.black.withOpacity(.1),
                              ),
                            ],
                          );
                        }),
                  ),
                  controller.flag == 1
                      ? commonWidget.customButton(
                          onTap: () {
                            if (controller.selectCategoryName == null) {
                              ShowFlushbar.showFlushbar(
                                "Please Select Category",
                                context: Get.context,
                                backgroundColor: Color(0xFFE1F5FE),
                                messageColor: Colors.black,
                                borderColor: Color(0xFFB3E5FC),
                                icon: Icon(
                                  Icons.info_outline,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              );
                              //ShowFlushbar.showFlushbar("Please Select Category", context: Get.context, backgroundColor: Colors.lightBlueAccent);
                            } else {
                              Get.back(result: {
                                'name': controller.selectCategoryName,
                              });
                            }
                          },
                          height: MySize.getScaledSizeHeight(58),
                          text: stringsUtils.select,
                          textfontsize: MySize.getScaledSizeHeight(18),
                        )
                      : SizedBox(),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                ],
              ),
            ),
          );
        });
  }
}
