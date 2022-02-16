import 'package:flutter/material.dart';

class CameraLineFilter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size / 2;

    double dashWidth = 20;
    double dashHeight = 20;
    double dashSpace = 10;
    double startX = 0;
    double startY = 0;

    final paint = Paint();

    // the upper horizontal yellow line

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, center.height - 100),
        Offset(startX + dashWidth, center.height - 100),
        paint
          ..color = Colors.yellow
          ..strokeWidth = 5,
      );
      startX += dashWidth + dashSpace;
    }

    // the middle horizontal blue line

    startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, center.height),
        Offset(startX + dashWidth, center.height),
        paint
          ..color = Colors.blue
          ..strokeWidth = 5,
      );
      startX += dashWidth + dashSpace;
    }

    // the lower horizontal yellow line

    startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, center.height + 100),
        Offset(startX + dashWidth, center.height + 100),
        paint
          ..color = Colors.yellow
          ..strokeWidth = 5,
      );
      startX += dashWidth + dashSpace;
    }

    // the middle vertical blue line

    startY = 100;

    while (startY < size.height - 100) {
      canvas.drawLine(
        Offset(center.width, startY),
        Offset(center.width, startY + dashHeight),
        paint
          ..color = Colors.blue
          ..strokeWidth = 5,
      );
      startY += dashHeight + dashSpace;
    }

    // the horizontal yellow box

    canvas.drawLine(
      Offset(center.width + 30, center.height - 50),
      Offset(center.width + 100, center.height - 50),
      paint
        ..color = Colors.yellow
        ..strokeWidth = 15
        ..strokeCap = StrokeCap.round,
    );

    // the vertical yellow box

    canvas.drawLine(
      Offset(center.width + 100, center.height + 10),
      Offset(center.width + 100, center.height + 90),
      paint
        ..color = Colors.yellow
        ..strokeWidth = 15
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
