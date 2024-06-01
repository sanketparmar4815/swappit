import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swapit/app/common/SizeConstant.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'constant.dart';

CommonWidget commonWidget = CommonWidget();

class CommonWidget {
  Widget commonShimmer({double? height, double? width, child, BorderRadiusGeometry? borderRadius, BoxShape? shape, padding, margin}) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          child: child,
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius, shape: shape ?? BoxShape.rectangle),
        ));
  }

  Widget commonBackButton({onTap, height, width, containerColor, imageColor, imagePadding}) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: height ?? 36,
        width: width ?? 36,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(color: color.appColor),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: imagePadding ?? EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/icon/arrowLeftGreen.png",
            color: imageColor,
          ),
        ),
      ),
    );
  }

  Widget customTextfield({obscureText, minLines, colorText, onTap, readOnly, enabledBorder, focusedBorder, fillColor, textInputAction, onSubmitted, onSaved, validator, suffixIcon, maxLines, controller, hintText, letterSpacing, keyboardType, maxLength, inputFormatters, onChanged, prefixIcon, contentPadding, hintStyle, label, hintTextColor, prefixText}) {
    return MediaQuery(
      data: MediaQuery.of(Get.context!).copyWith(textScaleFactor: MediaQuery.of(Get.context!).textScaleFactor.clamp(0.9, 0.9)),
      child: TextFormField(
        onTap: onTap,
        minLines: minLines,
        readOnly: readOnly ?? false,
        textInputAction: textInputAction,
        validator: validator,
        cursorColor: Colors.black,
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        inputFormatters: inputFormatters ??
            [
              FilteringTextInputFormatter.deny(RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
            ],
        obscuringCharacter: '＊',
        onChanged: onChanged,
        maxLines: maxLines ?? 1,
        obscureText: obscureText ?? false,
        onSaved: onSaved,
        // onSubmitted: onSubmitted,
        style: TextStyle(
          color: colorText ?? color.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: letterSpacing,
          fontFamily: 'Medium',
        ),
        decoration: InputDecoration(
          prefixText: prefixText,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          // errorStyle: TextStyle(
          //   fontSize: 15,
          //   color: Colors.red,
          //   fontWeight: FontWeight.w600,
          // ),
          counter: SizedBox(),
          contentPadding: contentPadding ?? EdgeInsets.only(top: 17, bottom: 17, left: 10, right: 10),
          hintText: hintText,
          hintStyle: TextStyle(
            color: color.black.withOpacity(.4),
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Regular',
          ),
          prefixStyle: TextStyle(
            color: Colors.black,
            // fontFamily: "Bold",
            fontSize: MySize.getScaledSizeHeight(18),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: fillColor ?? Colors.white,

          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEFEFEF)),
                borderRadius: BorderRadius.circular(12),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff07BC7A).withOpacity(.5)),
                borderRadius: BorderRadius.circular(12),
              ),
        ),
      ),
    );
  }

  Widget customButton({onTap, splashColor, text, Tcolor, textfontsize, highlightColor, cornerRadius, backgroundColor, height, width, borderRadius, border}) {
    return Material(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      color: backgroundColor ?? color.appColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
          child: Center(
            child: commonText.mediumText(
              text,
              fontsize: textfontsize,
              tcolor: Tcolor ?? color.white,
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar({
    fontsize,
    title,
    colors,
    List<Widget>? actions,
    Function()? ontap,
    onback = false,
    leading,
    leadingIcon,
    leadingWidth,
    centerTitle,
    titleSpacing,
    titleText,
    leadingColor,
    titleColor,
    borderColor,
    iconColor,
    double? leadingPadding,
    double? leadingPadding1,
    flexibleSpaces,
    statusBarIconBrightness,
    backgroundColor,
    toolbarHeight,
  }) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpaces,
      title: title,
      centerTitle: centerTitle ?? true,
      elevation: 0.0,
      titleSpacing: titleSpacing,
      leadingWidth: leadingWidth,
      backgroundColor: backgroundColor ?? color.appColor,
      actions: actions,
      leading: leading ??
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(22),
            child: Padding(
              padding: EdgeInsets.only(top: 9.0, bottom: 9, left: 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: ontap ??
                    () {
                      Get.back();
                    },
                child: leadingIcon ?? SizedBox(),
              ),
            ),
          ),
    );
  }

  intlPhoneField({
    initialCountryCode,
    controller,
    onCountryChanged,
    showDropdownIcon,
    readOnly = false,
    hintText,
    lableText,
    isKeyboardVisible,
    isbordervisibal,
    initialValue,
    onTap,
    onChanged,
    validator,
  }) {
    return Container(
      alignment: Alignment.center,
      height: 62,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: color.white,
        border: Border.all(
          color: Color(0xffF3F3F3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: IntlPhoneField(
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
        disableLengthCheck: false,
        textInputAction: TextInputAction.done,
        dropdownTextStyle: TextStyle(
          color: color.black,
          fontSize: 12.0,
          fontFamily: 'Medium',
          fontWeight: FontWeight.w400,
        ),
        // dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: color.greyText,
          size: 30.0,
        ),
        cursorColor: color.appColor,
        showDropdownIcon: showDropdownIcon ?? false,
        showCountryFlag: true,
        readOnly: readOnly,
        initialCountryCode: initialCountryCode,
        controller: controller,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.disabled,
        onSaved: (newValue) {},
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          fontSize: 14.0,
          color: color.black,
          fontFamily: "Medium",
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          label: Text(lableText),
          labelStyle: TextStyle(
            fontSize: 14.0,
            color: isbordervisibal && isKeyboardVisible ? color.appColor : color.greyText.withOpacity(0.5),
          ),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          fillColor: color.white,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: color.white,
            fontFamily: "Medium",
            fontWeight: FontWeight.w500,
          ),
          counterText: "",
          contentPadding: EdgeInsets.all(15),
        ),
        onCountryChanged: onCountryChanged,
      ),
    );
  }
}

CommonText commonText = CommonText();

class CommonText {
  Text regularText(String text, {fontWeight, fontsize, textAlign, decoration, tcolor, height, overflow, letterSpacing, maxLines}) {
    return Text(
      textScaleFactor: 0.9,
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontSize: fontsize,
        fontFamily: "Regular",
        color: tcolor ?? color.black,
        overflow: overflow,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }

  Text mediumText(String text, {fontWeight, fontsize, textAlign, decoration, tcolor, height, overflow, letterSpacing, maxLines}) {
    return Text(
      textScaleFactor: 0.9,
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontSize: fontsize,
        fontFamily: "Medium",
        color: tcolor ?? color.black,
        overflow: overflow,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }

  Text semiBoldText(String text, {fontWeight, fontsize, textAlign, decoration, tcolor, letterSpacing, maxLines, overflow, height}) {
    return Text(
      textScaleFactor: 0.9,
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        fontSize: fontsize,
        height: height,
        letterSpacing: letterSpacing,
        fontFamily: "SemiBold",
        color: tcolor ?? color.black,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }

  Text boldText(String text, {fontWeight, fontsize, textAlign, decoration, tcolor, letterSpacing, maxLines, overflow, height}) {
    return Text(
      textScaleFactor: 0.9,
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        fontSize: fontsize,
        height: height,
        letterSpacing: letterSpacing,
        fontFamily: "Bold",
        color: tcolor ?? color.black,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
