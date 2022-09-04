import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customEmptyWidget({text}) {
  return Center(
      child: Text(
        text ?? 'داده ای برای نمایش وجود ندارد',
        style: TextStyle(color: Colors.red , fontSize: 18,),
      ));
}
// Widget customEmptyWidget(){
//   return Image.asset(Images.emptyPage,fit: BoxFit.cover);
// }
