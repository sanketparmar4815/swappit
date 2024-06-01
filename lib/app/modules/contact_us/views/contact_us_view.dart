import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return GetBuilder<ContactUsController>(
        init: ContactUsController(),
        builder: (logic) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MySize.getScaledSizeHeight(50),
                titleSpacing: 0.0,
                elevation: 0.0,
                backgroundColor: color.white,
                //leadingWidth: Get.width / 1.8,
                leading: Padding(
                  padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(14), right: MySize.getScaledSizeHeight(8)),
                  child: Obx(() {
                    return commonWidget.commonBackButton(
                        onTap: () {
                          controller.onTapBack.value = !controller.onTapBack.value;
                          Get.back();
                        },
                        containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                        imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                  }),
                ),
                title: commonText.mediumText(
                  " ${stringsUtils.contactUs}",
                  fontsize: MySize.getScaledSizeHeight(22),
                ),
              ),
              body: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    "${stringsUtils.email}",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    fontsize: 12.0,
                                    tcolor: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonWidget.customTextfield(
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Email";
                                  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.email.text)) {
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                                controller: controller.email,
                                hintText: stringsUtils.enteremail,
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                              Row(
                                children: [
                                  commonText.mediumText(
                                    "${stringsUtils.message}",
                                    fontsize: MySize.getScaledSizeHeight(16),
                                  ),
                                  commonText.mediumText(
                                    "*",
                                    fontsize: 12.0,
                                    tcolor: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(8)),
                              commonWidget.customTextfield(
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Message";
                                  }
                                  return null;
                                },
                                controller: controller.message,
                                hintText: "Enter here",
                                maxLines: 4,
                              ),
                              SizedBox(height: MySize.getScaledSizeHeight(16)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MySize.getScaledSizeHeight(18)),
                      isKeyBoard
                          ? SizedBox()
                          : commonWidget.customButton(
                              onTap: () {
                                if (controller.formKey.currentState!.validate()) {
                                  Get.back();
                                }
                              },
                              height: MySize.getScaledSizeHeight(58),
                              text: "Submit",
                              textfontsize: MySize.getScaledSizeHeight(18),
                            ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
