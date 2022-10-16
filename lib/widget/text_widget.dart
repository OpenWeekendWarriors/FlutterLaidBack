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
  final int? characterCount;
  final bool? isScrolling;
  final double? padding;
  final VoidCallback? onTap;

  const CustomText(this.text,
      {Key? key,
      this.color,
      this.size = 18.0,
      this.fontWeight,
      this.textAlign = TextAlign.start,
      this.characterCount,
      this.padding = 2,
      this.startWidget,
      this.endWidget,
      this.onTap,
      this.isScrolling = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding == null ? EdgeInsets.all(padding!) : EdgeInsets.all(padding!),
      child: Material(
          color: Colors.transparent,
          child: Text(
            characterCount == null
                ? text!.tr
                : text!.tr.substring(
                        0,
                        text!.tr.length < characterCount!
                            ? text!.tr.length
                            : characterCount) +
                    (text!.tr.length < characterCount! ? "" : "..."),
            textAlign: textAlign,
            style: TextStyle(
              height: 1.1,
                color:color ?? Get.theme.textTheme.bodyText1!.color,
                fontSize: size!,
                fontWeight: fontWeight ?? FontWeight.normal),
          )),
    );
  }
}
