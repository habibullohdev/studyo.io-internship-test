import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final int xDivisions;
  final int yDivisions;
  final List<List<Color>> gridColors;

  GridPainter({
    required this.xDivisions,
    required this.yDivisions,
    required this.gridColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / xDivisions;
    double cellHeight = size.height / yDivisions;

    Paint paint = Paint();

    for (var i = 0; i < yDivisions; i++) {
      for (var j = 0; j < xDivisions; j++) {
        double left = j * cellWidth;
        double top = i * cellHeight;

        Rect rect = Rect.fromLTWH(left, top, cellWidth, cellHeight);

        paint
          ..color = gridColors[i][j]
          ..style = PaintingStyle.fill;
        canvas.drawRect(rect, paint);

        paint
          ..color = const Color.fromARGB(249, 75, 75, 75)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.gridColors != gridColors;
  }
}
