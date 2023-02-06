import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingOverlay {
  BuildContext? _context;
  bool isShow = false;
  Timer? _timer;
  int DEFAULT_TIME_OUT_IN_SECONDS = 20;
  int _countDownTimerInSec = 20;

  void startTimer() {
    _countDownTimerInSec = DEFAULT_TIME_OUT_IN_SECONDS;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_countDownTimerInSec == 0) {
          hide();
        } else {
          _countDownTimerInSec--;
        }
      },
    );
  }
  void hide() {
    if (isShow) {
      isShow = false;
      _timer!.cancel();
      _countDownTimerInSec = DEFAULT_TIME_OUT_IN_SECONDS;
      Navigator.of(_context!).pop();
    }
  }

  void show({bool isUpload = false, int timeoutInSec=30}) {
    isShow = true;
    DEFAULT_TIME_OUT_IN_SECONDS = timeoutInSec;
    startTimer();
    showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (context) => _FullScreenLoader(
              isUpload: isUpload,
            ));

    // Navigator.of(_context!).push(TutorialOverlay());
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext? context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  bool isUpload;

  _FullScreenLoader({this.isUpload = false});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
          decoration: BoxDecoration(),
          child: Center(
            child: !isUpload
                ? const SpinKitCubeGrid(
                    color: Colors.white,
                    size: 30.0,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        "در حال ارسال تصاویر...",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
                      ),
                    ],
                  ),
          )),
    );
  }
}

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Container(
          decoration: const BoxDecoration(),
          child: const Center(
              child: SpinKitCubeGrid(
            color: Colors.white,
            size: 30.0,
          ))),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

Color overlayColor(BuildContext context, double elevation) {
  final ThemeData theme = Theme.of(context);
  final double opacity = (4.5 * log(elevation + 1) + 2) / 100.0;
  return theme.colorScheme.onSurface.withOpacity(opacity);
}
