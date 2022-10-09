import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  late Color? color;
  final Color? outlineColor;
  final Color? splashColor;
  final Color? borderColor;
  final int? type;
  final double? borderRadios;
  final double? elevation;
  final EdgeInsets? padding;
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

  late final Map<Type, Action<Intent>> _actionMap;
  final Map<ShortcutActivator, Intent> _shortcutMap = const <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.keyX): ActivateIntent(),
  };

  CustomButton(
      {Key? key,
      this.color,
      this.outlineColor,
      this.splashColor,
      this.borderColor,
      this.type = 1,
      this.borderRadios,
      this.elevation,
      this.padding,
      this.insidepadding,
      this.bgColor,
      this.onTap,
      this.focusNode,
      this.changeFocus,
      this.hasShadow = false,
      this.title,
      this.isLoading = false,
      this.isOutline = false,
      this.focusKeyCallback,
      this.child = const SizedBox()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<Intent>(
        onInvoke: (Intent intent) => _toggleState(),
      ),
    };
    return isOutline
        ? Container(
            height: 70.0,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              onPressed: () {
                onTap!.call();
              },
              child: title != null
                  ? CustomText(
                      title,
                      // fontWeight: FontWeight.bold,
                      size: 12,
                      color: color ?? Colors.white,
                    )
                  : child!,
              // textColor: MyColor.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: outlineColor!, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          )
        : Container(
            height: 45.0,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            // decoration: BoxDecoration(boxShadow:hasShadow!=null ? [BoxShadow(
            // color: bgColor!.first,
            //   blurRadius: 50.0,
            //   spreadRadius: 0.8,
            //   offset: Offset(10.0, 1.0),
            // )]:null ,),
            child: Focus(
              onKey: (node , value) {
                if (value.runtimeType.toString() == 'RawKeyDownEvent') {
                  RawKeyEventDataAndroid data = value.data as RawKeyEventDataAndroid;
                  focusKeyCallback!.call(data);
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;

              },
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  changeFocus!.call(hasFocus);
                }
              },
              child: RaisedButton(
                focusNode: focusNode ?? FocusNode(),
                padding: const EdgeInsets.all(0),
                focusColor: Get.theme.accentColor.withAlpha(150),
                onPressed: () {
                  if (isLoading) {
                    return;
                  } else {
                    onTap!.call();
                  }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor ?? Colors.transparent),
                      gradient: LinearGradient(
                        colors: bgColor ??
                            [
                              Get.theme.primaryColorLight,
                              Get.theme.primaryColorDark,
                            ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius)),
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
                                  color: Colors.white,
                                )
                              : child,
                        ),
                ),
              ),
            ),
          );
  }

  _toggleState() {
    debugPrint('toggle test');
  }
}
