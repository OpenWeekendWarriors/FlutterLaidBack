import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:rxdart/rxdart.dart';

class CustomKeyListener extends StatelessWidget {
  FocusNode? focusNode;
  Function(RawKeyEventDataAndroid)? callback;
  Widget? child;
  var publisher = BehaviorSubject<RawKeyEventDataAndroid>();

  CustomKeyListener({Key? key, this.focusNode, this.child, this.callback}) : super(key: key) {
    // publisher.stream.throttle((eve) {
    //   print(eve.toString());
    //   return TimerStream(
    //       true,
    //       Duration(
    //           seconds: eve.keyCode == KEY_CENTER ||
    //                   eve.keyCode == KEY_PLUS ||
    //                   eve.keyCode == KEY_NEGETIVE ||
    //                   eve.keyCode == KEY_PLUS_MAGIC ||
    //                   eve.keyCode == KEY_NEGETIVE_MAGIC
    //               ? 2
    //               : 0));
    // }).listen((event) {
    //   callback!.call(event);
    //   debugPrint('############${event.keyCode} ' + DateTime.now().toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool _enabled = true;
    return RawKeyboardListener(
      focusNode: focusNode!,
      child: child!,
      onKey: (value) {
        if (value.runtimeType.toString() == 'RawKeyDownEvent') {
          RawKeyEventDataAndroid data = value.data as RawKeyEventDataAndroid;
          publisher.add(data);
          debugPrint('############ CLICK TIME ' + DateTime.now().toString());

          //
          // if(_enabled) {
          //   debugPrint(':::::::::::: CLICK TIME '+ DateTime.now().toString());
          //   debugPrint(':::::::::::: '+_enabled.toString());
          //   _enabled=false;
          //   callback!.call(data);
          //   Future.delayed(const Duration(seconds: 2) , (){
          //     _enabled = true;
          //     debugPrint(':::::::::::: AFTER CLICK TIME'+ DateTime.now().toString());
          //     debugPrint(':::::::::::: '+_enabled.toString());
          //   });
          //
          //
          // }

        }
      },
    );
  }
}
