import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? lable;
  final Widget? title;
  final String? initVal;
  final Function(String)? onChange;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final TextAlign? textAlign;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final bool? isValid;
  final double? borderRadius;
  final bool? withInputFormatters;
  final Widget? suffixIcon;
  final double? elevation;
  final Widget? prefixIcon;
  final EdgeInsets? outSidePadding;
  final TextEditingController? textEditingController;
  final bool? isBold;
  final bool? isObscureText;
  final Color? hintColor;
  Color? focusBorderColor;
  Color? unFocusBorderColor;
  double? focusBorderWidth;
  double? unFocusBorderWidth;
  final bool? isReadOnly;
  final bool? isCounter;
  final FocusNode? focusNode;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final bool? enableBorder;
  final bool? autoFocus;
  final bool? enable;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;

  // final ValueChanged<bool>? onFocusChange;

  final errorText;

  CustomTextField(
      {Key? key,
      this.hint = '',
      this.onChange,
      this.title,
      this.initVal,
      this.backgroundColor,
      this.textColor,
      this.fontSize = text_size_medium,
      this.textAlign,
      this.height,
      this.width,
      this.padding,
      this.focusNode,
      this.onFieldSubmitted,
      this.lable = '',
      this.isValid,
      this.borderRadius = brd_radius_small,
      this.withInputFormatters,
      this.suffixIcon,
      this.elevation,
      this.prefixIcon,
      this.outSidePadding,
      this.textEditingController,
      this.hintColor,
      this.focusBorderColor,
      this.unFocusBorderColor,
      this.focusBorderWidth = 2,
      this.unFocusBorderWidth = 1,
      this.isBold = false,
      this.isObscureText = false,
      this.maxLine = 1,
      this.maxLength = 500,
      this.enableBorder = true,
      this.errorText = 'مقدار را به طور صحیح وارد کنید',
      this.inputFormatters,
      this.validator,
      this.onTap,
      this.isReadOnly,
      // this.onFocusChange,
      this.isCounter = false,
      this.autoFocus = false,
      this.enable = true,
      this.textDirection = TextDirection.rtl,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    focusBorderColor = focusBorderColor ?? Get.theme.primaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? title! : const SizedBox(),
        Container(
          height: height,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode ?? FocusNode(),
            autofocus: autoFocus!,
            // initialValue:initVal??'' ,
            textDirection: textDirection,
            textInputAction: textInputAction,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorWidth: 2,
            cursorHeight: 25,
            showCursor: true,
            autocorrect: true,
            onTap: onTap,
            // validator: validator ??
            //     (value) {
            //       if (value!.isEmpty) {
            //         return errorText;
            //       }
            //       return null;
            //     },

            validator: validator,
            enabled: enable,

            readOnly: isReadOnly ?? false,
            maxLength: maxLength,
            obscureText: isObscureText!,
            cursorColor: Get.theme.primaryColorLight,
            controller: textEditingController,
            inputFormatters: inputFormatters ?? [],
            // [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]+"))],

            // : [
            //
            // LengthLimitingTextInputFormatter(2),
            //   ],
            onChanged: onChange,
            keyboardType: textInputType ?? TextInputType.text,
            textAlign: textAlign ?? TextAlign.start,
            // maxLines: maxLine ?? 1,
            //   minLines: 1,//Normal textInputField will be displayed
            maxLines: maxLine,

            style: TextStyle(
                // fontFamily: Utils.getFontFamily(),
                color: Get.theme.textTheme.bodyText1!.color,
                fontSize: fontSize + 2,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              counterText: "",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              isDense: true,
              fillColor: backgroundColor ?? Colors.white,
              filled: true,
              // dont forget this line
              contentPadding: padding ??
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              focusedBorder: enableBorder!
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: BorderSide(
                          width: focusBorderWidth!, color: focusBorderColor!))
                  : InputBorder.none,
              disabledBorder: enableBorder!
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: BorderSide(
                          width: focusBorderWidth!, color: focusBorderColor!))
                  : InputBorder.none,
              enabledBorder: enableBorder!
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: BorderSide(
                          color: unFocusBorderColor ?? focusBorderColor!))
                  : InputBorder.none,
              border: enableBorder!
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: BorderSide(
                          width: unFocusBorderWidth!, color: focusBorderColor!))
                  : InputBorder.none,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelText: lable?.tr,
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                  color: Get.theme.hintColor,
                  fontSize: (fontSize + 2),
                  fontWeight: isBold! ? FontWeight.bold : FontWeight.normal),
              hintText: hint!.tr,
              hintStyle: TextStyle(
                  color: Get.theme.hintColor,
                  fontSize: fontSize,
                  fontWeight: isBold! ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
