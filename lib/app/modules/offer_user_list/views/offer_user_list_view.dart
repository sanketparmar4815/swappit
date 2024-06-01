import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/view_offer/views/view_offer_view.dart';

import '../controllers/offer_user_list_controller.dart';

class OfferUserListView extends GetView<OfferUserListController> {
  const OfferUserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<OfferUserListController>(
        init: OfferUserListController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              titleSpacing: 0.0,
              backgroundColor: Colors.white,
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
              title: commonText.mediumText(" Offers", fontsize: MySize.getScaledSizeHeight(22)),
            ),
            body: controller.isLoading.value
                ? OfferUserListShimmer()
                : Column(
                    children: [
                      SizedBox(height: MySize.getScaledSizeHeight(10)),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.offerList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(16), bottom: MySize.getScaledSizeHeight(16)),
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ViewOfferView(), arguments: {'flag': 1}, transition: Transition.rightToLeft);
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(14), vertical: MySize.getScaledSizeHeight(14)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: color.appColor.withOpacity(.5)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: MySize.getScaledSizeHeight(48),
                                        width: MySize.getScaledSizeWidth(48),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(controller.offerList[index]['image']),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(width: MySize.getScaledSizeWidth(10)),
                                      commonText.mediumText(
                                        controller.offerList[index]['name'],
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          );
        });
  }
}
