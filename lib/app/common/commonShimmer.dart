import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/home/controllers/home_controller.dart';
import 'package:swapit/app/modules/majestic/controllers/majestic_controller.dart';
import 'package:swapit/app/modules/message/controllers/message_controller.dart';
import 'package:swapit/app/modules/my_product/controllers/my_product_controller.dart';
import 'package:swapit/app/modules/offer_user_list/controllers/offer_user_list_controller.dart';
import 'package:swapit/app/modules/search/controllers/search_controller.dart';

Widget HomeShowShimmer({context}) {
  MySize().init(context);
  HomeController controller = Get.put(HomeController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          commonText.mediumText(
            stringsUtils.specialOffer,
            fontsize: 18.0,
          ),
          SizedBox(height: 8),
          SizedBox(
            height: MySize.getScaledSizeHeight(200),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return commonWidget.commonShimmer(
                    height: MySize.getScaledSizeHeight(200),
                    width: Get.width,
                    borderRadius: BorderRadius.circular(12),
                    // margin: EdgeInsets.only(right: 10),
                  );
                }),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: commonWidget.commonShimmer(
              height: 60,
              width: Get.width,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: commonWidget.commonShimmer(
              height: 60,
              width: Get.width,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          SizedBox(height: 15),
          commonText.mediumText(
            stringsUtils.category,
            fontsize: 18.0,
          ),
          SizedBox(height: 8),
          Container(
            height: 60,
            child: commonWidget.commonShimmer(
              height: 60,
              width: Get.width,
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              commonText.mediumText(
                stringsUtils.newSwaps,
                fontsize: 16.0,
              ),
              Spacer(),
              commonText.mediumText(
                stringsUtils.seeall,
                fontsize: 12.0,
              ),
              Image.asset(
                assetsUrl.seeAllIcon,
                height: 24,
                width: 24,
              ),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 185,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return commonWidget.commonShimmer(
                  height: 185,
                  width: Get.width / 1.3,
                  borderRadius: BorderRadius.circular(10),
                  margin: EdgeInsets.only(right: 10),
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              commonText.mediumText(
                "Recommended Swaps",
                fontsize: 16.0,
              ),
              Spacer(),
              commonText.mediumText(
                stringsUtils.seeall,
                fontsize: 12.0,
              ),
              Image.asset(
                assetsUrl.seeAllIcon,
                height: 24,
                width: 24,
              ),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 185,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return commonWidget.commonShimmer(
                  height: 185,
                  width: Get.width / 1.3,
                  borderRadius: BorderRadius.circular(10),
                  margin: EdgeInsets.only(right: 10),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget MajesticFindShimmer() {
  MajesticController controller = Get.put(MajesticController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            padding: EdgeInsets.only(top: 14),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.majesticList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // mainAxisExtent: Get.height * 0.243,
              childAspectRatio: 2 / 2.2,
            ),
            itemBuilder: (context, index) {
              return commonWidget.commonShimmer(
                height: 180,
                width: 173,
                borderRadius: BorderRadius.circular(12),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget MessageViewShimmer() {
  MessageController controller = Get.put(MessageController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 00.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MySize.getScaledSizeHeight(16)),
        Obx(() {
          return SafeArea(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: controller.isVisible.value ? MySize.getScaledSizeHeight(40) : 0,
              child: commonText.mediumText(
                "Message",
                fontsize: MySize.getScaledSizeHeight(22),
              ),
            ),
          );
        }),
        SizedBox(height: MySize.getScaledSizeHeight(10)),
        commonWidget.customTextfield(
          hintText: "Search",
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.0),
            child: Image.asset(
              assetsUrl.searchIcon,
              height: 15,
              width: 15,
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () {
                        // Get.to(ChatView(), transition: Transition.rightToLeft);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              commonWidget.commonShimmer(height: 48, width: 48, shape: BoxShape.circle
                                  // borderRadius: BorderRadius.circular(12),
                                  ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonWidget.commonShimmer(
                                    height: 15,
                                    width: 115,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  SizedBox(height: 8),
                                  commonWidget.commonShimmer(
                                    height: 14,
                                    width: 150,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ],
                              ),
                              Spacer(),
                              commonWidget.commonShimmer(
                                height: 18,
                                width: 18,
                                shape: BoxShape.circle,
                              ),
                              SizedBox(width: 4),
                              commonWidget.commonShimmer(
                                height: 10,
                                width: 49,
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    ),
  );
}

Widget CategoryDetailViewShimmer() {
  // MessageController controller = Get.put(MessageController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 00.0),
    child: SingleChildScrollView(
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
                      commonWidget.commonShimmer(
                        height: 48, width: 48, shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(12),
                      ),
                      SizedBox(width: 10),
                      commonText.mediumText(
                        "Robert Fox",
                        fontsize: 18.0,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          // if (controller.isLike.contains(index)) {
                          //   controller.isLike.remove(index);
                          // } else {
                          //   controller.isLike.add(index);
                          // }
                          //
                          // controller.update();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: commonWidget.commonShimmer(
                          height: 48, width: 48, shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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
                              fontsize: 12.0,
                            ),
                            commonWidget.commonShimmer(
                              height: 180,
                              width: Get.height * 0.18,
                              borderRadius: BorderRadius.circular(12),
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
                              fontsize: 12.0,
                            ),
                            commonWidget.commonShimmer(
                              height: 180,
                              width: Get.height * 0.18,
                              borderRadius: BorderRadius.circular(12),
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
    ),
  );
}

Widget seeNewSwapViewShimmer() {
  // MessageController controller = Get.put(MessageController());
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 00.0),
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
                      commonWidget.commonShimmer(
                        height: 48, width: 48, shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(12),
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
                              fontsize: 12.0,
                            ),
                            commonWidget.commonShimmer(
                              height: 180,
                              width: Get.height * 0.18,
                              borderRadius: BorderRadius.circular(12),
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
                              fontsize: 12.0,
                            ),
                            commonWidget.commonShimmer(
                              height: 180,
                              width: Get.height * 0.18,
                              borderRadius: BorderRadius.circular(12),
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
    ),
  );
}

Widget MyProductShimmer() {
  MyProductController controller = Get.put(MyProductController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MySize.getScaledSizeHeight(20)),
        SafeArea(
          child: commonText.mediumText(
            stringsUtils.myProduct,
            fontsize: MySize.getScaledSizeHeight(22),
          ),
        ),
        SizedBox(height: MySize.getScaledSizeHeight(14)),
        Container(
          width: Get.width,
          margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16)),
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFD),
            borderRadius: BorderRadius.circular(90),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.productStatus.length,
                (index) => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    controller.campusSelected.value = index;
                  },
                  child: Obx(() {
                    return Container(
                      height: MySize.getScaledSizeHeight(40),

                      // height: 40,
                      width: Get.width * 0.25,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: controller.campusSelected.value == index ? color.appColor : Colors.transparent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: commonText.regularText(
                          controller.productStatus[index],
                          fontsize: MySize.getScaledSizeHeight(16),
                          tcolor: controller.campusSelected.value == index ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: MySize.getScaledSizeHeight(14)),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: Get.width,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16)),
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(8), vertical: MySize.getScaledSizeHeight(12)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffEFEFEF),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
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
                              commonWidget.commonShimmer(
                                height: MySize.getScaledSizeHeight(176),
                                width: MySize.getScaledSizeHeight(151),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Image.asset(
                              //   assetsUrl.newSwapImg,
                              //   height: MySize.getScaledSizeHeight(176),
                              //   width: MySize.getScaledSizeHeight(151),
                              //   // height: 180,
                              //   // width: Get.height * 0.18,
                              // ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(5)),
                            child: Image.asset(
                              assetsUrl.swapArroeIcon,
                              height: MySize.getScaledSizeHeight(24),
                              width: MySize.getScaledSizeWidth(24),
                              // height: 18,
                              // width: 18,
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
                              commonWidget.commonShimmer(
                                height: MySize.getScaledSizeHeight(176),
                                width: MySize.getScaledSizeHeight(151),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Image.asset(
                              //   assetsUrl.newSwapImg2,
                              //   height: MySize.getScaledSizeHeight(176),
                              //   width: MySize.getScaledSizeHeight(151),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            borderRadius: BorderRadius.circular(6),
                            child: InkWell(
                              onTap: () {
                                //controller.campusSelected.value == 0 ? Get.to(EditProductView(), transition: Transition.rightToLeft) : showMakeADeliveryIdBottomSheet();
                              },
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                  height: MySize.getScaledSizeHeight(36),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: commonWidget.commonShimmer(
                                    height: MySize.getScaledSizeHeight(36),
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(14)),
                        Expanded(
                          child: Material(
                            borderRadius: BorderRadius.circular(6),
                            child: InkWell(
                              onTap: () {
                                // controller.campusSelected.value == 0 ? showDeleteProductDailog(index: index) : showMarkAsSoldDailog();
                              },
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                  height: MySize.getScaledSizeHeight(36),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: commonWidget.commonShimmer(
                                    height: MySize.getScaledSizeHeight(36),
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(8)),
                  ],
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}

Widget OfferUserListShimmer() {
  OfferUserListController controller = Get.put(OfferUserListController());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    //Get.to(ViewOfferView(), arguments: {'flag': 1}, transition: Transition.rightToLeft);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(14), vertical: MySize.getScaledSizeHeight(14)),
                    decoration: BoxDecoration(
                      border: Border.all(color: color.grey.withOpacity(.5)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        commonWidget.commonShimmer(
                          height: 48,
                          width: 48,
                          shape: BoxShape.circle,
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(10)),
                        commonWidget.commonShimmer(
                          height: 17,
                          width: 156,
                          // borderRadius: BorderRadius.circular(4),
                        ),
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
}

Widget SerachListShimmer() {
  Search1Controller controller = Get.put(Search1Controller());
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.0),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MySize.getScaledSizeHeight(16)),
          commonText.mediumText(
            "Result",
            fontsize: MySize.getScaledSizeHeight(16),
          ),
          SizedBox(height: MySize.getScaledSizeHeight(16)),
          ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        commonWidget.commonShimmer(
                          height: 48,
                          width: 48,
                          shape: BoxShape.circle,
                        ),
                        SizedBox(width: MySize.getScaledSizeWidth(8)),
                        commonWidget.commonShimmer(
                          height: 16,
                          width: 150,
                        ),
                        Spacer(),
                        commonWidget.commonShimmer(
                          height: 45,
                          width: 45,
                          shape: BoxShape.circle,
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(10)),
                    Container(
                      // height: 234,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(10), vertical: MySize.getScaledSizeHeight(12)),
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
                              commonWidget.commonShimmer(
                                height: MySize.getScaledSizeHeight(176),
                                width: MySize.getScaledSizeHeight(151),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(4)),
                            child: Image.asset(
                              assetsUrl.swapArroeIcon,
                              height: MySize.getScaledSizeHeight(24),
                              width: MySize.getScaledSizeHeight(24),
                              // height: 18,
                              // width: 18,
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
                              commonWidget.commonShimmer(
                                height: MySize.getScaledSizeHeight(176),
                                width: MySize.getScaledSizeHeight(151),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                  ],
                );
              })
        ],
      ),
    ),
  );
}

Widget MyMagesticItemShimmer() {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              padding: EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 0),
              // height: MySize.getScaledSizeHeight(153),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xffEFEFEF),
                ),
              ),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonWidget.commonShimmer(
                    height: MySize.getScaledSizeHeight(125),
                    width: MySize.getScaledSizeWidth(157),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  SizedBox(width: MySize.getScaledSizeWidth(12)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: commonWidget.commonShimmer(
                                height: MySize.getScaledSizeHeight(18),
                                width: MySize.getScaledSizeWidth(30),
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                            commonWidget.commonShimmer(
                              height: MySize.getScaledSizeHeight(40),
                              width: MySize.getScaledSizeWidth(40),
                              shape: BoxShape.circle,
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(0)),
                        commonWidget.commonShimmer(
                          height: MySize.getScaledSizeHeight(15),
                          width: MySize.getScaledSizeWidth(100),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                        commonWidget.commonShimmer(
                          height: MySize.getScaledSizeHeight(15),
                          width: MySize.getScaledSizeWidth(70),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(EditMagesticItemView(), transition: Transition.rightToLeft);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: commonWidget.commonShimmer(
                              height: MySize.getScaledSizeHeight(36),
                              width: MySize.getScaledSizeWidth(80),
                              borderRadius: BorderRadius.circular(4),
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
              ),
              // child: Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     commonWidget.commonShimmer(
              //       height: MySize.getScaledSizeHeight(125),
              //       width: MySize.getScaledSizeWidth(157),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     SizedBox(width: MySize.getScaledSizeWidth(12)),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 commonWidget.commonShimmer(
              //                   height: MySize.getScaledSizeHeight(18),
              //                   width: MySize.getScaledSizeWidth(72),
              //                 ),
              //                 SizedBox(height: MySize.getScaledSizeHeight(10)),
              //                 commonWidget.commonShimmer(
              //                   height: MySize.getScaledSizeHeight(18),
              //                   width: MySize.getScaledSizeWidth(90),
              //                 ),
              //                 SizedBox(height: MySize.getScaledSizeHeight(10)),
              //                 commonWidget.commonShimmer(
              //                   height: MySize.getScaledSizeHeight(20),
              //                   width: MySize.getScaledSizeWidth(50),
              //                 ),
              //               ],
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(left: 10.0),
              //               child: commonWidget.commonShimmer(
              //                 height: MySize.getScaledSizeHeight(40),
              //                 width: MySize.getScaledSizeWidth(40),
              //                 shape: BoxShape.circle,
              //               ),
              //             ),
              //           ],
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(right: 5, top: 8),
              //           child: commonWidget.commonShimmer(
              //             height: MySize.getScaledSizeHeight(36),
              //             width: MySize.getScaledSizeWidth(80),
              //             borderRadius: BorderRadius.circular(6),
              //           ),
              //         )
              //       ],
              //     ),
              //     //Spacer(),
              //   ],
              // ),
            );
          },
        )
      ],
    ),
  );
}
