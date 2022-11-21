import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';

Future<bool> showPopupDialog(context,
    {title,
      message,

      radius = 10.0,
      positiveText, negativeText, VoidCallback? positiveButton, VoidCallback? negativeButton}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(title ?? '' , fontWeight: FontWeight.w700,),
              const SizedBox(height: 15,),
              CustomText(message ?? '' , fontWeight: FontWeight.w500,),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        return positiveButton!();
                      },
                      child: CustomText(positiveText ?? 'تایید' , color: Colors.white,),
                      style: ButtonStyle(
                        backgroundColor: ElevatedButton.styleFrom(primary:Colors.blue.shade800).backgroundColor,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(radius),
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (negativeButton == null) {
                            Navigator.of(context).pop();
                          }
                          return;
                        },
                        child: CustomText(negativeText ?? 'انصراف', color: Colors.black ,),
                        style: ButtonStyle(
                            backgroundColor: ElevatedButton.styleFrom(primary:Colors.white).backgroundColor,
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(radius),
                                )
                            )
                        ),

                      ))
                ],
              )
            ],
          ),
        );
      });
}
