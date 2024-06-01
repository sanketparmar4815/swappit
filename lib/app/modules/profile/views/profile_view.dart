import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/analytics/views/analytics_view.dart';
import 'package:swapit/app/modules/changes_password/views/changes_password_view.dart';
import 'package:swapit/app/modules/contact_us/views/contact_us_view.dart';
import 'package:swapit/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:swapit/app/modules/login/views/login_view.dart';
import 'package:swapit/app/modules/my_favourite/views/my_favourite_view.dart';
import 'package:swapit/app/modules/my_magestic_item/views/my_magestic_item_view.dart';
import 'package:swapit/app/modules/my_offer/views/my_offer_view.dart';
import 'package:swapit/app/modules/review_details/views/review_details_view.dart';
import 'package:swapit/main.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (logic) {
          return Scaffold(
            // backgroundColor: Colors.white,
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   elevation: 0.0,
            //   titleSpacing: 0.0,
            //   leading: Padding(
            //     padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(18), right: MySize.getScaledSizeHeight(4)),
            //     child: Obx(() {
            //       return commonWidget.commonBackButton(
            //           onTap: () {
            //             controller.onTapBack.value = !controller.onTapBack.value;
            //             Get.back();
            //           },
            //           containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
            //           imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
            //     }),
            //   ),
            //   title: commonText.mediumText(
            //     "  Profile",
            //     fontsize: MySize.getScaledSizeHeight(22),
            //   ),
            //   actions: [
            //     InkWell(
            //       onTap: () {
            //         Get.to(EditProfileView(), transition: Transition.rightToLeft);
            //       },
            //       splashColor: Colors.transparent,
            //       highlightColor: Colors.transparent,
            //       child: Image.asset(
            //         assetsUrl.editProductIcon,
            //         color: Colors.black,
            //         height: MySize.getScaledSizeHeight(24),
            //         width: MySize.getScaledSizeWidth(24),
            //       ),
            //     ),
            //     SizedBox(width: MySize.getScaledSizeWidth(16))
            //   ],
            // ),
            body: WhatsappProfilePage(),
          );
        });
  }

  // bodyParts() {
  //   return Column(
  //     children: [
  //       Expanded(
  //         child: SingleChildScrollView(
  //           //  physics: BouncingScrollPhysics(),
  //           child: Column(
  //             children: [
  //               SizedBox(height: MySize.getScaledSizeHeight(16)),
  //               Container(
  //                 height: MySize.getScaledSizeHeight(100),
  //                 width: MySize.getScaledSizeWidth(100),
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   image: DecorationImage(
  //                     fit: BoxFit.cover,
  //                     image: AssetImage(assetsUrl.messageProfile),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: MySize.getScaledSizeHeight(8)),
  //               commonText.mediumText(
  //                 "Eleanor Pena",
  //                 fontsize: MySize.getScaledSizeHeight(22),
  //               ),
  //               SizedBox(height: MySize.getScaledSizeHeight(8)),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Image.asset(
  //                     assetsUrl.locationIcon,
  //                     color: Colors.black,
  //                     height: MySize.getScaledSizeHeight(20),
  //                     width: MySize.getScaledSizeWidth(20),
  //                   ),
  //                   commonText.regularText(
  //                     " California, US",
  //                     fontsize: MySize.getScaledSizeHeight(16),
  //                   )
  //                 ],
  //               ),
  //               SizedBox(height: MySize.getScaledSizeHeight(16)),
  //               IntrinsicHeight(
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         commonText.semiBoldText(
  //                           "20",
  //                           fontsize: MySize.getScaledSizeHeight(22),
  //                         ),
  //                         commonText.mediumText(
  //                           "Exchanges",
  //                           tcolor: Colors.black.withOpacity(.5),
  //                           fontsize: MySize.getScaledSizeHeight(16),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(width: MySize.getScaledSizeWidth(30)),
  //                     VerticalDivider(
  //                       width: 1,
  //                       thickness: 1,
  //                       color: Colors.black.withOpacity(.1),
  //                     ),
  //                     SizedBox(width: MySize.getScaledSizeWidth(30)),
  //                     InkWell(
  //                       onTap: () {
  //                         Get.to(ReviewDetailsView(), transition: Transition.rightToLeft);
  //                       },
  //                       splashColor: Colors.transparent,
  //                       highlightColor: Colors.transparent,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Image.asset(
  //                                 assetsUrl.RatingImg,
  //                                 height: MySize.getScaledSizeHeight(20),
  //                                 width: MySize.getScaledSizeWidth(20),
  //                               ),
  //                               commonText.semiBoldText(
  //                                 " 4.5",
  //                                 fontsize: MySize.getScaledSizeHeight(22),
  //                               ),
  //                             ],
  //                           ),
  //                           commonText.mediumText(
  //                             "84 Review",
  //                             tcolor: Colors.black.withOpacity(.5),
  //                             fontsize: MySize.getScaledSizeHeight(16),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(height: MySize.getScaledSizeHeight(16)),
  //               Divider(),
  //               SizedBox(height: MySize.getScaledSizeHeight(16)),
  //               ListView.builder(
  //                 physics: NeverScrollableScrollPhysics(),
  //                 shrinkWrap: true,
  //                 itemCount: controller.profileList.length,
  //                 itemBuilder: (context, index) {
  //                   return Padding(
  //                     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
  //                     child: Material(
  //                       borderRadius: BorderRadius.circular(12),
  //                       color: Colors.white,
  //                       child: InkWell(
  //                         onTap: () {
  //                           if (index == 0) {
  //                             Get.to(MyFavouriteView(), transition: Transition.rightToLeft);
  //                           } else if (index == 1) {
  //                             Get.to(MyOfferView(), transition: Transition.rightToLeft);
  //                           } else if (index == 2) {
  //                             Get.to(MyMagesticItemView(), transition: Transition.rightToLeft);
  //                           } else if (index == 3) {
  //                             Get.to(AnalyticsView(), transition: Transition.rightToLeft);
  //                           } else if (index == 4) {
  //                             Get.to(ChangesPasswordView(), transition: Transition.rightToLeft);
  //                           } else if (index == 5) {
  //                             Get.to(ContactUsView(), transition: Transition.rightToLeft);
  //                           } else if (index == 6 || index == 7) {
  //                             controller.launchURLPhone("https://www.google.com/");
  //                           } else if (index == 8) {
  //                             showDeleteAccountBottom();
  //                           }
  //                         },
  //                         borderRadius: BorderRadius.circular(12),
  //                         child: Container(
  //                           padding: EdgeInsets.all(14),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(12),
  //                             border: Border.all(
  //                               color: color.appColor.withOpacity(.2),
  //                             ),
  //                           ),
  //                           child: Row(
  //                             children: [
  //                               Image.asset(
  //                                 controller.profileList[index]['icon'],
  //                                 color: Colors.black,
  //                                 height: MySize.getScaledSizeHeight(24),
  //                                 width: MySize.getScaledSizeWidth(24),
  //                               ),
  //                               SizedBox(width: MySize.getScaledSizeWidth(24)),
  //                               commonText.mediumText(
  //                                 controller.profileList[index]['name'],
  //                                 fontsize: MySize.getScaledSizeHeight(16),
  //                               ),
  //                               Spacer(),
  //                               Image.asset(
  //                                 assetsUrl.arrowrightIcon,
  //                                 color: color.black,
  //                                 height: MySize.getScaledSizeHeight(24),
  //                                 width: MySize.getScaledSizeWidth(24),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 5),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           InkWell(
  //             onTap: () {
  //               showLogOutBottom();
  //             },
  //             splashColor: Colors.transparent,
  //             highlightColor: Colors.transparent,
  //             child: Image.asset(
  //               assetsUrl.logoutIcon,
  //               height: MySize.getScaledSizeHeight(24),
  //               width: MySize.getScaledSizeWidth(24),
  //             ),
  //           ),
  //           InkWell(
  //             onTap: () {
  //               showLogOutBottom();
  //             },
  //             splashColor: Colors.transparent,
  //             highlightColor: Colors.transparent,
  //             child: commonText.mediumText(
  //               " LogOut",
  //               fontsize: 16.0,
  //               tcolor: Colors.red,
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 25)
  //     ],
  //   );
  // }
}

class WhatsappProfilePage extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: WhatsappAppbar(MediaQuery.of(context).size.width),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  commonText.mediumText(
                    "Eleanor Pena",
                    fontsize: MySize.getScaledSizeHeight(22),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        assetsUrl.locationIcon,
                        color: Colors.black,
                        height: MySize.getScaledSizeHeight(20),
                        width: MySize.getScaledSizeWidth(20),
                      ),
                      commonText.regularText(
                        " California, US",
                        fontsize: MySize.getScaledSizeHeight(16),
                      )
                    ],
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              commonText.semiBoldText(
                                "20",
                                fontsize: MySize.getScaledSizeHeight(22),
                              ),
                              commonText.mediumText(
                                "Exchanges",
                                tcolor: Colors.black.withOpacity(.5),
                                fontsize: MySize.getScaledSizeHeight(16),
                              ),
                            ],
                          ),
                          SizedBox(width: MySize.getScaledSizeWidth(30)),
                          VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: Colors.black.withOpacity(.1),
                          ),
                          SizedBox(width: MySize.getScaledSizeWidth(30)),
                          InkWell(
                            onTap: () {
                              Get.to(ReviewDetailsView(), transition: Transition.rightToLeft);
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      assetsUrl.RatingImg,
                                      height: MySize.getScaledSizeHeight(20),
                                      width: MySize.getScaledSizeWidth(20),
                                    ),
                                    commonText.semiBoldText(
                                      " 4.5",
                                      fontsize: MySize.getScaledSizeHeight(22),
                                    ),
                                  ],
                                ),
                                commonText.mediumText(
                                  "84 Review",
                                  tcolor: Colors.black.withOpacity(.5),
                                  fontsize: MySize.getScaledSizeHeight(16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  Divider(),
                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.profileList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              if (index == 0) {
                                Get.to(MyFavouriteView(), transition: Transition.rightToLeft);
                              } else if (index == 1) {
                                Get.to(MyOfferView(), transition: Transition.rightToLeft);
                              } else if (index == 2) {
                                Get.to(MyMagesticItemView(), transition: Transition.rightToLeft);
                              } else if (index == 3) {
                                Get.to(AnalyticsView(), transition: Transition.rightToLeft);
                              } else if (index == 4) {
                                Get.to(ChangesPasswordView(), transition: Transition.rightToLeft);
                              } else if (index == 5) {
                                Get.to(ContactUsView(), transition: Transition.rightToLeft);
                              } else if (index == 6 || index == 7) {
                                controller.launchURLPhone("https://www.google.com/");
                              } else if (index == 8) {
                                showDeleteAccountBottom();
                              }
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: color.appColor.withOpacity(.2),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    controller.profileList[index]['icon'],
                                    color: Colors.black,
                                    height: MySize.getScaledSizeHeight(24),
                                    width: MySize.getScaledSizeWidth(24),
                                  ),
                                  SizedBox(width: MySize.getScaledSizeWidth(24)),
                                  commonText.mediumText(
                                    controller.profileList[index]['name'],
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    assetsUrl.arrowrightIcon,
                                    color: color.black,
                                    height: MySize.getScaledSizeHeight(24),
                                    width: MySize.getScaledSizeWidth(24),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showLogOutBottom();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Image.asset(
                          assetsUrl.logoutIcon,
                          height: MySize.getScaledSizeHeight(24),
                          width: MySize.getScaledSizeWidth(24),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showLogOutBottom();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: commonText.mediumText(
                          " LogOut",
                          fontsize: 16.0,
                          tcolor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25)
                ],
              ),
            ),
            // const WhatsappProfileBody()
          ],
        ),
      ),
    );
  }

  showLogOutBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MySize.getScaledSizeHeight(16)),
                commonText.mediumText(
                  stringsUtils.logOut,
                  fontsize: MySize.getScaledSizeHeight(24),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
                commonText.regularText(
                  "Are you sure you want to log out?",
                  fontsize: MySize.getScaledSizeHeight(16),
                  tcolor: Colors.black.withOpacity(.8),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
                commonWidget.customButton(
                  onTap: () {
                    Get.offAll(LoginView(), transition: Transition.rightToLeft);
                  },
                  height: MySize.getScaledSizeHeight(58),
                  text: "Yes, Log Out",
                  backgroundColor: Colors.red,
                  textfontsize: MySize.getScaledSizeHeight(18),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(12)),
                commonWidget.customButton(
                  onTap: () {
                    Get.back();
                  },
                  height: MySize.getScaledSizeHeight(58),
                  text: stringsUtils.cancel,
                  backgroundColor: Colors.white,
                  Tcolor: Colors.red,
                  border: Border.all(color: Colors.red),
                  textfontsize: MySize.getScaledSizeHeight(18),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
              ],
            ),
          ),
        );
      },
    );
  }

  showDeleteAccountBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MySize.getScaledSizeHeight(16)),
                commonText.mediumText(
                  stringsUtils.deleteAccount,
                  fontsize: MySize.getScaledSizeHeight(24),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
                commonText.regularText(
                  "Are you sure you want to delete your account?",
                  fontsize: MySize.getScaledSizeHeight(16),
                  tcolor: Colors.black.withOpacity(.8),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
                commonWidget.customButton(
                  onTap: () {
                    Get.offAll(LoginView(), transition: Transition.rightToLeft);
                  },
                  height: MySize.getScaledSizeHeight(58),
                  text: "Yes, Delete Account",
                  backgroundColor: Colors.red,
                  textfontsize: MySize.getScaledSizeHeight(18),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(12)),
                commonWidget.customButton(
                  onTap: () {
                    Get.back();
                  },
                  height: MySize.getScaledSizeHeight(58),
                  text: stringsUtils.cancel,
                  backgroundColor: Colors.white,
                  Tcolor: Colors.red,
                  border: Border.all(color: Colors.red),
                  textfontsize: MySize.getScaledSizeHeight(18),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class WhatsappAppbar extends SliverPersistentHeaderDelegate {
  double screenWidth;
  Tween<double>? profilePicTranslateTween;

  WhatsappAppbar(this.screenWidth) {
    profilePicTranslateTween = Tween<double>(begin: screenWidth / 1.9 - 45 - 40 + 20, end: 35.0);
  }

  // static final appBarColorTween = ColorTween(begin: Colors.white, end: const Color.fromARGB(255, 4, 94, 84));
  static final appBarColorTween = ColorTween(begin: Colors.white, end: Colors.white);

  static final appbarIconColorTween = ColorTween(begin: Colors.grey[800], end: Colors.white);

  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final phoneNumberFontSizeTween = Tween<double>(begin: 40.0, end: 16.0);

  static final profileImageRadiusTween = Tween<double>(begin: 3.5, end: 1.0);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 55) / 70;
    ProfileController controller = Get.put(ProfileController());
    return Container(
      color: appBarColorTween.transform(relativeScroll),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 16,
                top: 9,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 9,
                child: InkWell(
                  onTap: () {
                    Get.to(EditProfileView(), transition: Transition.rightToLeft);
                  },
                  child: Image.asset(
                    assetsUrl.editProductIcon,
                    color: Colors.black,
                    height: MySize.getScaledSizeHeight(24),
                    width: MySize.getScaledSizeWidth(24),
                  ),
                ),
              ),
              Positioned(top: -7, left: 105, child: displayPhoneNumber(relativeScroll70px)),
              Positioned(top: 3, left: profilePicTranslateTween!.transform(relativeScroll70px), child: displayProfilePicture(relativeScroll70px)),
            ],
          ),
        ],
      ),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(relativeFullScrollOffset),
        ),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(assetsUrl.messageProfile),
              fit: BoxFit.cover,
            )),
      ),

      // child: Image.asset(
      //   assetsUrl.messageProfile,
      //   scale: 6.5,
      //   fit: BoxFit.fitHeight,
      //   alignment: Alignment.center,
      // ),
    );
  }

  Widget displayPhoneNumber(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.75) {
      return Transform(
          transform: Matrix4.identity()
            ..translate(
              0.0,
              phoneNumberTranslateTween.transform((relativeFullScrollOffset - 0.8) * 6),
            ),
          child: Text(
            "  Eleanor Pena",
            style: TextStyle(
              fontSize: phoneNumberFontSizeTween.transform((relativeFullScrollOffset - 0.3) * 2),
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )
          // child: commonText.mediumText(
          //   "Eleanor Pena",
          //   fontsize: MySize.getScaledSizeHeight(22),
          // ),
          );
    }

    return const SizedBox.shrink();
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(WhatsappAppbar oldDelegate) {
    return true;
  }
}
