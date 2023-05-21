import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class Themes {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: const Color(0XFFF0F0F0),
    primaryColor: const Color(0xFF253270),
    primaryColorLight: const Color(0xFF555b9f),
    primaryColorDark: const Color(0xFF000c44),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    // fontFamily: Utils.getFontFamily(),
    primaryIconTheme: const IconThemeData(color: Color(0xFF1C2552),),
    iconTheme: const IconThemeData(color: Color(0xFF8E8E93),),
    hintColor: const Color(0xff8E8E93),
    primaryTextTheme: const TextTheme(bodyText1: TextStyle(color: Color(0xFF333333))),
    textTheme: const TextTheme(bodyText1: TextStyle(color: Color(0xFF333333),)),
    dividerColor: const Color(0xFFBBBBCB),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  final darkTheme = ThemeData(
    backgroundColor: const Color(0XFFA0A0A0),
    scaffoldBackgroundColor: const Color(0XFFA0A0A0),
    primaryColor: const Color(0xFF253270),
    primaryColorLight: const Color(0xFF555b9f),
    primaryColorDark: const Color(0xFF000c44),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    // fontFamily: Utils.getFontFamily(),
    primaryIconTheme: const IconThemeData(color: Color(0xFF1C2552),),
    iconTheme: const IconThemeData(color: Color(0xFF3E3E43),),
    hintColor: const Color(0xff3E3E43),
    primaryTextTheme: const TextTheme(bodyText1: TextStyle(color: Color(0xFF838383))),
    textTheme: const TextTheme(bodyText1: TextStyle(color: Color(0xFF838383),)),
    dividerColor: const Color(0xFFBBBBCB),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
