
import 'package:flutter/painting.dart';
import 'package:flutter_laid_back/di/dependency.dart';
import 'package:get/get.dart';

class LaidBackConfig {
  String? clientType = 'app';
  TextStyle? textStyleBody;
  TextStyle? textStyleTitle;
  Locale? locale;

  LaidBackConfig({this.clientType, this.textStyleBody, this.textStyleTitle, this.locale});

  static init({
    String? clientType,
    TextStyle? textStyleBody,
    TextStyle? textStyleTitle,
    Locale? locale,
  }) async {

    injectLaidBackDependency(LaidBackConfig(
        locale: locale, clientType: clientType, textStyleBody: textStyleBody, textStyleTitle: textStyleTitle));
  }
}
