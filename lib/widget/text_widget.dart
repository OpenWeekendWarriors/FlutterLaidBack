import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final Widget? startWidget;
  final Widget? endWidget;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? height;
  final TextOverflow? overflow;
  final int? characterCount;
  final int? maxLines;
  final bool? isMatchParent;
  final double? padding;
  final VoidCallback? onTap;
  final TextStyle? style;

  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.size = 18.0,
    this.fontWeight,
    this.textAlign = TextAlign.start,
    this.characterCount,
    this.maxLines,
    this.padding = 2,
    this.startWidget,
    this.endWidget,
    this.onTap,
    this.letterSpacing,
    this.height,
    this.overflow,
    this.style,
    this.isMatchParent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    var fontSize = 18.0;
    if (width <= 480) {
      fontSize = 16.0;
    } else if (width > 480 && width <= 960) {
      fontSize = 22.0;
    } else {
      fontSize = 28.0;
    }
    var textStyle = TextStyle(
        height: height ?? 1.1,
        overflow: overflow,
        letterSpacing: letterSpacing,
        // fontFamily: Utils.getFontFamily(),
        color: color ?? Get.theme.textTheme.bodyText1!.color,
        fontSize: size!,
        fontWeight: fontWeight ?? FontWeight.normal);
    if (style != null) {
      textStyle = style!.copyWith(
        height: height ?? (style?.height ?? 1.1),
        overflow: overflow,
        letterSpacing: letterSpacing,
        color: color ?? (style?.color ?? Get.theme.textTheme.bodyText1!.color),
        fontSize: size,
        fontWeight: fontWeight ?? (style?.fontWeight ?? FontWeight.normal),
      );
    }
    return Padding(
      padding: padding == null ? EdgeInsets.all(padding!) : EdgeInsets.all(padding!),
      child: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: isMatchParent! ? double.infinity : null,
            child: buildText(textStyle),

            // child: Row(
            //   mainAxisAlignment: textAlign == TextAlign.center
            //       ? MainAxisAlignment.center
            //       : textAlign == TextAlign.end
            //           ? MainAxisAlignment.end
            //           :  MainAxisAlignment.start,
            //   children: [
            //    startWidget??const SizedBox(),
            //     endWidget != null ? buildText(textStyle) :Expanded(child: buildText(textStyle) ) ,
            //     endWidget??const SizedBox(),
            //   ],
            // ),
          )),
    );
  }

  Text buildText(TextStyle textStyle) {
    return Text(
      maxLines: maxLines,
      characterCount == null
          ? text!.tr
          : text!.tr.substring(0, text!.tr.length < characterCount! ? text!.tr.length : characterCount) +
              (text!.tr.length < characterCount! ? "" : "..."),
      textAlign: textAlign,
      style: textStyle,
    );
  }
}
