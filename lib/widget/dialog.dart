import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Future dialog({title, message, confirmCallback, cancelCallback}) {
  return Get.defaultDialog(
      buttonColor: Colors.transparent,
      title: title ?? '',
      titleStyle: TextStyle(fontSize: 12 ,color: Colors.black , fontWeight: FontWeight.bold ,),
      middleTextStyle: TextStyle(fontSize: 14,color: Colors.black),
      backgroundColor: Colors.white,
      middleText: message ?? '',
      radius: 10,
      onConfirm: confirmCallback,
      onCancel: cancelCallback ?? () => Get.back(),
      textConfirm: 'تایید',
      confirmTextColor: Colors.black,
      cancelTextColor: Colors.black,

      textCancel: 'انصراف');
}
