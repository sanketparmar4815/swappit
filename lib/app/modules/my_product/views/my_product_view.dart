import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/edit_product/views/edit_product_view.dart';
import 'package:swapit/app/modules/product_info/views/product_info_view.dart';
import '../controllers/my_product_controller.dart';

class MyProductView extends StatefulWidget {
  const MyProductView({super.key});

  @override
  State<MyProductView> createState() => _MyProductViewState();
}

class _MyProductViewState extends State<MyProductView> with AutomaticKeepAliveClientMixin {
  MyProductController controller = Get.put(MyProductController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<MyProductController>(
        init: MyProductController(),
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
              child: controller.isLoading.value
                  ? MyProductShimmer()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Obx(() {
                          return SafeArea(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                                height: controller.isVisible.value ? MySize.getScaledSizeHeight(40) : 0,
                                child: commonText.mediumText(
                                  stringsUtils.myProduct,
                                  fontsize: MySize.getScaledSizeHeight(22),
                                ),
                              ),
                            ),
                          );
                        }),
                        // SizedBox(height: MySize.getScaledSizeHeight(0)),
                        Obx(() {
                          return Container(
                            width: Get.width,
                            margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16), top: controller.isVisible.value ? 10.0 : 0),
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
                          );
                        }),
                        Expanded(
                          child: Obx(() {
                            return ListView.builder(
                              controller: myProductScrollController,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: controller.campusSelected.value == 0
                                  ? 8
                                  : controller.campusSelected.value == 1
                                      ? 3
                                      : 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16)),
                                  padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(8), vertical: MySize.getScaledSizeHeight(12)),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffEFEFEF),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Obx(() {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(ProductInfoView(),
                                                arguments: {
                                                  'flag': 2,
                                                  'flag2': controller.campusSelected.value == 0
                                                      ? 1
                                                      : controller.campusSelected.value == 1
                                                          ? 2
                                                          : 3
                                                },
                                                transition: Transition.rightToLeft);
                                          },
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
                                                  Image.asset(
                                                    assetsUrl.newSwapImg,
                                                    height: MySize.getScaledSizeHeight(176),
                                                    width: MySize.getScaledSizeHeight(151),
                                                    // height: 180,
                                                    // width: Get.height * 0.18,
                                                  ),
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
                                                  Image.asset(
                                                    assetsUrl.newSwapImg2,
                                                    height: MySize.getScaledSizeHeight(176),
                                                    width: MySize.getScaledSizeHeight(151),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: controller.campusSelected.value == 2 ? MySize.getScaledSizeHeight(12) : MySize.getScaledSizeHeight(16)),
                                        controller.campusSelected.value == 2
                                            ? Row(
                                                children: [
                                                  SizedBox(width: MySize.getScaledSizeWidth(8)),
                                                  commonText.mediumText(
                                                    "  This product has been exchanged.",
                                                    fontsize: MySize.getScaledSizeHeight(16),
                                                    tcolor: color.appColor,
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      color: color.appColor,
                                                      borderRadius: BorderRadius.circular(6),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.campusSelected.value == 0 ? Get.to(EditProductView(), transition: Transition.rightToLeft) : showMakeADeliveryIdBottomSheet();
                                                        },
                                                        borderRadius: BorderRadius.circular(6),
                                                        child: Container(
                                                          height: MySize.getScaledSizeHeight(36),
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(6),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Image.asset(
                                                                controller.campusSelected.value == 0 ? assetsUrl.editProductIcon : assetsUrl.makeDelivery,
                                                                height: MySize.getScaledSizeHeight(24),
                                                                width: MySize.getScaledSizeWidth(24),
                                                              ),
                                                              SizedBox(width: MySize.getScaledSizeWidth(6)),
                                                              commonText.mediumText(
                                                                controller.campusSelected.value == 0 ? "Edit" : "Make A Delivery",
                                                                fontsize: MySize.getScaledSizeHeight(15),
                                                                tcolor: Colors.white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: MySize.getScaledSizeWidth(14)),
                                                  Expanded(
                                                    child: Material(
                                                      color: color.appColor,
                                                      borderRadius: BorderRadius.circular(6),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.campusSelected.value == 0 ? showDeleteProductDailog(index: index) : showMarkAsSoldDailog();
                                                        },
                                                        borderRadius: BorderRadius.circular(6),
                                                        child: Container(
                                                          height: MySize.getScaledSizeHeight(36),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(6),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Image.asset(
                                                                controller.campusSelected.value == 0 ? assetsUrl.deleteBoxIcon : assetsUrl.markSold,
                                                                height: MySize.getScaledSizeHeight(24),
                                                                width: MySize.getScaledSizeWidth(24),
                                                              ),
                                                              SizedBox(width: MySize.getScaledSizeWidth(6)),
                                                              commonText.mediumText(
                                                                controller.campusSelected.value == 0 ? "Delete" : "Mark As Sold",
                                                                fontsize: MySize.getScaledSizeHeight(14),
                                                                tcolor: Colors.white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        SizedBox(height: controller.campusSelected.value == 2 ? 0 : MySize.getScaledSizeHeight(8)),
                                      ],
                                    );
                                  }),
                                );
                              },
                            );
                          }),
                        )
                      ],
                    ),
            ),
          );
          ;
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
                            Get.back();
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
