import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';

import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/add_new_swapProduct/views/add_new_swap_product_view.dart';
import 'package:swapit/app/modules/home/views/home_view.dart';
import 'package:swapit/app/modules/majestic/views/majestic_view.dart';
import 'package:swapit/app/modules/message/views/message_view.dart';
import 'package:swapit/app/modules/my_product/views/my_product_view.dart';

import '../controllers/bottombar_controller.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottombarController controller = Get.put(BottombarController());
    MySize().init(context);
    return GetBuilder<BottombarController>(
        init: BottombarController(),
        builder: (logic) {
          bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            // body: controller.isSelectedButton.value == true ? AddNewSwapProductView() : controller.screens[controller.currentIndex.value],
            // floatingActionButton: isKeyboard
            //     ? SizedBox()
            //     : GestureDetector(
            //         onTap: () {
            //           controller.currentIndex.value = 6;
            //           // Get.to(AddNewSwapProductView(), transition: Transition.rightToLeft);
            //           controller.isSelectedButton.value = true;
            //         },
            //         child: Obx(() {
            //           return AnimatedContainer(
            //             duration: Duration(milliseconds: 300),
            //             height: controller.isvisible.value == true ? 57 : 0,
            //             child: Container(
            //               height: 57,
            //               width: 57,
            //               alignment: Alignment.center,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 color: color.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: color.black.withOpacity(0.10),
            //                     blurRadius: 8,
            //                     offset: Offset(0, 0),
            //                   ),
            //                 ],
            //               ),
            //               // child: Image.asset(
            //               //   assetsUrl.AddIcon,
            //               //   height: MySize.getScaledSizeHeight(40),
            //               //   width: MySize.getScaledSizeWidth(40),
            //               //   color: color.black,
            //               // )
            //               child: Icon(
            //                 Icons.add_sharp,
            //                 size: 29,
            //                 color: controller.isSelectedButton.value == true ? color.appColor : color.black,
            //               ),
            //             ),
            //           );
            //         }),
            //       ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Obx(() {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: controller.isvisible.value == true ? MySize.getScaledSizeHeight(72) : 0,
                child: controller.isvisible.value == true
                    ? CurvedNavigationBar(
                        key: controller.curvedNavigationKey,
                        index: controller.intPage.value,
                        height: MySize.getScaledSizeHeight(62),
                        color: color.white,
                        buttonBackgroundColor: color.white,
                        backgroundColor: Colors.transparent,
                        animationCurve: Curves.ease,
                        animationDuration: Duration(milliseconds: 600),
                        items: List.generate(
                          controller.iconList.length,
                          (index) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index == 2
                                  ? Icon(
                                      Icons.add_sharp,
                                      size: 26,
                                      color: controller.intPage.value == 2 ? color.appColor : color.black,
                                    )
                                  : Image.asset(
                                      controller.intPage.value == index ? controller.iconColorList[index] : controller.iconList[index],
                                      height: MySize.getScaledSizeHeight(24),
                                      width: MySize.getScaledSizeWidth(24),
                                      color: controller.intPage.value == index ? color.appColor : Colors.black,
                                      //clipBehavior: Clip.hardEdge,
                                    ),
                              controller.intPage.value == index
                                  ? SizedBox()
                                  : Obx(() {
                                      return commonText.regularText(
                                        controller.iconData[index].label ?? "",
                                        fontsize: 13.0,
                                        textAlign: TextAlign.center,
                                        tcolor: controller.intPage.value == index ? color.appColor : Colors.black,
                                      );
                                    })
                            ],
                          ),
                        ),
                        onTap: (index) {
                          controller.intPage.value = index;
                          if (controller.isSelectedButton.value) {
                            controller.pageController = PageController(initialPage: index, keepPage: true);
                          }
                          controller.isSelectedButton.value = false;

                          Future.delayed(Duration(milliseconds: 200)).then((value) {
                            controller.onTapBottomNavItem(index);
                          });
                          controller.update();
                        },
                        letIndexChange: (index) => true,
                      )
                    : SizedBox(),
              );
            }),

            // bottomNavigationBar: Obx(() {
            //   return AnimatedContainer(
            //     duration: Duration(milliseconds: 500),
            //     height: controller.isvisible.value == true ? 65 : 0,
            //     child: AnimatedBottomNavigationBar.builder(
            //       itemCount: controller.iconList.length,
            //       height: 65,
            //       backgroundColor: color.white,
            //       leftCornerRadius: 13,
            //       rightCornerRadius: 13,
            //       shadow: BoxShadow(offset: Offset(0, -5), blurRadius: 4, color: color.black.withOpacity(0.05)),
            //       gapLocation: GapLocation.center,
            //       notchSmoothness: NotchSmoothness.softEdge,
            //       tabBuilder: (index, isActive) {
            //         return Padding(
            //           padding: EdgeInsets.only(top: 8.0),
            //           child: SingleChildScrollView(
            //             child: Column(
            //               children: [
            //                 Obx(() {
            //                   return Image.asset(
            //                     controller.currentIndex.value == index ? controller.iconColorList[index] : controller.iconList[index],
            //                     height: 24,
            //                     width: 24,
            //                     color: controller.currentIndex.value == index ? color.appColor : Colors.black,
            //                     //clipBehavior: Clip.hardEdge,
            //                   );
            //                 }),
            //                 SizedBox(height: 4),
            //                 Obx(() {
            //                   return commonText.regularText(
            //                     controller.iconData[index].label ?? "",
            //                     fontsize: 13.0,
            //                     tcolor: controller.currentIndex.value == index ? color.appColor : Colors.black,
            //                   );
            //                 })
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //       activeIndex: controller.currentIndex.value,
            //       onTap: (p0) {
            //         if (controller.isSelectedButton.value) {
            //           controller.pageController = PageController(initialPage: p0, keepPage: true);
            //         }
            //         controller.isSelectedButton.value = false;
            //         controller.currentIndex.value = p0;
            //         Future.delayed(Duration(milliseconds: 200)).then((value) {
            //           controller.onTapBottomNavItem(p0);
            //         });
            //
            //         controller.update();
            //       },
            //     ),
            //   );
            // }),
            body: Obx(
              () => controller.isSelectedButton.value == true
                  ? AddNewSwapProductView()
                  : PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      // onPageChanged: _pageChanged,
                      children: [
                        Container(
                          child: HomeView(),
                        ),
                        Container(
                          child: Center(
                            child: MessageView(),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: AddNewSwapProductView(),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: MyProductView(),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: MajesticView(),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}
