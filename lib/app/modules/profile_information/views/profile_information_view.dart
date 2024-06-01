import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/common/string.dart';
import 'package:swapit/app/common/widgets.dart';
import 'package:swapit/app/modules/bottombar/views/bottombar_view.dart';
import 'package:swapit/app/modules/login/views/login_view.dart';
import '../controllers/profile_information_controller.dart';

class ProfileInformationView extends GetView<ProfileInformationController> {
  const ProfileInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<ProfileInformationController>(
      init: ProfileInformationController(),
      builder: (logic) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Obx(() {
            return Scaffold(
              backgroundColor: Colors.white,
              body: NestedScrollView(
                  controller: controller.scrollController,
                  floatHeaderSlivers: true,
                  // key: controller.globalKey,
                  headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        titleSpacing: 0.0,
                        leading: Padding(
                          padding: EdgeInsets.only(left: MySize.getScaledSizeHeight(14), right: MySize.getScaledSizeHeight(10)),
                          child: Obx(() {
                            return commonWidget.commonBackButton(
                                onTap: () {
                                  controller.onTapBack.value = !controller.onTapBack.value;
                                  Get.off(LoginView());
                                  // Get.back(result: 1);
                                },
                                containerColor: controller.onTapBack.value ? color.appColor : Colors.white,
                                imageColor: controller.onTapBack.value ? Colors.white : color.appColor);
                          }),
                        ),
                        backgroundColor: Colors.white,
                        title: commonText.mediumText("Personal Information", fontsize: MySize.getScaledSizeHeight(22)),
                        flexibleSpace: SizedBox(),
                      )
                    ];
                  },
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(16)),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Form(
                              key: controller.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  commonText.mediumText(
                                    stringsUtils.weneedsomeinformation,
                                    fontsize: MySize.getScaledSizeHeight(16),
                                    tcolor: color.black.withOpacity(.8),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showPickImageBottom();
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Column(
                                      children: [
                                        SizedBox(height: MySize.getScaledSizeHeight(20)),
                                        controller.imagePath == null
                                            ? Align(
                                                alignment: Alignment.center,
                                                child: CircleAvatar(
                                                    radius: 42,
                                                    backgroundColor: Colors.white,
                                                    backgroundImage: AssetImage(
                                                      assetsUrl.plashHolder,
                                                    )),
                                              )
                                            : Align(
                                                alignment: Alignment.center,
                                                child: CircleAvatar(
                                                  radius: 42,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: FileImage(
                                                    File(controller.imagePath),
                                                  ),
                                                ),
                                              ),
                                        SizedBox(height: MySize.getScaledSizeHeight(12)),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                // showPickImageBottom();
                                              },
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: MySize.getScaledSizeHeight(20),
                                              ),
                                            ),
                                            SizedBox(width: MySize.getScaledSizeWidth(6)),
                                            InkWell(
                                              onTap: () {
                                                showPickImageBottom();
                                              },
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: commonText.mediumText(
                                                stringsUtils.addprofilePicture,
                                                fontsize: MySize.getScaledSizeHeight(14),
                                              ),
                                            )
                                          ],
                                        ),
                                        controller.isErrorProfile.value == true
                                            ? Align(
                                                alignment: Alignment.center,
                                                child: commonText.regularText(
                                                  controller.errorProfile ?? "",
                                                  fontsize: MySize.getScaledSizeHeight(12),
                                                  tcolor: Colors.red,
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "${stringsUtils.firstname}",
                                        fontsize: MySize.getScaledSizeHeight(12),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                      textInputAction: TextInputAction.done,
                                      controller: controller.firstName,
                                      hintText: stringsUtils.enterfirstname,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter first name';
                                        }
                                        return null;
                                      }),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "${stringsUtils.lastname}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                    controller: controller.lastname,
                                    textInputAction: TextInputAction.done,
                                    hintText: stringsUtils.enterlastname,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Last Name";
                                      }
                                      // return null;
                                    },
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "${stringsUtils.mobilenumber}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  IntlPhoneField(
                                    textInputAction: TextInputAction.done,
                                    controller: controller.mobileNumber,
                                    onChanged: (value) {
                                      if (controller.mobileNumber.text.isNotEmpty) {
                                        controller.isError.value = false;
                                        controller.errorPhone = null;
                                        controller.update();
                                      } else {
                                        controller.numberLength.value = controller.mobileNumber.text.length;
                                        controller.isError.value = true;
                                        controller.errorPhone = "Please Enter Mobile Number";
                                        controller.update();
                                      }
                                    },
                                    initialValue: controller.isoCode,
                                    disableLengthCheck: true,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    disableAutoFillHints: true,
                                    dropdownTextStyle: TextStyle(
                                      color: color.black,
                                      fontSize: 14.0,
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    dropdownIconPosition: IconPosition.trailing,
                                    dropdownIcon: Icon(
                                      Icons.arrow_drop_down_rounded,
                                      size: 32,
                                      color: color.grey,
                                    ),
                                    cursorColor: color.black,
                                    showDropdownIcon: true,
                                    showCountryFlag: true,
                                    onSaved: (newValue) {},
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: color.black,
                                      fontFamily: "Medium",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      errorBorder: InputBorder.none,
                                      // Remove error underline
                                      focusedErrorBorder: InputBorder.none,
                                      // Remove focused error underline
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: controller.isError.value == true ? Colors.red : Color(0xffEFEFEF)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff07BC7A).withOpacity(.5)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      fillColor: color.white,
                                      hintText: "Enter Mobile Number",
                                      filled: true,
                                      hintStyle: TextStyle(
                                        color: color.black.withOpacity(.8),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                      ),
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                    onCountryChanged: (value) {
                                      // controller.maxLength = value.maxLength;
                                      controller.isoCode = value.code;
                                      print(value.dialCode);
                                      print("ksadads");
                                      controller.selectedCountryCode = int.parse(value.dialCode.toString());
                                      print(controller.isoCode);
                                      print(value.maxLength);
                                      print(controller.selectedCountryCode);
                                      print("controller.isoCode----->");
                                      controller.update();
                                    },
                                  ),
                                  controller.isError.value == true
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: commonText.regularText(
                                            controller.errorPhone ?? "",
                                            fontsize: MySize.getScaledSizeHeight(12),
                                            tcolor: Colors.red,
                                          ),
                                        )
                                      : SizedBox(),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "${stringsUtils.streetaddress}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                    controller: controller.streetAddress,
                                    textInputAction: TextInputAction.done,
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
                                        "${stringsUtils.apartmentname}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                    controller: controller.apartmentName,
                                    textInputAction: TextInputAction.done,
                                    hintText: stringsUtils.enterapartmentname,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Apartment Name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(16)),
                                  Row(
                                    children: [
                                      commonText.mediumText(
                                        "${stringsUtils.city}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                    controller: controller.city,
                                    textInputAction: TextInputAction.done,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                                    ],
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
                                        "${stringsUtils.state}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                    controller: controller.state,
                                    textInputAction: TextInputAction.done,
                                    hintText: stringsUtils.enterstate,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                                    ],
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
                                        "${stringsUtils.zipcode}",
                                        fontsize: MySize.getScaledSizeHeight(16),
                                      ),
                                      commonText.mediumText(
                                        "*",
                                        tcolor: Colors.red,
                                        fontsize: 16.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(8)),
                                  commonWidget.customTextfield(
                                    controller: controller.zipCode,
                                    textInputAction: TextInputAction.done,
                                    hintText: stringsUtils.enterzipcode,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Zip Code";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(20)),
                                  commonWidget.customButton(
                                    onTap: () {
                                      print("number lenght ${controller.mobileNumber.text.length}");
                                      if (controller.imagePath == null) {
                                        controller.scrollController.animateTo(
                                          controller.scrollController.position.minScrollExtent,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.linear,
                                        );
                                        controller.isErrorProfile.value = true;

                                        controller.errorProfile = "Please Add Profile Picture";
                                        controller.update();
                                      } else if (controller.formKey.currentState!.validate() && controller.mobileNumber.text.length <= 14) {
                                        print("Rout is ");
                                        Get.offAll(BottombarView(), transition: Transition.rightToLeft);
                                        controller.update();
                                      } else if (controller.mobileNumber.text.isEmpty) {
                                        print("mobileNumber text is empty");
                                        controller.isError.value = true;
                                        controller.errorPhone = "Please Enter Mobile Number";

                                        controller.update();
                                      } else if (controller.mobileNumber.text.length >= 14) {
                                        print("enter mobileNumber lenght check");
                                        controller.isError.value = true;
                                        controller.errorPhone = "Please Enter valid Mobile Number";

                                        controller.update();

                                        // print("empty part");
                                        // controller.isError.value = true;
                                        // controller.errorPhone = "Please Enter Mobile Number";
                                        // controller.update();
                                      } else {
                                        print("enter else");

                                        controller.isErrorProfile.value = false;
                                        controller.errorProfile = null;

                                        controller.isError.value = true;
                                        controller.errorPhone = "Please Enter valid Mobile Number";

                                        controller.update();
                                      }
                                    },
                                    height: MySize.getScaledSizeHeight(58),
                                    text: stringsUtils.save,
                                    textfontsize: MySize.getScaledSizeHeight(18),
                                  ),
                                  SizedBox(height: MySize.getScaledSizeHeight(10)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }),
        );
      },
    );
  }

  validation() {
    if (controller.imagePath == null) {
      return false;
    } else if (controller.firstName.text.isNotEmpty) {
      return false;
    }
    return true;
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
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                  ],
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: commonText.mediumText(
                    stringsUtils.cancel,
                    fontsize: 16.0,
                    tcolor: color.black.withOpacity(.5),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
