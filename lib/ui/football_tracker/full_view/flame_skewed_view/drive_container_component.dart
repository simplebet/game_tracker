import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DriveContainerComponent extends PositionComponent with HasGameRef {
  @override
  void onLoad() {
    priority = 10;
  }

  @override
  void renderTree(Canvas canvas) {
    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    canvas
      ..save()
      ..clipRect(Rect.fromLTRB(0, 0, screenWidth, screenHeight));
    super.renderTree(canvas);
    canvas.restore();
  }
}
