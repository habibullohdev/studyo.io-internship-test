import 'package:flutter/material.dart';
import 'grid_painter.dart';

class CustomGrid extends StatelessWidget {
  final int xDivisions;
  final int yDivisions;
  final int squareClickedCount;
  final List<List<Color>> gridColors;
  final void Function(int) changeClickedHandler;

  const CustomGrid({
    super.key,
    required this.xDivisions,
    required this.yDivisions,
    required this.squareClickedCount,
    required this.changeClickedHandler,
    required this.gridColors,
  });

  void handleSquareTap(Offset position, Size size) {
    double cellWidth = size.width / xDivisions;
    double cellHeight = size.height / yDivisions;

    int col = (position.dx / cellWidth).floor();
    int row = (position.dy / cellHeight).floor();

    if (gridColors[row][col] == Colors.grey) {
      gridColors[row][col] = Colors.green;
      changeClickedHandler(squareClickedCount + 1);
    } else if (gridColors[row][col] == Colors.green) {
      gridColors[row][col] = Colors.grey;
      changeClickedHandler(squareClickedCount - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapUp: (details) {
            handleSquareTap(details.localPosition, constraints.biggest);
          },
          child: CustomPaint(
            size: Size.square(constraints.maxWidth),
            painter: GridPainter(
              xDivisions: xDivisions,
              yDivisions: yDivisions,
              gridColors: gridColors,
            ),
          ),
        );
      },
    );
  }
}
