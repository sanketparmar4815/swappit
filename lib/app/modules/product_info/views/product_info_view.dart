import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/chat/views/chat_view.dart';
import 'package:swapit/app/modules/exchange_offer/views/exchange_offer_view.dart';
import 'package:swapit/app/modules/home/views/home_view.dart';
import 'package:swapit/app/modules/offer_user_list/views/offer_user_list_view.dart';
import 'package:swapit/app/modules/view_offer/views/view_offer_view.dart';
import 'package:swapit/app/modules/write_review/views/write_review_view.dart';

import '../controllers/product_info_controller.dart';

class ProductInfoView extends GetView<ProductInfoController> {
  const ProductInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductInfoController controller = Get.put(ProductInfoController());
    MySize().init(context);
    return GetBuilder<ProductInfoController>(
        init: ProductInfoController(),
        builder: (logic) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      toolbarHeight: MySize.getScaledSizeHeight(69),
                      // toolbarHeight: 73,
                      titleSpacing: 0.0,
                      flexibleSpace: SizedBox(),
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
                      backgroundColor: Colors.white,
                      title: commonText.mediumText(" Product Info Proposal", fontsize: MySize.getScaledSizeHeight(22)),
                      actions: [
                        controller.flag == 2
                            ? SizedBox()
                            : Obx(() {
                                return InkWell(
                                  onTap: () {
                                    controller.isLike.value = !controller.isLike.value;
                                    if (controller.isLike.value) {
                                      print("is here tao is true");
                                      // controller.ishartFillIcon.value == true;
                                      Future.delayed(Duration(milliseconds: 800), () {
                                        print("djvdsv${controller.ishartFillIcon.value}");
                                        controller.ishartFillIcon.value = !controller.ishartFillIcon.value;

                                        controller.update();
                                      });
                                    } else {
                                      print("is here tao is false");
                                      //controller.isLike.value = false;
                                      controller.ishartFillIcon.value = true;
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Container(
                                      height: MySize.getScaledSizeHeight(45),
                                      width: MySize.getScaledSizeWidth(45),
                                      // height: 40,
                                      // width: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffCDF2CF),
                                        shape: BoxShape.circle,
                                      ),
                                      child: !controller.isLike.value
                                          ? Padding(padding: EdgeInsets.all(11.0), child: Image.asset(assetsUrl.heartBorder))
                                          : !controller.ishartFillIcon.value
                                              ? Padding(
                                                  padding: EdgeInsets.all(11.0),
                                                  child: Image.asset(assetsUrl.heartFill),
                                                )
                                              : Lottie.asset(
                                                  "assets/animation/isLikeIcon.json",
                                                  height: 45,
                                                  width: 45,
                                                )),
                                );
                              }),
                        SizedBox(width: MySize.getScaledSizeHeight(16)),
                      ],
                    )
                  ];
                },
                body: Column(
                  children: [
                    controller.flag == 2
                        ? Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                                        commonText.mediumText(
                                          stringsUtils.myProduct,
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              assetsUrl.newSwapImg,
                                              height: MySize.getScaledSizeHeight(140),
                                              width: MySize.getScaledSizeHeight(120),
                                              // height: 180,
                                              // width: Get.height * 0.18,
                                            ),
                                            SizedBox(width: MySize.getScaledSizeWidth(16)),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 8),
                                                commonText.mediumText(
                                                  "Purple Shirt",
                                                  fontsize: MySize.getScaledSizeHeight(16),
                                                ),
                                                SizedBox(height: MySize.getScaledSizeHeight(10)),
                                                commonText.regularText(
                                                  "New Winter Wear",
                                                  fontsize: MySize.getScaledSizeHeight(15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                                        commonText.mediumText(
                                          stringsUtils.productDescription,
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                        commonText.regularText(
                                          "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.",
                                          fontsize: MySize.getScaledSizeHeight(15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Divider(),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Image.asset(
                                    controller.flag2 == 1
                                        ? assetsUrl.exchangeImg
                                        : controller.flag2 == 2 || controller.flag2 == 3
                                            ? assetsUrl.acceptedexchange
                                            : assetsUrl.acceptdProductImg,
                                    height: MySize.getScaledSizeHeight(34),
                                    // height: 34,
                                    // width: Get.width / 1.7,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                                        controller.flag2 == 2
                                            ? Row(
                                                children: [
                                                  Container(
                                                    height: MySize.getScaledSizeHeight(48),
                                                    width: MySize.getScaledSizeWidth(48),
                                                    // height: 48,
                                                    // width: 48,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(image: AssetImage(assetsUrl.notificationProfile)),
                                                        border: Border.all(
                                                          color: color.appColor,
                                                          width: 1,
                                                        )),
                                                  ),
                                                  SizedBox(width: MySize.getScaledSizeWidth(8)),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      commonText.mediumText(
                                                        "Carmen Adele",
                                                        fontsize: MySize.getScaledSizeHeight(18),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            assetsUrl.RatingImg,
                                                            height: MySize.getScaledSizeHeight(16),
                                                            width: MySize.getScaledSizeWidth(16),
                                                            // height: 16,
                                                            // width: 16,
                                                          ),
                                                          commonText.regularText(
                                                            "  4.5",
                                                            fontsize: MySize.getScaledSizeHeight(12),
                                                            tcolor: Color(0xff121212),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.launchURLPhone("");
                                                    },
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    child: Container(
                                                      height: MySize.getScaledSizeHeight(40),
                                                      width: MySize.getScaledSizeHeight(40),
                                                      padding: EdgeInsets.all(8),
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffCDF2CF).withOpacity(.5),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(assetsUrl.callingIcon),
                                                    ),
                                                  ),
                                                  SizedBox(width: MySize.getScaledSizeWidth(8)),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(ChatView(), arguments: {'flag': 2}, transition: Transition.rightToLeft);
                                                    },
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    child: Container(
                                                      height: MySize.getScaledSizeHeight(40),
                                                      width: MySize.getScaledSizeHeight(40),
                                                      padding: EdgeInsets.all(8),
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffCDF2CF).withOpacity(.5),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(assetsUrl.messageIcon),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
                                        SizedBox(height: controller.flag2 == 2 ? MySize.getScaledSizeHeight(16) : 0),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              assetsUrl.newSwapImg2,
                                              height: MySize.getScaledSizeHeight(140),
                                              width: MySize.getScaledSizeHeight(120),
                                              // height: 180,
                                              // width: Get.height * 0.18,
                                            ),
                                            SizedBox(width: MySize.getScaledSizeWidth(16)),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                commonText.mediumText(
                                                  "Brown Shirt",
                                                  fontsize: MySize.getScaledSizeHeight(16),
                                                ),
                                                SizedBox(height: MySize.getScaledSizeHeight(10)),
                                                commonText.regularText(
                                                  "New Winter Wear",
                                                  fontsize: MySize.getScaledSizeHeight(15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                                        commonText.mediumText(
                                          stringsUtils.productDescription,
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                        commonText.regularText(
                                          "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                      ],
                                    ),
                                  ),
                                  controller.flag2 == 1 || controller.flag2 == 2 ? Divider() : SizedBox(),
                                  controller.flag2 == 1 || controller.flag2 == 2
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                                              commonText.mediumText(
                                                "Exchange Address",
                                                fontsize: MySize.getScaledSizeHeight(16),
                                              ),
                                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                                              Container(
                                                height: MySize.getScaledSizeHeight(91),
                                                width: Get.width,
                                                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(14), vertical: MySize.getScaledSizeHeight(14)),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    border: Border.all(
                                                      color: color.appColor.withOpacity(.5),
                                                    )),
                                                child: commonText.regularText(
                                                  "125, Blocker Street,\nNew York,\nUSA-214578",
                                                  fontsize: MySize.getScaledSizeHeight(15),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                  controller.flag2 == 2
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                          child: Column(
                                            children: [
                                              controller.isVisible == true
                                                  ? Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          stringsUtils.deliveryStatus,
                                                          fontsize: MySize.getScaledSizeHeight(16),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: color.appColor.withOpacity(.5)),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: MySize.getScaledSizeHeight(56),
                                                                width: MySize.getScaledSizeWidth(56),
                                                                padding: EdgeInsets.all(9),
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xffCDF2CF),
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                child: Lottie.asset("assets/animation/shippedDoneTickIcon.json"),
                                                                // child: Image.asset(assetsUrl.tickcircleIcon),
                                                              ),
                                                              SizedBox(width: MySize.getScaledSizeWidth(14)),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  commonText.mediumText(
                                                                    "Shipped by You",
                                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                                  ),
                                                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      commonText.regularText(
                                                                        "Delivery via:",
                                                                        fontsize: MySize.getScaledSizeWidth(14),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                      commonText.regularText(
                                                                        " ${controller.yourDeliveryPlatformName}",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      commonText.regularText(
                                                                        "Tracking ID:",
                                                                        fontsize: MySize.getScaledSizeWidth(14),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                      commonText.regularText(
                                                                        " ${controller.yourTrackingId}",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      commonText.regularText(
                                                                        "20 March, 2024",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                      SizedBox(width: MySize.getScaledSizeWidth(30)),
                                                                      commonText.regularText(
                                                                        "05:20 PM",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: color.appColor.withOpacity(.5)),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 15.0),
                                                                child: Lottie.asset(
                                                                  "assets/animation/pendingProduct.json",
                                                                  height: MySize.getScaledSizeHeight(55),
                                                                  width: MySize.getScaledSizeWidth(55),
                                                                ),
                                                              ),
                                                              SizedBox(width: MySize.getScaledSizeWidth(14)),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  commonText.mediumText(
                                                                    "Shipped by Carmen Adele",
                                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                                  ),
                                                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      commonText.regularText(
                                                                        "Delivery via:",
                                                                        fontsize: MySize.getScaledSizeWidth(14),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                      commonText.regularText(
                                                                        " Maruti service",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      commonText.regularText(
                                                                        "Tracking ID:",
                                                                        fontsize: MySize.getScaledSizeWidth(14),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                      commonText.regularText(
                                                                        " 334902461",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      commonText.regularText(
                                                                        "20 March, 2024",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                      SizedBox(width: MySize.getScaledSizeWidth(30)),
                                                                      commonText.regularText(
                                                                        "05:20 PM",
                                                                        fontsize: MySize.getScaledSizeWidth(12),
                                                                        tcolor: Colors.black.withOpacity(.7),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Spacer(),
                                                              commonText.mediumText(
                                                                "in progress",
                                                                fontsize: MySize.getScaledSizeHeight(15),
                                                                tcolor: Color(0xffF79331),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : commonWidget.customButton(
                                                      onTap: () {
                                                        showMakeADeliveryIdBottomSheet();
                                                      },
                                                      height: MySize.getScaledSizeHeight(58),
                                                      textfontsize: MySize.getScaledSizeHeight(18),
                                                      text: stringsUtils.makeADelivery,
                                                    ),
                                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                                              controller.productSold == true
                                                  ? commonText.mediumText(
                                                      "This product has been sold.",
                                                      fontsize: MySize.getScaledSizeWidth(16),
                                                      tcolor: color.appColor,
                                                    )
                                                  : commonWidget.customButton(
                                                      onTap: () {
                                                        showMarkAsSoldDailog();
                                                      },
                                                      height: MySize.getScaledSizeHeight(58),
                                                      text: stringsUtils.markAsSold,
                                                      textfontsize: MySize.getScaledSizeHeight(18),
                                                      border: Border.all(color: color.appColor),
                                                      backgroundColor: Colors.white,
                                                      Tcolor: color.appColor,
                                                    ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
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
                                                Image.asset(
                                                  assetsUrl.newSwapImg2,
                                                  height: 180,
                                                  width: Get.height * 0.18,
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
                                                  fontsize: MySize.getScaledSizeHeight(16),
                                                ),
                                                SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                Image.asset(
                                                  assetsUrl.newSwapImg,
                                                  height: 180,
                                                  width: Get.height * 0.18,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Divider(),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
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
                                            SizedBox(width: MySize.getScaledSizeWidth(8)),
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
                                                      height: MySize.getScaledSizeHeight(16),
                                                      width: MySize.getScaledSizeWidth(16),
                                                      // height: 16,
                                                      // width: 16,
                                                    ),
                                                    commonText.regularText(
                                                      "  4.5",
                                                      fontsize: MySize.getScaledSizeHeight(12),
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
                                        commonText.mediumText(
                                          "Product Description",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                        commonText.regularText(
                                          "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Divider(),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Image.asset(
                                    fit: BoxFit.cover,
                                    controller.flag == 2 ? assetsUrl.acceptdProductImg : assetsUrl.exchangeImg,
                                    height: MySize.getScaledSizeHeight(34),
                                    width: Get.width / 1.7,
                                    // height: 34,
                                    // width: Get.width / 1.7,
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
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
                                        commonText.mediumText(
                                          "Product Description",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                        commonText.regularText(
                                          "NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset.NARA has the elegant, fitted look with shimmer all over lace and sweetheart neckline. Also has a detachable skirt with tulle and scatter shimmer lace, back comes in zipper or corset",
                                          fontsize: MySize.getScaledSizeHeight(16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    controller.flag2 == 2
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                            child: controller.flag == 1 || controller.flag2 == 1 || controller.flag2 == 3
                                ? commonWidget.customButton(
                                    onTap: () {
                                      controller.flag2 == 1 && controller.editFlag != 1
                                          ? Get.to(OfferUserListView(), transition: Transition.rightToLeft)
                                          : controller.flag2 == 3
                                              ? Get.to(WriteReviewView(), transition: Transition.rightToLeft)
                                              : Get.to(ViewOfferView(), arguments: {'editFlag': controller.editFlag}, transition: Transition.rightToLeft);
                                    },
                                    height: MySize.getScaledSizeHeight(58),
                                    text: controller.flag2 == 3 ? "Write Review" : "View Offer",
                                    textfontsize: MySize.getScaledSizeHeight(18),
                                    border: Border.all(color: color.appColor),
                                    backgroundColor: Colors.white,
                                    Tcolor: color.appColor,
                                  )
                                : controller.flag == 2
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: commonWidget.customButton(
                                              onTap: () {
                                                Get.to(ChatView(), arguments: {'flag': 1}, transition: Transition.rightToLeft);
                                              },
                                              height: MySize.getScaledSizeHeight(58),
                                              textfontsize: MySize.getScaledSizeHeight(18),
                                              text: stringsUtils.message,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: commonWidget.customButton(
                                              onTap: () {
                                                controller.launchURLPhone("");
                                              },
                                              height: MySize.getScaledSizeHeight(58),
                                              textfontsize: MySize.getScaledSizeHeight(18),
                                              backgroundColor: color.white,
                                              Tcolor: color.appColor,
                                              border: Border.all(color: color.appColor),
                                              text: stringsUtils.call,
                                            ),
                                          ),
                                        ],
                                      )
                                    : commonWidget.customButton(
                                        onTap: () {
                                          Get.to(ExchangeOfferView(), transition: Transition.rightToLeft);
                                        },
                                        height: MySize.getScaledSizeHeight(58),
                                        text: "Let’s Exchange",
                                        textfontsize: MySize.getScaledSizeHeight(18),
                                      ),
                          ),
                  ],
                ),
              ));
        });
  }

  showMakeADeliveryIdBottomSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: BoxDecoration(
              color: color.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    commonText.mediumText(
                      stringsUtils.pleaseenteryourdelivery,
                      fontsize: MySize.getScaledSizeHeight(16),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(12)),
                    commonText.regularText(
                      stringsUtils.enterDeliveryPlatformName,
                      fontsize: MySize.getScaledSizeHeight(15),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(8)),
                    commonWidget.customTextfield(
                      controller: controller.deliveryPlatformName,
                      hintText: stringsUtils.entername,
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return "Enter Delivery Platform Name";
                        }
                      },
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    commonText.regularText(
                      stringsUtils.enterTrackingID,
                      fontsize: MySize.getScaledSizeHeight(15),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(8)),
                    commonWidget.customTextfield(
                      controller: controller.trackingId,
                      hintText: stringsUtils.enterid,
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return "Enter Tracking ID";
                        }
                      },
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    commonWidget.customButton(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.isVisible = true;
                          controller.yourDeliveryPlatformName = controller.deliveryPlatformName.text;
                          controller.yourTrackingId = controller.trackingId.text;
                          controller.update();
                          Get.back();
                        }
                      },
                      height: MySize.getScaledSizeHeight(58),
                      text: "Submit",
                      textfontsize: MySize.getScaledSizeHeight(18),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: commonText.mediumText(
                          stringsUtils.cancel,
                          fontsize: MySize.getScaledSizeHeight(16),
                          tcolor: Colors.black.withOpacity(.7),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(16)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  showMarkAsSoldDailog() {
    return showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MySize.getScaledSizeHeight(20)),
                    commonText.mediumText(
                      stringsUtils.soldProduct,
                      fontsize: MySize.getScaledSizeHeight(24),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(14)),
                    commonText.regularText(
                      stringsUtils.areyousuretomark,
                      fontsize: MySize.getScaledSizeHeight(16),
                      textAlign: TextAlign.center,
                    ),
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
                              Get.back();
                              controller.productSold = true;
                              controller.update();
                            },
                            height: MySize.getScaledSizeHeight(58),
                            textfontsize: MySize.getScaledSizeHeight(18),
                            text: stringsUtils.yesSold,
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
        });
  }
}
