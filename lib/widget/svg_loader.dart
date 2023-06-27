import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget svgLoader(String img ,{ Color? color , double? width , double? height}){
  if(img.contains('http')){
    return SvgPicture.network(
      img,
      width: width,
      height: height,
      color: color,
      fit: BoxFit.cover,
      // color: Colors.red,
      // semanticsLabel: 'A red up arrow'
    );
  }else {
    return SvgPicture.asset(
      img,
      width: width,
      height: height,
      color: color,
      fit: BoxFit.contain,
      // color: Colors.red,
      // semanticsLabel: 'A red up arrow'
    );
  }
}
