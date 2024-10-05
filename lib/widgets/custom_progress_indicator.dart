import 'package:flutter/material.dart';
import 'package:learn_grid/widgets/indicator_painter.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inactiveColor;
  final double height;

  const CustomProgressIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.height = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: ProgressPainter(
          currentStep: currentStep,
          totalSteps: totalSteps,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        size: Size.infinite,
      ),
    );
  }
}
