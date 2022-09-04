import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laid_back/conf/color_pallet.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? lable;
  final String? initVal;
  final Function(String)? onChange;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
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
    final Color? hintColorr;
  Color? borderColor;
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
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;

  final errorText;

   CustomTextField(
      {Key? key, this.hint='',
      this.onChange,
      this.initVal,
      this.backgroundColor = Colors.white,
      this.textColor,
      this.fontSize = 18,
      this.textAlign,
      this.height,
      this.width,
      this.padding,
      this.focusNode,
      this.onFieldSubmitted,
      this.lable = '',
      this.isValid,
      this.borderRadius = 5,
      this.withInputFormatters,
      this.suffixIcon,
      this.elevation,
      this.prefixIcon,
      this.outSidePadding,
      this.textEditingController,
      this.hintColorr =hintColor,
      this.borderColor,
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
      this.isCounter = false,
      this.textDirection = TextDirection.rtl,
      this.textInputAction = TextInputAction.done,
      this.textInputType  = TextInputType.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    borderColor = primaryColor;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode??FocusNode(),
        autofocus: true,
        // initialValue:initVal??'' ,
        textDirection: textDirection,
        textInputAction:textInputAction ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorWidth: 2,
          cursorHeight: 25,
          showCursor: true,
          autocorrect: true,
        onTap:onTap ,
        // validator: validator ??
        //     (value) {
        //       if (value!.isEmpty) {
        //         return errorText;
        //       }
        //       return null;
        //     },

        validator: validator,


        readOnly:isReadOnly??false ,
        maxLength:maxLength,
        obscureText: isObscureText!,
        cursorColor: primaryColorDarkLight,
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
            color: primaryColor,
            fontSize: fontSize! + 2,
            fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          counterText:"",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: true,
          fillColor: backgroundColor,
          filled: true, // dont forget this line
          contentPadding: padding??const EdgeInsets.symmetric(horizontal: 15 , vertical: 14),
          focusedBorder: enableBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                      color: borderColor! ))
              : InputBorder.none,
          disabledBorder: enableBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                      color: borderColor! ))
              : InputBorder.none,
          enabledBorder: enableBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                      color: borderColor! ))
              : InputBorder.none,
          border: enableBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                      color: borderColor! ))
              : InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ,
          labelText: lable?.tr,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              color: Colors.white,
              fontSize: (fontSize! + 2),
              fontWeight: isBold! ? FontWeight.bold : FontWeight.normal),
          hintText: hint!.tr,
          hintStyle: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 17.0,
              fontWeight: isBold! ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
