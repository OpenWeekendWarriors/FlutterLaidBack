

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CurveClipPainter extends CustomClipper<Path> {


  @override
  Path getClip(Size size) {

    var path = Path();
    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 2, size.height , size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close() ;
    return path ;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}











