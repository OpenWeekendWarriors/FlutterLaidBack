import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:meta/meta.dart';

enum SnackBarType { Error, Hint, Report }

enum ShowType { DIALOG, SNACKBAR, TOAST }

var errorColor = Colors.red.withAlpha(150);
var hintColor = Colors.yellow.withAlpha(150);
var reportColor = Colors.green.withAlpha(150);

void showSnackBar(
    {@required String? text,
    String? textConfirm,
    int? duration,
    SnackPosition snackPosition = SnackPosition.TOP,
    VoidCallback? onConfirm,
    ShowType showType = ShowType.SNACKBAR,
    VoidCallback? onTap,
    Color? color,
    SnackBarType snackBarType = SnackBarType.Error}) {
  switch (showType) {
    case ShowType.DIALOG:
      Get.defaultDialog(
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          title: snackBarType == SnackBarType.Error
              ? '\u26D4' + ' ' + ''
              : snackBarType == SnackBarType.Report
                  ? '\u26A0' +
                      ' '
                          '' +
                      ''
                  : '',
          middleTextStyle: const TextStyle(fontSize: 14),
          middleText: text!,
          cancelTextColor: Get.theme.primaryColor,
          textCancel: 'متوجه شدم',
          barrierDismissible: false,
          onCancel: () => {},
          confirmTextColor: Get.theme.primaryColor,
          textConfirm: textConfirm ?? '',
          onConfirm: () {
            onConfirm;
          });

      break;
    case ShowType.SNACKBAR:
      Get.snackbar("Skills Message",
          text!.substring(0, text.length > 200 ? 200 : text.length),
          snackPosition: snackPosition,barBlur: 0.8,
          duration: Duration(seconds: duration ?? 2),
          animationDuration: const Duration(milliseconds: 700),
          // maxWidth: 100,
          titleText: Center(
            child: CustomText(
              text.substring(0, text.length > 200 ? 200 : text.length),
              color: Colors.white,
              size: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
          // snackStyle: SnackStyle.GROUNDED,
          messageText: const SizedBox(),
          colorText: Colors.black,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(8.0),
          boxShadows: [const BoxShadow(color: Colors.black45, blurRadius: 4)],
          borderRadius: 1,
          // borderColor: snackBarType == SnackBarType.Error
          //     ? Colors.black
          //     : snackBarType == SnackBarType.Report ? Colors.black : Colors.black,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          // backgroundColor: Get.theme.appBarTheme.color.withAlpha(150));
          backgroundColor: snackBarType == SnackBarType.Error
              ? errorColor
              : snackBarType == SnackBarType.Report
                  ? reportColor
                  : hintColor);
      // return Get.snackbar("Skills Massasge",
      //     text.substring(0, text.length > 200 ? 200 : text.length),
      //     snackPosition: SnackPosition.TOP,
      //     duration: Duration(seconds: 60),
      //     titleText: Center(
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 4.0),
      //         child: CustomText(
      //           snackBarType == SnackBarType.Error
      //               ? '\u26D4' + ' ' + Strings.error.mapValue
      //               : snackBarType == SnackBarType.Report
      //                   ? '\u26A0' +
      //                       ' '
      //                           '' +
      //                       Strings.warning.mapValue
      //                   : '',
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //           textAlign: TextAlign.left,
      //           size: 18,
      //         ),
      //       ),
      //     ),
      //     messageText: Center(
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 4.0),
      //         child: CustomText(
      //           text.substring(0, text.length > 200 ? 200 : text.length),
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //           textAlign: TextAlign.left,
      //           size: 16,
      //         ),
      //       ),
      //     ),
      //     colorText: Colors.black,
      //     margin: EdgeInsets.all(3.0),
      //     padding: EdgeInsets.all(8.0),
      //     boxShadows: [BoxShadow(color: Colors.black45, blurRadius: 4)],
      //     borderRadius: 10,
      //     // borderColor: snackBarType == SnackBarType.Error
      //     //     ? ColorPallet.red
      //     //     : snackBarType == SnackBarType.Report ? ColorPallet.green : ColorPallet.grey,
      //     dismissDirection: SnackDismissDirection.HORIZONTAL,
      //     // backgroundColor: Get.theme.appBarTheme.color.withAlpha(150));
      //     backgroundColor: Get.theme.accentColor);
      break;
    // case ShowType.TOAST:
    //   Fluttertoast.showToast(
    //       msg: text??'',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    //   break;
  }
}
