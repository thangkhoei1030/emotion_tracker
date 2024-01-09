import 'dart:math';

import 'package:flutter/material.dart';

class CustomAvatar extends CustomPainter {
  final Color color;

  final double avatarRadius;

  CustomAvatar({
    required this.color,
    required this.avatarRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds =
        Rect.fromLTRB(0, 0, size.width, size.height - avatarRadius);

    final centerAvatar = Offset(shapeBounds.center.dx, shapeBounds.bottom);

    final avatarBounds =
        Rect.fromCircle(center: centerAvatar, radius: avatarRadius);

    _drawBackground(canvas, shapeBounds, avatarBounds);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
    final paint = Paint()..color = color;

    final backgroundPath = Path()
      ..moveTo(shapeBounds.left, shapeBounds.top)
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
      ..arcTo(avatarBounds, -pi, pi, false)
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..close();

    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(CustomAvatar oldDelegate) {
    return color != oldDelegate.color;
  }
}
