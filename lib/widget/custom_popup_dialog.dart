import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/blured_dialog.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';

Future<bool> showPopupDialog(context,
    {title,
    message,
    bool isBlur = false,
    radius = 12.0,
    positiveText,
    negativeText,
    VoidCallback? positiveButton,
    VoidCallback? negativeButton}) async {
  return await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return isBlur
            ? BlurredDialog(
                // height: 150,
                blurColorWithOpacity: Colors.white30,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CustomText(
                            title ?? '',
                            size: 22,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            message ?? '',
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: const Color(0xFFE2E2E2),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                    return positiveButton!();
                                  },
                                  child: CustomText(
                                    positiveText ?? 'تایید',
                                    padding: 0,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    color: Get.theme.primaryColor,
                                  ),
                                ),
                              ),
                              negativeText==null ? const SizedBox():Container(
                                  width: 0.5,
                                  color: const Color(0xFFE2E2E2),
                                ),
                              negativeText==null ? const SizedBox():Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (negativeButton == null) {
                                        Navigator.of(context).pop();
                                      }
                                      return;
                                    },
                                    child: CustomText(
                                      negativeText ?? '',
                                      textAlign: TextAlign.center,
                                      padding: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : AlertDialog(
                contentPadding: const EdgeInsets.only(top: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          title ?? '',
                          size: 22,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          message ?? '',
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: const Color(0xFFE2E2E2),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                    return positiveButton!();
                                  },
                                  child: CustomText(
                                    positiveText ?? '',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    color: Get.theme.primaryColor,
                                  ),
                                ),
                              ),

                              negativeText==null ? const SizedBox():Container(
                                width: 0.5,
                                color: const Color(0xFFE2E2E2),
                              ),
                              negativeText==null ? const SizedBox():Expanded(
                                child: InkWell(
                                  onTap: (){
                                    if (negativeButton == null) {
                                      Navigator.of(context).pop();
                                    }
                                    return;
                                  },
                                  child: CustomText(
                                    negativeText ?? '',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ));
      });
}
