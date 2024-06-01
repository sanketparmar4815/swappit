import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/commonShimmer.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/chat/views/chat_view.dart';
import '../controllers/message_controller.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> with AutomaticKeepAliveClientMixin {
  MessageController controller = Get.put(MessageController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // MessageController controller = Get.put(MessageController());
    MySize().init(context);
    return GetBuilder<MessageController>(
        init: MessageController(),
        builder: (controller) {
          return Obx(() {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: controller.isLoading.value
                      ? MessageViewShimmer()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  SizedBox(height: MySize.getScaledSizeHeight(16)),
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

                            // controller.isVisible.value == true ? SizedBox(height: MySize.getScaledSizeHeight(16)) : SizedBox(),
                            Expanded(
                              child: ListView.builder(
                                  controller: scrollControllerMessage,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: controller.messageList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: MySize.getScaledSizeHeight(0)),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(ChatView(), transition: Transition.rightToLeft);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        //borderRadius: BorderRadius.circular(12),
                                        child: Column(
                                          children: [
                                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: MySize.getScaledSizeHeight(50),
                                                  width: MySize.getScaledSizeWidth(50),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                    fit: BoxFit.fitHeight,
                                                    image: AssetImage(controller.messageList[index]['image']),
                                                  )),
                                                ),
                                                SizedBox(width: MySize.getScaledSizeHeight(10)),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    commonText.mediumText(
                                                      controller.messageList[index]['name'],
                                                      fontsize: MySize.getScaledSizeHeight(16),
                                                    ),
                                                    SizedBox(height: MySize.getScaledSizeHeight(2)),
                                                    commonText.mediumText(
                                                      controller.messageList[index]['text'],
                                                      fontsize: MySize.getScaledSizeHeight(14),
                                                      tcolor: Color(0xffA3A3A3),
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                index == 0 || index == 1
                                                    ? CircleAvatar(
                                                        radius: 10,
                                                        backgroundColor: color.appColor,
                                                        child: commonText.regularText(
                                                          index == 1 ? "2" : "1",
                                                          fontsize: MySize.getScaledSizeHeight(12),
                                                          tcolor: color.white,
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                SizedBox(width: MySize.getScaledSizeWidth(10)),
                                                commonText.mediumText(
                                                  "10:00 Am",
                                                  fontsize: MySize.getScaledSizeHeight(12),
                                                  tcolor: Color(0xff7B7B7B),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: MySize.getScaledSizeHeight(8)),
                                            Divider(),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                ),
              ),
            );
          });
        });
  }
}
