import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/add_majestic_item/views/add_majestic_item_view.dart';
import 'package:swapit/app/modules/create_swap/views/create_swap_view.dart';
import '../controllers/add_new_swap_product_controller.dart';

class AddNewSwapProductView extends GetView<AddNewSwapProductController> {
  const AddNewSwapProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<AddNewSwapProductController>(
        init: AddNewSwapProductController(),
        builder: (logic) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MySize.getScaledSizeHeight(20)),
                    SafeArea(
                      child: commonText.mediumText(
                        stringsUtils.helloSwapper,
                        fontsize: MySize.getScaledSizeHeight(22),
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    commonText.mediumText(
                      stringsUtils.addSwaps,
                      fontsize: MySize.getScaledSizeHeight(22),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.addSwapList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            index == 0 ? Get.to(CreateSwapView(), transition: Transition.rightToLeft) : SizedBox();
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16)),
                            height: MySize.getScaledSizeHeight(105),
                            padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(14), vertical: MySize.getScaledSizeHeight(14)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: color.appColor.withOpacity(.5),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: MySize.getScaledSizeHeight(40),
                                      width: MySize.getScaledSizeWidth(103),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xffCDF2CF).withOpacity(.5),
                                      ),
                                      child: commonText.regularText(
                                        controller.addSwapList[index]['text1'],
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                    ),
                                    SizedBox(height: MySize.getScaledSizeHeight(10)),
                                    commonText.mediumText(
                                      controller.addSwapList[index]['text2'],
                                      fontsize: MySize.getScaledSizeHeight(18),
                                    )
                                  ],
                                ),
                                Container(
                                  height: MySize.getScaledSizeHeight(35),
                                  width: MySize.getScaledSizeHeight(35),
                                  decoration: BoxDecoration(
                                    color: color.appColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(30)),
                    Material(
                      color: color.appColor,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        onTap: () {
                          Get.to(AddMajesticItemView(), transition: Transition.rightToLeft);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: MySize.getScaledSizeHeight(55),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: MySize.getScaledSizeHeight(10)),
                              commonText.mediumText(
                                stringsUtils.addMajesticItem,
                                fontsize: MySize.getScaledSizeHeight(18),
                                tcolor: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    // commonWidget.customButton(
                    //   onTap: () {},
                    //   height: MySize.getScaledSizeHeight(61),
                    //   text: stringsUtils.addMajesticItem,
                    //   textfontsize: MySize.getScaledSizeHeight(18),
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
