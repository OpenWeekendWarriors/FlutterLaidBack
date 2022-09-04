import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension KeyboardLisener on Widget {
  addKeyboardListener(
      {FocusNode? focusNode, Function(RawKeyEventDataAndroid)? callback}) {
    return RawKeyboardListener(
      focusNode: focusNode!,
      onKey: (value) {
        if (value.runtimeType.toString() == 'RawKeyDownEvent') {
          RawKeyEventDataAndroid data = value.data as RawKeyEventDataAndroid;
          callback!.call(data);
        }
      },
      child: this,
    );
  }
}
