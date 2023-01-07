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

TextDirection getDirection(String v) {
  final string = v.trim();
  if (string.isEmpty) return TextDirection.ltr;
  final firstUnit = string.codeUnitAt(0);
  if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
      firstUnit > 0x0750 && firstUnit < 0x077F ||
      firstUnit > 0x07C0 && firstUnit < 0x07EA ||
      firstUnit > 0x0840 && firstUnit < 0x085B ||
      firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
      firstUnit > 0x08E3 && firstUnit < 0x08FF ||
      firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
      firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
      firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
      firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
      firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
      firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
      firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
      firstUnit > 0x10800 && firstUnit < 0x10805 ||
      firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
      firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
      firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
      firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
      firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
      firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
      firstUnit > 0x1D242 && firstUnit < 0x1D244) {
    return TextDirection.rtl;
  }
  return TextDirection.ltr;
}
