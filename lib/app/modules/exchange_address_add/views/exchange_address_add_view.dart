import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import '../controllers/exchange_address_add_controller.dart';

class ExchangeAddressAddView extends GetView<ExchangeAddressAddController> {
  const ExchangeAddressAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangeAddressAddController>(
        init: ExchangeAddressAddController(),
        builder: (logic) {
          bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
                    padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(16), right: MySize.getScaledSizeHeight(10)),
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
                  title: commonText.mediumText(" ${stringsUtils.addAddressforExchange}", fontsize: MySize.getScaledSizeHeight(22)),
                ),
                body: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MySize.getScaledSizeHeight(16)),
                                Row(
                                  children: [
                                    commonText.mediumText(
                                      stringsUtils.state,
                                      fontsize: MySize.getScaledSizeHeight(16),
                                    ),
                                    commonText.mediumText(
                                      "*",
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(8)),
                                commonWidget.customTextfield(
                                  controller: controller.state,
                                  hintText: stringsUtils.enterstate,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter State";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(16)),
                                Row(
                                  children: [
                                    commonText.mediumText(
                                      stringsUtils.streetaddress,
                                      fontsize: MySize.getScaledSizeHeight(16),
                                    ),
                                    commonText.mediumText(
                                      "*",
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(8)),
                                commonWidget.customTextfield(
                                  controller: controller.streetaddress,
                                  hintText: stringsUtils.enterStreetaddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Street address";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(16)),
                                Row(
                                  children: [
                                    commonText.mediumText(
                                      stringsUtils.city,
                                      fontsize: MySize.getScaledSizeHeight(16),
                                    ),
                                    commonText.mediumText(
                                      "*",
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(8)),
                                commonWidget.customTextfield(
                                  controller: controller.city,
                                  hintText: stringsUtils.entercity,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter City";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(16)),
                                Row(
                                  children: [
                                    commonText.mediumText(
                                      stringsUtils.apartmentname,
                                      fontsize: MySize.getScaledSizeHeight(16),
                                    ),
                                    commonText.mediumText(
                                      "*",
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(8)),
                                commonWidget.customTextfield(
                                  controller: controller.apartmentName,
                                  hintText: stringsUtils.enterapartmentname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Apartment name";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(16)),
                                Row(
                                  children: [
                                    commonText.mediumText(
                                      stringsUtils.zipcode,
                                      fontsize: MySize.getScaledSizeHeight(16),
                                    ),
                                    commonText.mediumText(
                                      "*",
                                      fontsize: MySize.getScaledSizeHeight(16),
                                      tcolor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(8)),
                                commonWidget.customTextfield(
                                  controller: controller.zipCode,
                                  hintText: stringsUtils.enterzipcode,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter ZipCode";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: MySize.getScaledSizeHeight(25)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      isKeyboard
                          ? SizedBox()
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16), vertical: MySize.getScaledSizeHeight(10)),
                              child: commonWidget.customButton(
                                onTap: () {
                                  if (controller.formKey.currentState!.validate()) {
                                    Get.back(
                                      result: {
                                        'exchange_address': "${controller.apartmentName.text}, ${controller.streetaddress.text}, ${controller.city.text}, ${controller.state.text}, ${controller.zipCode.text}",
                                      },
                                    );
                                  }
                                },
                                height: MySize.getScaledSizeHeight(52),
                                text: stringsUtils.save,
                                textfontsize: MySize.getScaledSizeHeight(18),
                              ),
                            )
                    ],
                  ),
                )),
          );
        });
  }
}
