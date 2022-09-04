import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

// RotatingPlain
// Wave
Widget customLoadingWidget({double? radios = 28, Color? color, bool isShowProgress = true}) {
  return Center(
    child: isShowProgress
        ? SpinKitSpinningLines(
            color:Get.theme.accentColor,
            size: radios!,
          )
        : const CustomText('No data'),
  );
}
// Widget customEmptyWidget(){
//   return Image.asset(Images.emptyPage,fit: BoxFit.cover);
// }
