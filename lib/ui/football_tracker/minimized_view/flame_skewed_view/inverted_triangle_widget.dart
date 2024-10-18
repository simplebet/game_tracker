import 'package:flutter/material.dart';

class InvertedTriangleWidget extends StatelessWidget {
  const InvertedTriangleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrianglePainter(),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  _TrianglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(15.5, 0)
      ..lineTo(0, 20)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
