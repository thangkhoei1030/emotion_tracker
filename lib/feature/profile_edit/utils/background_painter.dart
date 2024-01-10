import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class BackgroundProfileEditPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backGroundPainter = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        const Offset(
          0,
          0,
        ),
        Offset(Get.width, Get.height),
        AppColors.backgroundColorLogin,
      );
    var pathPaint = Path();
    pathPaint.moveTo(0, ProfileEditDimes.xBackGroundStart);
    pathPaint.lineTo(0, Get.height);
    pathPaint.lineTo(Get.width, Get.height);
    pathPaint.lineTo(Get.width, 150);
    pathPaint.quadraticBezierTo(
        Get.width / 2,
        ProfileEditDimes.xBackGroundStart + 100,
        0,
        ProfileEditDimes.xBackGroundStart);

    pathPaint.close();
    canvas.drawPath(pathPaint, backGroundPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
