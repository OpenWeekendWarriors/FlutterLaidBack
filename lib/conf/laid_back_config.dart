import 'dart:ui';

class LaidBackConfig {
  String? clientType = 'app';
  TextStyle? textStyle;
  Locale? locale;

  LaidBackConfig({this.clientType, this.textStyle, this.locale});

  static init({
    String? clientType,
    TextStyle? textStyle,
    Locale? locale,
  }) async {
    LaidBackConfig(
      clientType: clientType,
      locale: locale,
      textStyle: textStyle,
    );
  }
}
