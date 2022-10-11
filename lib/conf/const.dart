import 'package:flutter/material.dart';
import 'package:get/get.dart';

double get minWidth => Get.width / 100;
double get minHeight => Get.height / 100;

//dimen
const double  dim_micro_small = 4;
const double  dim_small = 8;
const double  dim_medium = 16;
const double  dim_large = 24;
const double  dim_xlarge = 32;
const double  dim_xxlarge = 40;
//border
const double  brd_radius_small = 5;
const double  brd_radius_medium = 10;
const double  brd_radius_large = 16;
const double  brd_radius_xlarge = 24;
const double  brd_radius_xxlarge = 32;
//font size
const double  text_size_micro = 12;
const double  text_size_small = 14;
const double  text_size_medium = 16;
const double  text_size_large = 20;
const double  text_size_xlarge = 34;
const double  text_size_xxlarge = 45;
const double  text_size_xxxlarge = 56;
//icon size
const double  icon_size_micro = 8;
const double  icon_size_small = 12;
const double  icon_size_medium = 24;
const double  icon_size_large = 32;
const double  icon_size_xlarge = 40;
const double  icon_size_xxlarge = 48;
const double  icon_size_xxxlarge = 56;

get shimmerGradient => const LinearGradient(
      colors: [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: [
        0.1,
        0.3,
        0.4,
      ],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );

boxShadow(Color? color, double? blurRadius, double? spread, double? offset) {
  return [
    BoxShadow(
      color: color!.withOpacity(.5),
      blurRadius: blurRadius ?? 20.0, // soften the shadow
      spreadRadius: spread ?? 10.0, //extend the shadow
      offset: Offset(
        offset ?? 5.0, // Move to right 10  horizontally
        offset ?? 5.0, // Move to bottom 10 Vertically
      ),
    )
  ];
}

String persianFontFamily = 'YekiFaNumMedium';
String englishFontFamily = 'Helvetica';
