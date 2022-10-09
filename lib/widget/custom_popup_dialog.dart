import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';

Future<bool> showPopupDialog(context,
    {title,
      message,
      positiveText, negativeText, VoidCallback? positiveButton, VoidCallback? negativeButton}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(title ?? '' , fontWeight: FontWeight.w700,),
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
                        style: ElevatedButton.styleFrom(primary: Colors.blue.shade800),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
