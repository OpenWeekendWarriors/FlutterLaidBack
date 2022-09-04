import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCirclePainter extends CustomPainter {
  late final learned;
  late final notLearned;
  late final range;
  late final totalQuestions;
  late final color;
  late final double? strokeWidth;
  late final double? sizeBox;
  late final double? offsetdx;
  late final double? offsetdy;
  double pi = math.pi;

  CustomCirclePainter(
      {this.learned,
      this.totalQuestions,
      this.notLearned,
      this.range,
      this.sizeBox,
      this.color,
      this.offsetdx,
      this.offsetdy,
      this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWi = strokeWidth??7;
    Rect myRect = Offset(offsetdx??-40.0, offsetdy??-50.0) &  Size(sizeBox!, sizeBox!);

    var paint1 = Paint()
      ..color = color??Colors.red
      ..strokeWidth = strokeWi
      ..style = PaintingStyle.stroke;

    double firstLineRadianStart = 0;
    double _unAnswered =
        (totalQuestions - notLearned - learned) * range / totalQuestions;
    double firstLineRadianEnd = (360 * _unAnswered) * math.pi / 180;
    canvas.drawArc(
        myRect, firstLineRadianStart, firstLineRadianEnd, false, paint1);

    double _learned = (learned) * range / totalQuestions;
    double secondLineRadianEnd = getRadians(_learned);
    canvas.drawArc(
        myRect, firstLineRadianEnd, secondLineRadianEnd, false, paint1);
  }

  double getRadians(double value) {
    return (360 * value) * pi / 180;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
