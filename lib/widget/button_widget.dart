import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  late Color? textColor;
  final Color? outlineColor;
  final Color? splashColor;
  final Color? borderColor;
  final double? borderWidth;
  final int? type;
  final double? borderRadios;
  final double? elevation;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? insidepadding;
  final bool? hasShadow;
  final String? title;
  final List<Color>? bgColor;
  final bool isOutline;
  final bool isLoading;
  final Function? onTap;
  final FocusNode? focusNode;
  final ValueChanged<bool>? changeFocus;
  final ValueChanged<RawKeyEventDataAndroid>? focusKeyCallback;

  CustomButton(
      {Key? key,
      this.textColor,
      this.outlineColor,
      this.borderWidth = 1,
      this.splashColor,
      this.borderColor,
      this.type = 1,
      this.borderRadios,
      this.elevation,
      this.margin,
      this.insidepadding,
      this.bgColor,
      this.onTap,
      this.focusNode,
      this.changeFocus,
      this.hasShadow = false,
      this.title,
      this.width,
      this.height,
      this.isLoading = false,
      this.isOutline = false,
      this.focusKeyCallback,
      this.child = const SizedBox()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: outlineColor ?? Get.theme.primaryColor,
            width: borderWidth!,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(borderRadios ?? brd_radius_medium)),
    );
    return isOutline
        ? Container(
            height: height ?? 50.0,
            width: width ?? double.infinity,
            margin: margin ?? const EdgeInsets.symmetric(vertical: dim_small),
            child: OutlinedButton(
              style: outlineButtonStyle,
              onPressed: () {
                onTap!.call();
              },
              // textColor: MyColor.white,
              child: title != null
                  ? CustomText(
                      textAlign: TextAlign.center,

                      title,
                      // fontWeight: FontWeight.bold,
                      size: 50,
                      color: textColor,
                    )
                  : child!,
            ),
          )
        : Container(
            height: height ?? 50.0,
            width: width ?? double.infinity,
            margin: margin ?? const EdgeInsets.symmetric(vertical: dim_small),
            // decoration: BoxDecoration(boxShadow:hasShadow!=null ? [BoxShadow(
            // color: bgColor!.first,
            //   blurRadius: 50.0,
            //   spreadRadius: 0.8,
            //   offset: Offset(10.0, 1.0),
            // )]:null ,),
            child: ElevatedButton(
              focusNode: focusNode ?? FocusNode(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                elevation: elevation,
                foregroundColor: Get.theme.colorScheme.secondary.withAlpha(150),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadios ?? brd_radius_medium)),
              ),
              onPressed: () {
                if (isLoading) {
                  return;
                } else {
                  onTap!.call();
                }
              },
              child: Ink(
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth!),
                    gradient: LinearGradient(
                      colors: bgColor ??
                          [
                            Get.theme.primaryColorLight,
                            Get.theme.primaryColorDark,
                          ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(borderRadios ?? brd_radius_medium)),
                child: isLoading
                    ? const SpinKitChasingDots(
                        color: Colors.white,
                        size: 20.0,
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: title != null
                            ? CustomText(
                                title,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                color: textColor ?? Get.theme.textTheme.bodyText1!.color,
                              )
                            : child,
                      ),
              ),
            ),
          );
  }

  _toggleState() {
    debugPrint('toggle test');
  }
}
