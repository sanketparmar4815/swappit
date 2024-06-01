import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/bottombar/controllers/bottombar_controller.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ChatController controller = Get.put(ChatController());
    MySize().init(context);
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () {
              return controller.onWillPopScope();
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.isVisible.value = false;
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  titleSpacing: 0.0,
                  backgroundColor: Colors.white,
                  toolbarHeight: MySize.getScaledSizeHeight(70),
                  leadingWidth: MySize.getScaledSizeWidth(50),
                  elevation: 0.5,
                  leading: Padding(
                    padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(14), right: MySize.getScaledSizeHeight(3)),
                    child: Obx(() {
                      return commonWidget.commonBackButton(
                          onTap: () {
                            controller.onTapBack.value = !controller.onTapBack.value;
                            if (controller.flag == 1 || controller.flag == 2) {
                              Get.back();
                              Get.back();
                              Get.back();
                              Get.back();
                              BottombarController controller = Get.find();
                              controller.intPage.value = 1;
                              controller.pageController.jumpToPage(1);
                            } else {
                              Get.back();
                            }
                          },
                          containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                          imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                    }),
                  ),
                  title: Row(
                    children: [
                      SizedBox(width: MySize.getScaledSizeWidth(10)),
                      CircleAvatar(
                        backgroundImage: AssetImage(assetsUrl.searchProfileImg),
                      ),
                      SizedBox(width: MySize.getScaledSizeWidth(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText.semiBoldText(
                            "Carmen Adele",
                            fontsize: MySize.getScaledSizeHeight(18),
                          ),
                          SizedBox(height: MySize.getScaledSizeHeight(2)),
                          commonText.regularText(
                            "Active now",
                            fontsize: MySize.getScaledSizeHeight(14),
                            tcolor: Color(0xff777777),
                          ),
                        ],
                      )
                    ],
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        controller.isVisible.value = !controller.isVisible.value;
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Image.asset(
                        assetsUrl.dotsIcon,
                        height: MySize.getScaledSizeHeight(24),
                        width: MySize.getScaledSizeWidth(24),
                        // height: 24,
                        // width: 24,
                      ),
                    ),
                    SizedBox(width: MySize.getScaledSizeWidth(16)),
                  ],
                ),
                body: Obx(() {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                reverse: true,
                                child: GroupedListView<dynamic, String>(
                                  sort: false,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  elements: controller.chatList,
                                  groupBy: (element) => formatDate(DateTime.parse("2024-04-22T06:01:15.000Z")),
                                  groupComparator: (value1, value2) => value2.compareTo(value1),
                                  groupSeparatorBuilder: (String groupByValue) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(18), vertical: MySize.getScaledSizeHeight(8)),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          color: Colors.white,
                                        ),
                                        child: commonText.mediumText(
                                          "Today",
                                          fontsize: MySize.getScaledSizeHeight(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  itemBuilder: (context, dynamic element) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        element['type'] == 1 ? senderBuble(text: element['text']) : receiverBuble(text: element['text']),
                                      ],
                                    );
                                  },
                                  // optional
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(8)),
                              child: Obx(() {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showPickImageBottom();
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Image.asset(
                                        assetsUrl.AddIcon,
                                        height: MySize.getScaledSizeHeight(28),
                                        width: MySize.getScaledSizeHeight(28),
                                        // height: 28,
                                        // width: 28,
                                      ),
                                    ),
                                    SizedBox(width: MySize.getScaledSizeWidth(8)),
                                    Expanded(
                                      child: commonWidget.customTextfield(
                                        controller: controller.messageText,
                                        maxLines: 3,
                                        minLines: 1,
                                        onChanged: (value) {
                                          if (controller.messageText.text.isNotEmpty) {
                                            controller.showSendButton.value = true;
                                          } else {
                                            controller.showSendButton.value = false;
                                          }
                                        },
                                        hintText: "Write your message",
                                        fillColor: Color(0xffF9FAFD),
                                        inputFormatters: [
                                          //FilteringTextInputFormatter.allow(RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
                                          FilteringTextInputFormatter.singleLineFormatter,
                                        ],
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: MySize.getScaledSizeHeight(7)),
                                    controller.showSendButton.value == true
                                        ? Padding(
                                            padding: EdgeInsets.only(bottom: 8.0),
                                            child: Container(
                                              height: MySize.getScaledSizeHeight(53),
                                              width: MySize.getScaledSizeWidth(53),
                                              // height: 52,
                                              // width: 52,
                                              decoration: BoxDecoration(
                                                color: color.appColor,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(11.0),
                                                child: Image.asset(
                                                  assetsUrl.sendMessage,
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                      controller.isVisible.value
                          ? Positioned(
                              right: 15,
                              top: 4,
                              child: InkWell(
                                onTap: () {
                                  controller.isVisible.value = false;
                                  controller.chatList.clear();
                                  controller.update();
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: 50,
                                  width: Get.width / 1.9,
                                  alignment: Alignment.center,
                                  //margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: color.appColor),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: commonText.mediumText(
                                      "    Clear Chat",
                                      fontsize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  );
                }),
              ),
            ),
          );
        });
  }

  formatDate(var date) {
    var dateFormat = DateFormat("dd/MM/yy");
    var utcDate = dateFormat.format(DateTime.parse(date.toString()));
    String createdDate = dateFormat.parse(utcDate, true).toLocal().toString();
    // localeUTCTimeChange = dateFormat.format(DateTime.parse(createdDate));
    return createdDate;
  }

  receiverBuble({text}) {
    return Padding(
      padding: EdgeInsets.only(top: MySize.getScaledSizeHeight(4), bottom: MySize.getScaledSizeHeight(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MySize.getScaledSizeHeight(36),
            width: MySize.getScaledSizeWidth(36),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(assetsUrl.searchProfileImg),
            )),
          ),
          SizedBox(width: MySize.getScaledSizeWidth(12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(10), vertical: MySize.getScaledSizeHeight(10)),
                constraints: BoxConstraints(maxWidth: Get.width / 1.9),
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: commonText.regularText(text, fontsize: MySize.getScaledSizeHeight(16)),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(2)),
              commonText.regularText("10:20 AM", tcolor: Colors.black, fontsize: MySize.getScaledSizeHeight(12)),
            ],
          )
        ],
      ),
    );
  }

  senderBuble({text}) {
    return Padding(
      padding: EdgeInsets.only(top: MySize.getScaledSizeHeight(4), bottom: MySize.getScaledSizeHeight(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(10), vertical: MySize.getScaledSizeHeight(10)),
                constraints: BoxConstraints(maxWidth: Get.width / 1.9),
                decoration: BoxDecoration(
                  color: Color(0xffCDF2CF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: commonText.regularText(text, fontsize: MySize.getScaledSizeHeight(16)),
              ),
              SizedBox(height: MySize.getScaledSizeHeight(2)),
              commonText.regularText("10:20 AM", tcolor: Colors.black, fontsize: MySize.getScaledSizeHeight(12)),
            ],
          ),
        ],
      ),
    );
  }

  showPickImageBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MySize.getScaledSizeHeight(24)),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        Get.back();
                        if (await cameraAudioPermission(flag: 1)) {
                          controller.fromCamera(argument: 1);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset(
                            assetsUrl.cameraImg,
                            height: 48,
                            width: 48,
                          ),
                          SizedBox(height: 4),
                          commonText.regularText(
                            stringsUtils.camera,
                            fontsize: 12.0,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: MySize.getScaledSizeWidth(60)),
                    InkWell(
                      onTap: () async {
                        Get.back();
                        if (await cameraAudioPermission(flag: 2)) {
                          controller.fromCamera(argument: 2);
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset(
                            assetsUrl.galaryImg,
                            height: 48,
                            width: 48,
                          ),
                          SizedBox(height: 4),
                          commonText.regularText(
                            stringsUtils.gallery,
                            fontsize: 12.0,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: MySize.getScaledSizeHeight(14)),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: commonText.mediumText(
                    stringsUtils.cancel,
                    fontsize: MySize.getScaledSizeHeight(14),
                    tcolor: color.black.withOpacity(.5),
                  ),
                ),
                SizedBox(height: MySize.getScaledSizeHeight(36)),
              ],
            ),
          ),
        );
      },
    );
  }
}
