import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/majestic_details/views/majestic_details_view.dart';
import '../controllers/majestic_controller.dart';

class MajesticView extends StatefulWidget {
  const MajesticView({super.key});

  @override
  State<MajesticView> createState() => _MajesticViewState();
}

class _MajesticViewState extends State<MajesticView> with AutomaticKeepAliveClientMixin {
  MajesticController controller = Get.put(MajesticController());

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<MajesticController>(
        init: MajesticController(),
        builder: (logic) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Obx(() {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: controller.isVisible.value ? MySize.getScaledSizeHeight(15) : 0),
                      SafeArea(
                        child: Obx(() {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            height: controller.isVisible.value ? MySize.getScaledSizeHeight(30) : 0,
                            child: commonText.mediumText(
                              "Majestic Finds",
                              fontsize: MySize.getScaledSizeHeight(22),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: MySize.getScaledSizeHeight(18)),
                      Container(
                        height: MySize.getScaledSizeHeight(52),
                        margin: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(16)),
                        child: TextFormField(
                          controller: controller.searchText,
                          onChanged: (value) {
                            if (controller.searchText.text.isNotEmpty) {
                              controller.text.value = true;
                            } else {
                              controller.text.value = false;
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
                              borderSide: BorderSide(color: Color(0xffEFEFEF)),
                              borderRadius: BorderRadius.circular(27),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff07BC7A).withOpacity(.5)),
                              borderRadius: BorderRadius.circular(27),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollControllerMajestic,
                          child: Column(
                            children: [
                              !controller.isLodding.value
                                  ? GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.only(top: MySize.getScaledSizeHeight(0)),
                                      shrinkWrap: true,
                                      itemCount: controller.majesticList.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: MySize.getScaledSizeHeight(10),
                                        crossAxisSpacing: MySize.getScaledSizeHeight(10),
// mainAxisExtent: Get.height * 0.243,
                                        childAspectRatio: 2 / 2.2,
                                      ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(MajesticDetailsView(), transition: Transition.rightToLeft);
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Container(
// height: 250,
// width: Get.width,

                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xffEFEFEF),
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  controller.majesticList[index]['image'],

// width: Get.width,
                                                ),
                                                SizedBox(height: MySize.getScaledSizeHeight(5)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    commonText.mediumText(
                                                      controller.majesticList[index]['name'],
                                                      fontsize: MySize.getScaledSizeHeight(16),
                                                    ),
                                                    commonText.semiBoldText(
                                                      "\$45.00",
                                                      fontsize: MySize.getScaledSizeHeight(15),
                                                      tcolor: color.appColor,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 2),
                                                commonText.regularText(
                                                  controller.majesticList[index]['desc'],
                                                  fontsize: MySize.getScaledSizeHeight(13),
                                                  tcolor: color.black.withOpacity(.6),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : MajesticFindShimmer(),
                              SizedBox(height: MySize.getScaledSizeHeight(5)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
