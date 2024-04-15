import 'dart:math';
import 'dart:ui';

import 'package:khome_app2/support/utlis.dart';
import 'package:flutter/material.dart';

class CustomArc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomArcPainter(),
      size: Size(kDiameter, kDiameter),
    );
  }
}

class CustomArcPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 131, 180, 204)
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    var path = Path()
      ..moveTo(0, size.height / 2)
      ..addArc(
          Rect.fromCenter(
              center: Offset(size.height / 2, size.width / 2),
              width: size.width,
              height: size.height),
          pi,
          pi);

    Path dashPath = Path();
    double dashWidth = 9.0;
    double dashSpace = 10;
    double distance = 3;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(pathMetric.extractPath(distance, distance + dashWidth),
            Offset.zero);
        distance += dashWidth;
        distance += dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
