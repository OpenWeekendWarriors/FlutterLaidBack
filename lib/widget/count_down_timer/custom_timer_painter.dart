import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter(
      {this.animation,
      this.fillColor,
      this.fillGradient,
      this.ringColor,
      this.ringGradient,
      this.strokeWidth,
      this.strokeCap,
      this.backgroundColor,
      this.backgroundGradient})
      : super(repaint: animation);

  final Animation<double>? animation;
  final Color? fillColor, ringColor, backgroundColor;
  final double? strokeWidth;
  final StrokeCap? strokeCap;
  final Gradient? fillGradient, ringGradient, backgroundGradient;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ringColor!
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeWidth!
      ..strokeCap = strokeCap!
      ..style = PaintingStyle.stroke;

    if (ringGradient != null) {
      final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);
      paint.shader = ringGradient!.createShader(rect);
    } else {
      paint.shader = null;
    }

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    double startAngle = math.pi * 1.5;
    double sweepAngle = (animation!.value) * 2 * math.pi;

    if (fillGradient != null) {
      final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);
      paint.shader = fillGradient!.createShader(rect);
    } else {
      paint.shader = null;
      paint.color = fillColor!;
    }
    canvas.drawArc(Offset.zero & size, startAngle, sweepAngle, false, paint);

    if (backgroundColor != null || backgroundGradient != null) {
      final startPoints = [
        size.topCenter(const Offset(0.0, -27)),
        // size.topCenter(const Offset(0.0,6)),
      ];
      final startPaint = Paint()
        ..color = Colors.white
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round;

      final endPoints = [
       size.center(Offset(50, 100)),
       size.center(Offset(200, 100)),
       size.center(Offset(250, 100)),
       size.center(Offset(50, 300)),
       size.center(Offset(50, 400)),
      ];
      final endPaint = Paint()
        ..color = Colors.white
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round;

      final backgroundPaint = Paint();
      if (backgroundGradient != null) {
        final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2.2);
        backgroundPaint.shader = backgroundGradient!.createShader(rect);
      } else {
        backgroundPaint.color = backgroundColor!;
      }

      Paint paintBorder = Paint()
        ..color = Colors.white
        ..strokeWidth = size.width / 50
        ..style = PaintingStyle.stroke;

      canvas.drawCircle(size.center(Offset.zero), size.width / 2.2, backgroundPaint);
      canvas.drawCircle(size.center(Offset.zero), size.width / 1.5, paintBorder);

      // canvas.drawLine(startPoints.first , startPoints.last, startPaint);
      canvas.drawPoints(PointMode.points, startPoints, startPaint);
      // canvas.drawPoints(PointMode.points, endPoints, endPaint);

    }
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation!.value != old.animation!.value || ringColor != old.ringColor || fillColor != old.fillColor;
  }
}
