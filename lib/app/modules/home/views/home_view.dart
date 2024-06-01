import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/category_details/views/category_details_view.dart';
import 'package:swapit/app/modules/home/controllers/home_controller.dart';
import 'package:swapit/app/modules/notification/views/notification_view.dart';
import 'package:swapit/app/modules/product_info/views/product_info_view.dart';
import 'package:swapit/app/modules/profile/views/profile_view.dart';
import 'package:swapit/app/modules/recommended_swap/views/recommended_swap_view.dart';
import 'package:swapit/app/modules/search/views/search_view.dart';
import 'package:swapit/app/modules/see_all_category/views/see_all_category_view.dart';
import 'package:swapit/app/modules/see_new_swap/views/see_new_swap_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin {
  HomeController controller = Get.put(HomeController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: color.appColor, // Status bar color
    // ));
    super.build(context);
    MySize().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      assignId: true,
      builder: (logic) {
        return WillPopScope(
            onWillPop: () {
              return controller.onWilPopScope();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  ///top header
                  Container(
                    color: color.appColor,
                    child: Column(
                      children: [
                        Obx(() {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                            color: color.appColor,
                            height: controller.isVisible.value ? 94 : 0,
                            // Animated height

                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: SafeArea(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProfileView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Image.asset(
                                      assetsUrl.homeProfileImg,
                                      scale: 4.5,
                                      // height: MySize.getScaledSizeHeight(50),
                                      // width: MySize.getScaledSizeWidth(50),
                                    ),
                                  ),
                                  SizedBox(width: MySize.getScaledSizeWidth(16)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProfileView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          commonText.mediumText(
                                            "Eleanor Pena",
                                            fontsize: MySize.getScaledSizeHeight(17),
                                            // fontsize: 16.0,
                                            tcolor: color.white,
                                          ),
                                          SizedBox(height: MySize.getScaledSizeHeight(5)),
                                          Row(
                                            children: [
                                              Image.asset(
                                                assetsUrl.locationIcon,
                                                height: MySize.getScaledSizeHeight(20),
                                                width: MySize.getScaledSizeWidth(20),
                                                // height: 20,
                                                // width: 20,
                                              ),
                                              commonText.regularText(
                                                " California, US",
                                                // fontsize: 14.0,
                                                fontsize: MySize.getScaledSizeHeight(14),
                                                tcolor: color.white,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(NotificationView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      child: Image.asset(
                                        assetsUrl.notificationIcon,
                                        scale: 4.3,
                                        // height: MySize.getScaledSizeHeight(38),
                                        // width: MySize.getScaledSizeWidth(38),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        Obx(() {
                          return Container(
                            // height: MySize.getScaledSizeHeight(80),
                            padding: controller.isVisible.value == false ? EdgeInsets.only(top: 43, bottom: 8, right: 16, left: 16) : EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(16), bottom: MySize.getScaledSizeHeight(10), top: MySize.getScaledSizeHeight(15)),
                            color: color.appColor,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: MySize.getScaledSizeHeight(50),
                                    child: TextFormField(
                                      onTap: () {
                                        Get.to(SearchView(), transition: Transition.rightToLeft);
                                      },
                                      readOnly: true,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        color: color.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Medium',
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        contentPadding: EdgeInsets.only(top: MySize.getScaledSizeHeight(10), bottom: 17, left: 17, right: 10),
                                        hintStyle: TextStyle(
                                          color: color.grey,
                                          fontSize: MySize.getScaledSizeHeight(15),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Regular',
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            assetsUrl.searchIcon,
                                            // height: 15,
                                            // width: 15,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                          borderRadius: BorderRadius.circular(70),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                          borderRadius: BorderRadius.circular(70),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    showFilterBottomSheet();
                                    // Get.to(SearchView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image.asset(
                                    assetsUrl.filterIcon,
                                    height: MySize.getScaledSizeHeight(52),
                                    width: MySize.getScaledSizeWidth(52),
                                    // height: 52,
                                    // width: 52,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  ///search bar

                  !controller.isLodding.value
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  commonText.mediumText(
                                    stringsUtils.specialOffer,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),

                                  Container(
                                    height: MySize.getScaledSizeHeight(200),
                                    child: Swiper(
                                      loop: true,
                                      physics: BouncingScrollPhysics(),
                                      autoplay: true,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          margin: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(5)),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                controller.offerImage[index],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: MySize.getScaledSizeHeight(35)),
                                              commonText.boldText(
                                                "50-40% OFF",
                                                fontsize: MySize.getScaledSizeHeight(18),
                                                tcolor: color.white,
                                              ),
                                              SizedBox(height: MySize.getScaledSizeHeight(4)),
                                              commonText.regularText(
                                                "Now in (product)\nAll colours",
                                                fontsize: MySize.getScaledSizeHeight(14),
                                                tcolor: color.white,
                                              ),
                                              SizedBox(height: MySize.getScaledSizeHeight(4)),
                                              commonText.boldText(
                                                "Limited Time!",
                                                fontsize: MySize.getScaledSizeHeight(14),
                                                tcolor: color.white,
                                              ),
                                              SizedBox(height: MySize.getScaledSizeHeight(5)),
                                              Container(
                                                height: MySize.getScaledSizeHeight(40),
                                                width: MySize.getScaledSizeWidth(100),
                                                // height: 31,
                                                // width: 86,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.white),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(width: 4),
                                                    commonText.semiBoldText(
                                                      "Shop Now ",
                                                      fontsize: MySize.getScaledSizeHeight(14),
                                                      tcolor: color.white,
                                                    ),
                                                    SizedBox(width: MySize.getScaledSizeHeight(6)),
                                                    Image.asset(
                                                      assetsUrl.arrowrightIcon,
                                                      height: MySize.getScaledSizeHeight(18),
                                                      width: MySize.getScaledSizeWidth(18),
                                                      // height: 13,
                                                      // width: 13,
                                                    ),
                                                    SizedBox(width: 4),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: controller.campus.length,
                                      pagination: SwiperPagination(
                                        builder: DotSwiperPaginationBuilder(
                                          size: 7,
                                          color: color.white,
                                          activeColor: color.appColor.withOpacity(.5),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// Magestic Button
                                  // SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  // Material(
                                  //   color: Color(0xffEFEFEF),
                                  //   borderRadius: BorderRadius.circular(12),
                                  //   child: InkWell(
                                  //     onTap: () {
                                  //       controller.onTapBack.value = !controller.onTapBack.value;
                                  //       Get.to(MajesticView(), transition: Transition.rightToLeft)!.then((value) {
                                  //         if (value == 1) {
                                  //           controller.onTapBack.value = false;
                                  //         }
                                  //       });
                                  //     },
                                  //     borderRadius: BorderRadius.circular(12),
                                  //     child: Container(
                                  //       height: MySize.getScaledSizeHeight(68),
                                  //       // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
                                  //       decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(12),
                                  //       ),
                                  //       child: Row(
                                  //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           SizedBox(
                                  //             width: MySize.getScaledSizeWidth(20),
                                  //           ),
                                  //           commonText.mediumText(
                                  //             "Majestic Finds",
                                  //             fontsize: MySize.getScaledSizeHeight(18),
                                  //           ),
                                  //           Spacer(),
                                  //           Obx(() {
                                  //             return Container(
                                  //               height: MySize.getScaledSizeHeight(36),
                                  //               width: MySize.getScaledSizeWidth(36),
                                  //               padding: EdgeInsets.all(5),
                                  //               decoration: BoxDecoration(
                                  //                 color: controller.onTapBack.value ? color.appColor : Colors.white,
                                  //                 border: Border.all(color: color.appColor),
                                  //                 shape: BoxShape.circle,
                                  //               ),
                                  //               child: Image.asset(
                                  //                 "assets/icon/arrow_right_green.png",
                                  //                 color: controller.onTapBack.value ? Colors.white : color.appColor,
                                  //               ),
                                  //             );
                                  //           }),
                                  //           // Image.asset(
                                  //           //   assetsUrl.rightgreenarrow,
                                  //           //   height: MySize.getScaledSizeHeight(36),
                                  //           //   width: MySize.getScaledSizeWidth(36),
                                  //           //   // height: 36,
                                  //           //   // width: 36,
                                  //           // ),
                                  //           SizedBox(
                                  //             width: MySize.getScaledSizeWidth(20),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF9FAFD),
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: Center(
                                      child: Obx(() {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                        );
                                      }),
                                    ),
                                  ),
                                  // Container(
                                  //   width: Get.width,
                                  //   decoration: BoxDecoration(
                                  //     color: Color(0xFFF9FAFD),
                                  //     borderRadius: BorderRadius.circular(90),
                                  //   ),
                                  //   child: Center(
                                  //     child: Row(
                                  //       children: List.generate(
                                  //         controller.campus.length,
                                  //         (index) => InkWell(
                                  //           splashColor: Colors.transparent,
                                  //           highlightColor: Colors.transparent,
                                  //           onTap: () {
                                  //             controller.campusSelected.value = index;
                                  //           },
                                  //           child: Obx(() {
                                  //             return Container(
                                  //               height: MySize.getScaledSizeHeight(40),
                                  //               width: Get.width * 0.25,
                                  //               margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                  //               alignment: Alignment.center,
                                  //               decoration: BoxDecoration(
                                  //                 borderRadius: BorderRadius.circular(25),
                                  //                 color: controller.campusSelected.value == index ? color.appColor : Colors.transparent,
                                  //               ),
                                  //               child: Padding(
                                  //                 padding: EdgeInsets.all(8.0),
                                  //                 child: commonText.regularText(
                                  //                   controller.campus[index],
                                  //                   fontsize: MySize.getScaledSizeHeight(16),
                                  //                   tcolor: controller.campusSelected.value == index ? Colors.white : Colors.black,
                                  //                 ),
                                  //               ),
                                  //             );
                                  //           }),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        stringsUtils.category,
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(SeeAllCategoryView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(SeeAllCategoryView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(12)),
                                  Obx(() {
                                    return Container(
                                      height: MySize.getScaledSizeHeight(120),
                                      alignment: Alignment.center,
                                      child: Center(
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
                                                      controller.campusSelected.value == 0
                                                          ? Get.to(
                                                              CategoryDetailsView(),
                                                              arguments: {'name': controller.categoryList[index]['name']},
                                                              transition: Transition.rightToLeft,
                                                            )
                                                          : SizedBox();
                                                      // controller.categorySelect.value = index;
                                                      controller.update();
                                                    },
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Container(
                                                          height: MySize.getScaledSizeHeight(62),
                                                          width: MySize.getScaledSizeWidth(62),
                                                          // height: 62,
                                                          // width: 62,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffDAFADC),
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
                                                              color: color.appColor,
                                                              //color: color.white,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(5)),
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
                                                        //     velocity: 50.0,
                                                        //     pauseAfterRound: Duration(seconds: 1),
                                                        //     startPadding: 10.0,
                                                        //     // accelerationDuration: Duration(seconds: 1),
                                                        //   ),
                                                        // )
                                                        Container(
                                                          width: 77,
                                                          // color: Colors.blue,
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
                                    );
                                  }),
                                  SizedBox(height: MySize.getScaledSizeHeight(10)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        stringsUtils.newSwaps,
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(SeeNewSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(SeeNewSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg2.JPEG",
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(119),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            // assetsUrl.newSwapImg2,
                                                            "assets/image/swapImg1.JPEG",
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeWidth(112),
                                                            fit: BoxFit.cover,
                                                            // height: 138,
                                                            // width: 117,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "Recommended Swaps",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg3.JPEG",
                                                            // assetsUrl.newSwapImg,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(117),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                        // height: 18,
                                                        // width: 18,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(
                                                          height: MySize.getScaledSizeHeight(8),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg4.JPEG",
                                                            //  assetsUrl.newSwapImg2,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(117),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(35)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "Recommended Swaps",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg5.JPEG",
                                                            // assetsUrl.newSwapImg,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(117),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                        // height: 18,
                                                        // width: 18,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(
                                                          height: MySize.getScaledSizeHeight(8),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg6.JPEG",
                                                            // assetsUrl.newSwapImg2,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(117),
                                                            fit: BoxFit.cover,
                                                            // height: 138,
                                                            // width: 117,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(35)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "Recommended Swaps",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(185),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        Image.asset(
                                                          assetsUrl.newSwapImg,
                                                          height: MySize.getScaledSizeHeight(136),
                                                          width: MySize.getScaledSizeHeight(117),
                                                          // height: 138,
                                                          // width: 117,
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                        // height: 18,
                                                        // width: 18,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(
                                                          height: MySize.getScaledSizeHeight(8),
                                                        ),
                                                        Image.asset(
                                                          assetsUrl.newSwapImg2,
                                                          height: MySize.getScaledSizeHeight(136),
                                                          width: MySize.getScaledSizeHeight(117),
                                                          // height: 138,
                                                          // width: 117,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(35)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "Recommended Swaps",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(185),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        Image.asset(
                                                          assetsUrl.newSwapImg,
                                                          height: MySize.getScaledSizeHeight(136),
                                                          width: MySize.getScaledSizeHeight(117),
                                                          // height: 138,
                                                          // width: 117,
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                        // height: 18,
                                                        // width: 18,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(
                                                          height: MySize.getScaledSizeHeight(8),
                                                        ),
                                                        Image.asset(
                                                          assetsUrl.newSwapImg2,
                                                          height: MySize.getScaledSizeHeight(136),
                                                          width: MySize.getScaledSizeHeight(117),
                                                          // height: 138,
                                                          // width: 117,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(35)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "Recommended Swaps",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg1.JPEG",
                                                            //  assetsUrl.newSwapImg,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(119),
                                                            // height: 138,
                                                            // width: 117,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                        // height: 18,
                                                        // width: 18,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            // assetsUrl.newSwapImg2,
                                                            "assets/image/swapImg2.JPEG",
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeWidth(112),
                                                            fit: BoxFit.cover,
                                                            // height: 138,
                                                            // width: 117,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(35)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "Recommended Swaps",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: commonText.mediumText(
                                          stringsUtils.seeall,
                                          fontsize: MySize.getScaledSizeHeight(14),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Image.asset(
                                          assetsUrl.seeAllIcon,
                                          height: MySize.getScaledSizeHeight(24),
                                          width: MySize.getScaledSizeWidth(24),
                                          // height: 24,
                                          // width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(6)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffEFEFEF),
                                                ),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "This Items",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg4.JPEG",
                                                            // assetsUrl.newSwapImg,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(117),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Image.asset(
                                                        assetsUrl.swapArroeIcon,
                                                        height: MySize.getScaledSizeHeight(18),
                                                        width: MySize.getScaledSizeWidth(18),
                                                        // height: 18,
                                                        // width: 18,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        commonText.mediumText(
                                                          "In Exchange",
                                                          fontsize: MySize.getScaledSizeHeight(14),
                                                        ),
                                                        SizedBox(
                                                          height: MySize.getScaledSizeHeight(8),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.asset(
                                                            "assets/image/swapImg3.JPEG",
                                                            //  assetsUrl.newSwapImg2,
                                                            height: MySize.getScaledSizeHeight(150),
                                                            width: MySize.getScaledSizeHeight(117),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(35)),
                                ],
                              ),
                            ),
                          ),
                        )
                      : HomeShowShimmer(context: Get.context)
                ],
              ),
            ));
      },
    );
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
                        fontsize: MySize.getScaledSizeHeight(18),
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
                                    controller.filterSelected.value = index;
                                  },
                                  child: Container(
                                    height: MySize.getScaledSizeHeight(40),
                                    margin: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(9), vertical: MySize.getScaledSizeHeight(10)),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: controller.filterSelected == index ? color.appColor : Colors.transparent,
                                    ),
                                    child: commonText.regularText(
                                      controller.campus[index],
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: controller.filterSelected == index ? Colors.white : Colors.black,
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
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.filterSelected.value == 0
                                ? controller.categoryList.length
                                : controller.filterSelected.value == 1
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
                                                controller.filterSelected.value == 0
                                                    ? controller.categoryList[index]['icon']
                                                    : controller.filterSelected.value == 1
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
                                        //   // width: 70,
                                        //   child: Marquee(
                                        //     text: controller.campusSelected.value == 0
                                        //         ? controller.categoryList[index]['name']
                                        //         : controller.campusSelected.value == 1
                                        //             ? controller.categoryList2[index]['name']
                                        //             : controller.categoryList3[index]['name'],
                                        //     style: TextStyle(color: Colors.black, fontFamily: 'Medium'),
                                        //     scrollAxis: Axis.horizontal,
                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                        //     blankSpace: 10.0,
                                        //     velocity: 30.0,
                                        //     //  pauseAfterRound: Duration(seconds: 1),
                                        //     startPadding: 10.0,
                                        //     // accelerationDuration: Duration(seconds: 1),
                                        //   ),
                                        // )
                                        Container(
                                          width: 77,
                                          alignment: Alignment.center,
                                          child: commonText.mediumText(
                                            controller.filterSelected.value == 0
                                                ? controller.categoryList[index]['name']
                                                : controller.filterSelected.value == 1
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

/*Widget body() {
  return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: scrollController,
        // physics: NeverScrollableScrollPhysics(),
        floatHeaderSlivers: true,
        key: controller.globalKey,
        headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // expandedHeight: MySize.getScaledSizeHeight(135),
              backgroundColor: color.appColor,
              // leadingWidth: Get.width / 1.8,
              titleSpacing: 0.0,

              actions: [
                SizedBox(width: MySize.getScaledSizeWidth(16)),
              ],
              flexibleSpace: Padding(
                padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(16), top: MySize.getScaledSizeHeight(24)),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            assetsUrl.homeProfileImg,
                            height: MySize.getScaledSizeHeight(50),
                            width: MySize.getScaledSizeWidth(50),
                          ),
                          SizedBox(width: MySize.getScaledSizeWidth(16)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              commonText.mediumText(
                                "Eleanor Pena",
                                fontsize: MySize.getScaledSizeHeight(16),
                                // fontsize: 16.0,
                                tcolor: color.white,
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(5)),
                              Row(
                                children: [
                                  Image.asset(
                                    assetsUrl.locationIcon,
                                    height: MySize.getScaledSizeHeight(20),
                                    width: MySize.getScaledSizeWidth(20),
                                    // height: 20,
                                    // width: 20,
                                  ),
                                  commonText.regularText(
                                    " California, US",
                                    // fontsize: 14.0,
                                    fontsize: MySize.getScaledSizeHeight(14),
                                    tcolor: color.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.to(NotificationView(), transition: Transition.rightToLeft);
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Image.asset(
                              assetsUrl.notificationIcon,
                              height: MySize.getScaledSizeHeight(38),
                              width: MySize.getScaledSizeWidth(38),
                              // height: 38,
                              // width: 38,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                      SizedBox(height: MySize.getScaledSizeHeight(16)),
                    ],
                  ),
                ),
              ),
              // systemOverlayStyle: SystemUiOverlayStyle(
              //   statusBarColor: color.appColor,
              //   statusBarIconBrightness: Brightness.dark,
              // ),
            )
          ];
        },
        body: !controller.isLodding.value
            ? Column(
                children: [
                  Container(
                    height: MySize.getScaledSizeHeight(80),
                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                    color: color.appColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MySize.getScaledSizeHeight(52),
                            child: TextFormField(
                              onTap: () {
                                Get.to(SearchView(), transition: Transition.rightToLeft);
                              },
                              readOnly: true,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: color.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Medium',
                              ),
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
                                    // height: 15,
                                    // width: 15,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            showFilterBottomSheet();
                            // Get.to(SearchView(), transition: Transition.rightToLeft);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            assetsUrl.filterIcon,
                            height: MySize.getScaledSizeHeight(52),
                            width: MySize.getScaledSizeWidth(52),
                            // height: 52,
                            // width: 52,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16)),
                      child: SingleChildScrollView(
                        // controller: BodyScrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            commonText.mediumText(
                              stringsUtils.specialOffer,
                              fontsize: MySize.getScaledSizeHeight(16),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            Container(
                              margin: EdgeInsets.only(right: MySize.getScaledSizeHeight(5)),
                              height: MySize.getScaledSizeHeight(200),
                              child: Swiper(
                                loop: true,
                                physics: BouncingScrollPhysics(),
                                autoplay: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    margin: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(5)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          controller.offerImage[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MySize.getScaledSizeHeight(35)),
                                        commonText.boldText(
                                          "50-40% OFF",
                                          fontsize: MySize.getScaledSizeHeight(18),
                                          tcolor: color.white,
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(4)),
                                        commonText.regularText(
                                          "Now in (product)\nAll colours",
                                          fontsize: MySize.getScaledSizeHeight(14),
                                          tcolor: color.white,
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(4)),
                                        commonText.boldText(
                                          "Limited Time!",
                                          fontsize: MySize.getScaledSizeHeight(14),
                                          tcolor: color.white,
                                        ),
                                        SizedBox(height: MySize.getScaledSizeHeight(5)),
                                        Container(
                                          height: MySize.getScaledSizeHeight(40),
                                          width: MySize.getScaledSizeWidth(100),
                                          // height: 31,
                                          // width: 86,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 4),
                                              commonText.semiBoldText(
                                                "Shop Now ",
                                                fontsize: MySize.getScaledSizeHeight(14),
                                                tcolor: color.white,
                                              ),
                                              SizedBox(width: MySize.getScaledSizeHeight(6)),
                                              Image.asset(
                                                assetsUrl.arrowrightIcon,
                                                height: MySize.getScaledSizeHeight(18),
                                                width: MySize.getScaledSizeWidth(18),
                                                // height: 13,
                                                // width: 13,
                                              ),
                                              SizedBox(width: 4),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: controller.campus.length,
                                pagination: SwiperPagination(
                                  builder: DotSwiperPaginationBuilder(
                                    size: 7,
                                    color: color.white,
                                    activeColor: color.appColor.withOpacity(.5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            Material(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                onTap: () {
                                  controller.onTapBack.value = !controller.onTapBack.value;
                                  Get.to(MajesticView(), transition: Transition.rightToLeft)!.then((value) {
                                    if (value == 1) {
                                      controller.onTapBack.value = false;
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: MySize.getScaledSizeHeight(68),
                                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MySize.getScaledSizeWidth(20),
                                      ),
                                      commonText.mediumText(
                                        "Majestic Finds",
                                        fontsize: MySize.getScaledSizeHeight(18),
                                      ),
                                      Spacer(),
                                      Obx(() {
                                        return Container(
                                          height: MySize.getScaledSizeHeight(36),
                                          width: MySize.getScaledSizeWidth(36),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: controller.onTapBack.value ? color.appColor : Colors.white,
                                            border: Border.all(color: color.appColor),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/icon/arrow_right_green.png",
                                            color: controller.onTapBack.value ? Colors.white : color.appColor,
                                          ),
                                        );
                                      }),
                                      // Image.asset(
                                      //   assetsUrl.rightgreenarrow,
                                      //   height: MySize.getScaledSizeHeight(36),
                                      //   width: MySize.getScaledSizeWidth(36),
                                      //   // height: 36,
                                      //   // width: 36,
                                      // ),
                                      SizedBox(
                                        width: MySize.getScaledSizeWidth(20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Color(0xFFF9FAFD),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: Center(
                                child: Row(
                                  children: List.generate(
                                    controller.campus.length,
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
                                          margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            color: controller.campusSelected.value == index ? color.appColor : Colors.transparent,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: commonText.regularText(
                                              controller.campus[index],
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
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            Row(
                              children: [
                                commonText.mediumText(
                                  stringsUtils.category,
                                  fontsize: MySize.getScaledSizeHeight(16),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(SeeAllCategoryView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: commonText.mediumText(
                                    stringsUtils.seeall,
                                    fontsize: MySize.getScaledSizeHeight(14),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(SeeAllCategoryView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image.asset(
                                    assetsUrl.seeAllIcon,
                                    height: MySize.getScaledSizeHeight(24),
                                    width: MySize.getScaledSizeWidth(24),
                                    // height: 24,
                                    // width: 24,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(12)),
                            Obx(() {
                              return Container(
                                height: MySize.getScaledSizeHeight(120),
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
                                          padding: EdgeInsets.only(right: MySize.getScaledSizeHeight(28)),
                                          child: InkWell(
                                            onTap: () {
                                              print("sduguhfoad");
                                              // controller.categorySelect.value = index;
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
                                                    // height: 62,
                                                    // width: 62,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffDAFADC),
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
                                                        color: color.appColor,
                                                        //color: color.white,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                                SizedBox(height: MySize.getScaledSizeHeight(5)),
                                                commonText.mediumText(
                                                  controller.campusSelected.value == 0
                                                      ? controller.categoryList[index]['name']
                                                      : controller.campusSelected.value == 1
                                                          ? controller.categoryList2[index]['name']
                                                          : controller.categoryList3[index]['name'],
                                                  fontsize: MySize.getScaledSizeHeight(14),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    }),
                              );
                            }),
                            SizedBox(height: MySize.getScaledSizeHeight(10)),
                            Row(
                              children: [
                                commonText.mediumText(
                                  stringsUtils.newSwaps,
                                  fontsize: MySize.getScaledSizeHeight(16),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(SeeNewSwapView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: commonText.mediumText(
                                    stringsUtils.seeall,
                                    fontsize: MySize.getScaledSizeHeight(14),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(SeeNewSwapView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image.asset(
                                    assetsUrl.seeAllIcon,
                                    height: MySize.getScaledSizeHeight(24),
                                    width: MySize.getScaledSizeWidth(24),
                                    // height: 24,
                                    // width: 24,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(6)),
                            InkWell(
                              onTap: () {
                                Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: MySize.getScaledSizeHeight(185),
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffEFEFEF),
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  commonText.mediumText(
                                                    "This Items",
                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                  ),
                                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                  Image.asset(
                                                    assetsUrl.newSwapImg,
                                                    height: MySize.getScaledSizeHeight(136),
                                                    width: MySize.getScaledSizeHeight(117),
                                                    // height: 138,
                                                    // width: 117,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Image.asset(
                                                  assetsUrl.swapArroeIcon,
                                                  height: MySize.getScaledSizeHeight(18),
                                                  width: MySize.getScaledSizeWidth(18),
                                                  // height: 18,
                                                  // width: 18,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  commonText.mediumText(
                                                    "In Exchange",
                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                  ),
                                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                  Image.asset(
                                                    assetsUrl.newSwapImg2,
                                                    height: MySize.getScaledSizeHeight(136),
                                                    width: MySize.getScaledSizeWidth(117),
                                                    // height: 138,
                                                    // width: 117,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(16)),
                            Row(
                              children: [
                                commonText.mediumText(
                                  "Recommended Swaps",
                                  fontsize: MySize.getScaledSizeHeight(18),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: commonText.mediumText(
                                    stringsUtils.seeall,
                                    fontsize: MySize.getScaledSizeHeight(14),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(RecommendedSwapView(), transition: Transition.rightToLeft);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Image.asset(
                                    assetsUrl.seeAllIcon,
                                    height: MySize.getScaledSizeHeight(24),
                                    width: MySize.getScaledSizeWidth(24),
                                    // height: 24,
                                    // width: 24,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(6)),
                            InkWell(
                              onTap: () {
                                Get.to(ProductInfoView(), transition: Transition.rightToLeft);
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: MySize.getScaledSizeHeight(185),
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffEFEFEF),
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  commonText.mediumText(
                                                    "This Items",
                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                  ),
                                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                                  Image.asset(
                                                    assetsUrl.newSwapImg,
                                                    height: MySize.getScaledSizeHeight(136),
                                                    width: MySize.getScaledSizeHeight(117),
                                                    // height: 138,
                                                    // width: 117,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Image.asset(
                                                  assetsUrl.swapArroeIcon,
                                                  height: MySize.getScaledSizeHeight(18),
                                                  width: MySize.getScaledSizeWidth(18),
                                                  // height: 18,
                                                  // width: 18,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  commonText.mediumText(
                                                    "In Exchange",
                                                    fontsize: MySize.getScaledSizeHeight(14),
                                                  ),
                                                  SizedBox(
                                                    height: MySize.getScaledSizeHeight(8),
                                                  ),
                                                  Image.asset(
                                                    assetsUrl.newSwapImg2,
                                                    height: MySize.getScaledSizeHeight(136),
                                                    width: MySize.getScaledSizeHeight(117),
                                                    // height: 138,
                                                    // width: 117,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            SizedBox(height: MySize.getScaledSizeHeight(35)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : HomeShowShimmer(context: Get.context),
      ));
}*/
