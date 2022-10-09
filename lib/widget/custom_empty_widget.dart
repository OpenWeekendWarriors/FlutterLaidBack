import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';

Widget customEmptyWidget({Color? color, String? text, String? img}) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
    CustomText(
      text ?? 'داده ای برای نمایش وجود ندارد',
      color: color ?? Colors.red,
    ),
    img == null ? const Icon(Icons.error_outline) : Image.asset(img!)
  ]);
}
// Widget customEmptyWidget(){
//   return Image.asset(Images.emptyPage,fit: BoxFit.cover);
// }
