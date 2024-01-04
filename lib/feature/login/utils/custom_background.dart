import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class CustomBackground extends CustomPainter {
  CustomBackground(this.viewInsertBottom);
  final double viewInsertBottom;
  @override
  void paint(Canvas canvas, Size size) {
    final heightPaintColor = size.height;
    final paintBlue = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = ui.Gradient.linear(
          Offset(0, heightPaintColor),
          Offset(Get.width, Get.height),
          [Colors.blue.withOpacity(0.85), Colors.blue])
      ..color = Colors.blue;
    var pathBlue = Path();

    final double heightPaintBlue = Get.height / 3 - viewInsertBottom;

    pathBlue.moveTo(0, heightPaintBlue);
    pathBlue.lineTo(0, Get.height - viewInsertBottom);
    pathBlue.lineTo(Get.width, Get.height - viewInsertBottom);
    pathBlue.lineTo(Get.width, heightPaintBlue);
    pathBlue.quadraticBezierTo(
        Get.width / 2, heightPaintBlue + 100, 0, heightPaintBlue);
    pathBlue.close();
    canvas.drawPath(
      pathBlue,
      paintBlue,
    );

    //draw yellow
    final double heightPaintYellow = heightPaintBlue - 50;
    final paintYellow = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    final pathYellow = Path();
    pathYellow.moveTo(0, heightPaintYellow);
    pathYellow.lineTo(0, heightPaintBlue);
    pathYellow.quadraticBezierTo(
        Get.width / 2, heightPaintBlue + 100, Get.width, heightPaintBlue);
    pathYellow.lineTo(Get.width, heightPaintYellow);
    pathYellow.quadraticBezierTo(
        Get.width / 2, heightPaintBlue + 100, 0, heightPaintYellow);
    canvas.drawPath(pathYellow, paintYellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
