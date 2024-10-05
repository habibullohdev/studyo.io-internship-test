import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inactiveColor;

  ProgressPainter({
    required this.currentStep,
    required this.totalSteps,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final segmentWidth = size.width / totalSteps;

    for (int i = 0; i < totalSteps; i++) {
      paint.color = i < currentStep ? activeColor : inactiveColor;

      final rect = Rect.fromLTWH(
        i * segmentWidth,
        0,
        segmentWidth,
        size.height,
      );

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
