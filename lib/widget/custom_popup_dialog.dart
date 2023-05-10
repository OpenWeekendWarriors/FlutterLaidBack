import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/blured_dialog.dart';
import 'package:flutter_laid_back/widget/custom_key_listener.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';

Future<bool?> showPopupDialog(context,
    {title,
      message,
      bool isBlur = false,
      bool btnBackEnable = false,
      bool barrierDismissible = false,

      radius = 12.0,
      positiveText,
      negativeText,
      Widget? actions,


      VoidCallback? positiveButton,
      VoidCallback? negativeButton}) async {
  FocusNode? focusNodeOk = FocusNode();
  FocusNode? focusNodeCancel = FocusNode();


  return await showCupertinoDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        if(!focusNodeOk.hasFocus){
          FocusScope.of(context).requestFocus(focusNodeOk);

        }


        return isBlur
            ?
        WillPopScope(
          onWillPop: () async => btnBackEnable? true:false,
          child: GestureDetector(
            onTap: (){
              if(barrierDismissible)Navigator.of(context).pop();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              child: BlurredDialog(
                // height: 150,
                blurColorWithOpacity: Colors.white24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CustomText(
                            title ?? '',
                            size: 16,
                            color: const Color(0xFF333333),
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            message ?? '',
                            size: 14,
                            color: const Color(0xFF333333),
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
                          child: actions ??
                              Directionality(
                                  textDirection: TextDirection.rtl, child:
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomKeyListener(
                                      focusNode:focusNodeOk,
                                      callback: (p0) {
                                        //23 = keyCenter
                                        if(p0.keyCode == 23){
                                          Navigator.of(context).pop();
                                          return positiveButton!();
                                        }


                                      },
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          return positiveButton!();
                                        },
                                        child: CustomText(
                                          positiveText ?? 'تایید',
                                          size: 16,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w700,
                                          color:focusNodeOk.hasFocus ?
                                          Colors.blue:Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  negativeText == null
                                      ? const SizedBox()
                                      : Container(
                                    width: 0.5,
                                    color: const Color(0xFFE2E2E2),
                                  ),
                                  negativeText == null
                                      ? const SizedBox()
                                      : Expanded(
                                    child: CustomKeyListener(
                                      focusNode: focusNodeCancel,
                                      callback: (p0){
                                        if(p0.keyCode == 23){
                                          if (negativeButton == null) {
                                            Navigator.of(context).pop();
                                          }
                                          return;
                                        }
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          if (negativeButton == null) {
                                            Navigator.of(context).pop();
                                          }
                                          return;
                                        },
                                        child: CustomText(
                                          negativeText ?? '',
                                          size: 16,
                                          color:focusNodeCancel.hasFocus ?

                                              Colors.indigo:
                                          const Color(0xFF333333),
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
            : WillPopScope(
          onWillPop: () async => btnBackEnable? true:false,
          child:GestureDetector(
            onTap: (){
              if(barrierDismissible)Navigator.pop(context);
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,

              child: AlertDialog(
                  contentPadding: const EdgeInsets.only(top: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius))),

                  content:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 5, 7, 0),
                        child: Column(
                          children: [
                            CustomText(
                              title ?? '',
                              size: 16,
                              color: const Color(0xFF333333),
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              message ?? '',
                              size: 14,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
                              child: actions ??
                                  Directionality(textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomKeyListener(
                                            focusNode: focusNodeOk,
                                            callback: (p0){
                                              if(p0.keyCode == 23){
                                                Navigator.of(context).pop();
                                                return positiveButton!();
                                              }
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                return positiveButton!();
                                              },
                                              child: CustomText(
                                                positiveText ?? '',
                                                size: 16,
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w700,
                                                color:focusNodeOk.hasFocus ?
                                                Colors.blue:Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        negativeText == null
                                            ? const SizedBox()
                                            : Container(
                                          width: 0.5,
                                          color: const Color(0xFFE2E2E2),
                                        ),
                                        negativeText == null
                                            ? const SizedBox()
                                            : Expanded(
                                          child: CustomKeyListener(
                                            focusNode: focusNodeCancel,
                                            callback: (p0) {
                                              if (negativeButton == null) {
                                                Navigator.of(context).pop();
                                              }
                                              return;
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                if (negativeButton == null) {
                                                  Navigator.of(context).pop();
                                                }
                                                return;
                                              },
                                              child: CustomText(
                                                negativeText ?? '',
                                                size: 16,
                                                color: focusNodeCancel.hasFocus ?
                                                Colors.indigo
                                                    :
                                                const Color(0xFF333333),
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),)

                          ),
                        ],
                      )
                    ],
                  )


              ),
            ),
          ),
        );
      }).then((value) {
    return false;
  });
}
