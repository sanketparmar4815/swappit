import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<Search1Controller> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<Search1Controller>(
        init: Search1Controller(),
        builder: (logic) {
          return Obx(() {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                  body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      toolbarHeight: MySize.getScaledSizeHeight(80),
                      titleSpacing: 0.0,
                      backgroundColor: color.appColor,
                      //leadingWidth: Get.width / 1.8,
                      leading: Padding(
                        padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(13), right: MySize.getScaledSizeHeight(5)),
                        child: Obx(() {
                          return commonWidget.commonBackButton(
                            onTap: () {
                              controller.onTapBack.value = !controller.onTapBack.value;
                              Get.back(result: 1);
                            },
                            containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                            imageColor: controller.onTapBack.value ? Colors.white : color.black.withOpacity(.8),
                            imagePadding: EdgeInsets.all(7),
                          );
                        }),
                      ),
                      title: Container(
                        height: MySize.getScaledSizeHeight(52),
                        margin: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(8)),
                        child: TextFormField(
                          controller: controller.searchText,
                          onChanged: (value) {
                            if (controller.searchText.text.isNotEmpty) {
                              controller.text.value = true;
                              // print("text vakue ius :${controller.text.value}");
                              // print("shimmer values :${controller.isLodding.value}");
                              // controller.isLodding.value = true;
                              // Future.delayed(Duration(seconds: 2), () {
                              //   controller.isLodding.value = false;
                              //   controller.text.value = true;
                              //   controller.update();
                              //   print("isLodding.value---${controller.isLodding.value}");
                              // });
                            } else {
                              controller.text.value = false;
                              // controller.isLodding.value = false;
                            }
                          },
                          readOnly: false,
                          cursorColor: Colors.black,
                          style: TextStyle(
                            color: color.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Medium',
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
                          ],
                          decoration: InputDecoration(
                            hintText: "Search",
                            contentPadding: EdgeInsets.only(top: 17, bottom: 17, left: 17, right: 10),
                            hintStyle: TextStyle(
                              color: color.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Regular',
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Image.asset(
                                assetsUrl.searchIcon,
                                height: 15,
                                width: 15,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        InkWell(
                          onTap: () {
                            showFilterBottomSheet();
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.only(right: MySize.getScaledSizeHeight(16)),
                            child: Image.asset(
                              assetsUrl.searchFileterIcon,
                              height: MySize.getScaledSizeHeight(52),
                              width: MySize.getScaledSizeWidth(52),
                              // height: 52,
                              // width: 52,
                            ),
                          ),
                        ),
                      ],
                    )
                  ];
                },
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        controller.text.value == true
                            ? commonText.mediumText(
                                "Result",
                                fontsize: MySize.getScaledSizeHeight(16),
                              )
                            : SizedBox(),
                        SizedBox(height: MySize.getScaledSizeHeight(16)),
                        controller.text.value == true
                            ? ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
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
                                          commonText.mediumText(
                                            "Robert Fox",
                                            fontsize: MySize.getScaledSizeHeight(18),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              if (controller.isLike.contains(index)) {
                                                controller.isAnimationList[index] = true;
                                                controller.isLike.remove(index);
                                              } else {
                                                Future.delayed(Duration(milliseconds: 400), () {
                                                  controller.isAnimationList[index] = !controller.isAnimationList[index];

                                                  controller.update();
                                                });

                                                controller.isLike.add(index);
                                              }

                                              controller.update();
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
                                                child: !controller.isLike.contains(index)
                                                    ? Padding(
                                                        padding: EdgeInsets.all(9.0),
                                                        child: Image.asset(
                                                          assetsUrl.heartBorder,
                                                        ),
                                                      )
                                                    : controller.isAnimationList[index] == false
                                                        ? Padding(
                                                            padding: EdgeInsets.all(9.0),
                                                            child: Image.asset(
                                                              assetsUrl.heartFill,
                                                            ),
                                                          )
                                                        : Lottie.asset(
                                                            "assets/animation/isLikeIcon.json",
                                                            height: 45,
                                                            width: 45,
                                                          )),
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
                                                Image.asset(
                                                  assetsUrl.newSwapImg,
                                                  height: MySize.getScaledSizeHeight(176),
                                                  width: MySize.getScaledSizeHeight(151),
                                                  // height: 180,
                                                  // width: Get.height * 0.18,
                                                )
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
                                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                                    ],
                                  );
                                })
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 250),
                                  Center(
                                    child: commonText.mediumText(
                                      "No Result Found",
                                      fontsize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              )),
            );
          });
        });
  }

  showFilterBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Container(
          // height: 900,
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MySize.getScaledSizeHeight(16)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText.mediumText(
                      "Filters",
                      fontsize: MySize.getScaledSizeHeight(16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(16)),
              Divider(
                color: Colors.black.withOpacity(.3),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(16)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText.mediumText(
                        stringsUtils.category,
                        fontsize: 18.0,
                      ),
                      SizedBox(height: MySize.getScaledSizeHeight(12)),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFD),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              controller.campus.length,
                              (index) => Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    controller.campusSelected.value = index;
                                  },
                                  child: Container(
                                    height: MySize.getScaledSizeHeight(40),
                                    margin: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(9), vertical: MySize.getScaledSizeHeight(10)),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: controller.campusSelected == index ? color.appColor : Colors.transparent,
                                    ),
                                    child: commonText.regularText(
                                      controller.campus[index],
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: controller.campusSelected == index ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                      Container(
                        height: MySize.getScaledSizeHeight(120),
                        alignment: Alignment.center,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.campusSelected.value == 0
                                ? controller.categoryList.length
                                : controller.campusSelected.value == 1
                                    ? controller.categoryList2.length
                                    : controller.categoryList3.length,
                            itemBuilder: (context, index) {
                              return Obx(() {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(13)),
                                  child: InkWell(
                                    onTap: () {
                                      print("sduguhfoad");
                                      controller.categorySelect.value = index;
                                      controller.update();
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Obx(() {
                                          return Container(
                                            height: MySize.getScaledSizeHeight(62),
                                            width: MySize.getScaledSizeWidth(62),
                                            // height: 80,
                                            // width: 60,
                                            decoration: BoxDecoration(
                                              //color: color.appColor,
                                              color: controller.categorySelect.value == index ? color.appColor : Color(0xffDAFADC),
                                              shape: BoxShape.circle,
                                              border: Border.all(color: color.appColor, width: 1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Image.asset(
                                                controller.campusSelected.value == 0
                                                    ? controller.categoryList[index]['icon']
                                                    : controller.campusSelected.value == 1
                                                        ? controller.categoryList2[index]['icon']
                                                        : controller.categoryList3[index]['icon'],
                                                // height: 5,
                                                // width: 5,
                                                color: controller.categorySelect.value == index ? Colors.white : color.appColor,
                                                //color: color.white,
                                              ),
                                            ),
                                          );
                                        }),
                                        SizedBox(height: MySize.getScaledSizeHeight(4)),
                                        // Container(
                                        //   height: 25,
                                        //   width: 70,
                                        //   child: Marquee(
                                        //     text: controller.campusSelected.value == 0
                                        //         ? controller.categoryList[index]['name']
                                        //         : controller.campusSelected.value == 1
                                        //             ? controller.categoryList2[index]['name']
                                        //             : controller.categoryList3[index]['name'],
                                        //     style: TextStyle(color: Colors.black, fontFamily: 'Medium'),
                                        //     scrollAxis: Axis.horizontal,
                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                        //     blankSpace: 90.0,
                                        //     velocity: 30.0,
                                        //     //pauseAfterRound: Duration(seconds: 1),
                                        //     startPadding: 10.0,
                                        //     // accelerationDuration: Duration(seconds: 1),
                                        //   ),
                                        // )
                                        Container(
                                          width: 77,
                                          alignment: Alignment.center,
                                          child: commonText.mediumText(
                                            controller.campusSelected.value == 0
                                                ? controller.categoryList[index]['name']
                                                : controller.campusSelected.value == 1
                                                    ? controller.categoryList2[index]['name']
                                                    : controller.categoryList3[index]['name'],
                                            fontsize: MySize.getScaledSizeHeight(14),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            }),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(0)),
              Divider(
                color: Colors.black.withOpacity(.3),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(16)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText.mediumText(
                      "Distance",
                      fontsize: MySize.getScaledSizeHeight(18),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(60)),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        activeTickMarkColor: color.appColor,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Obx(() {
                        return RangeSlider(
                          min: 0.0,
                          max: 100.0,
                          activeColor: color.appColor,
                          divisions: 100,
                          labels: RangeLabels(
                            "0.0 KM",
                            "${controller.endSliderValue.value.toString()} KM",
                          ),
                          inactiveColor: color.appColor.withOpacity(0.2),
                          values: RangeValues(controller.startSliderValue.value, controller.endSliderValue.value),
                          onChanged: (values) {
                            //controller.startSliderValue.value = values.start;
                            controller.endSliderValue.value = values.end;
                            controller.update();
                          },
                        );
                      }),
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(60)),
                    Row(
                      children: [
                        Expanded(
                          child: commonWidget.customButton(
                            onTap: () {
                              Get.back();
                            },
                            height: MySize.getScaledSizeHeight(58),
                            text: "Cancel",
                            Tcolor: color.appColor,
                            textfontsize: MySize.getScaledSizeHeight(18),
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
                            text: "Apply",
                            textfontsize: MySize.getScaledSizeHeight(18),
                            backgroundColor: color.appColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(16)),
            ],
          ),
        );
      },
    );
  }
}
