import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

import '../../../shared/enums.dart';

final pointLeftTriangle = [
  Vector2(6, -1),
  Vector2(-1, 2),
  Vector2(6, 5),
];
final pointRightTriangle = [
  Vector2(0, -1),
  Vector2(6, 2),
  Vector2(0, 5),
];

final pointDefaultTriangle = [
  Vector2(-1, -2),
  Vector2(5, -2),
  Vector2(2, 4),
];

class TriangleComponent extends PositionComponent with HasPaint {
  TriangleComponent({this.arrowDirection, this.arrowPaint}) {
    paint = arrowPaint ?? BasicPalette.white.paint();
  }

  final ArrowDirection? arrowDirection;
  Paint? arrowPaint;

  @override
  void onLoad() {
    super.onLoad();

    if (arrowDirection == null) {
      add(PolygonComponent(pointDefaultTriangle, paint: paint));
      return;
    }

    switch (arrowDirection) {
      case ArrowDirection.left:
        add(PolygonComponent(pointLeftTriangle, paint: paint));
      case ArrowDirection.right:
        add(PolygonComponent(pointRightTriangle, paint: paint));
      default:
        add(PolygonComponent(pointDefaultTriangle, paint: paint));
    }
  }
}
