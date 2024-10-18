import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import '../../../shared/enums.dart';
import '../../../shared/util.dart';
import 'triangle_component.dart';

class ArrowHeadComponent extends PositionComponent with HasPaint {
  ArrowHeadComponent() {
    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));
  }

  factory ArrowHeadComponent.circle({
    required Paint paint,
    required double distance,
    required double screenWidth,
  }) {
    final component = ArrowHeadComponent();

    component.add(CircleComponent(
        radius: kCircleComponentRadius, paint: paint, priority: 10)
      ..x = -convertYardsToWidth(distance) * screenWidth);

    return component;
  }

  factory ArrowHeadComponent.arrow(
      {required Paint paint,
      required double distance,
      required double screenWidth,
      ArrowDirection? arrowDirection}) {
    final component = ArrowHeadComponent();

    component.add(
        TriangleComponent(arrowDirection: arrowDirection, arrowPaint: paint)
          ..x = -convertYardsToWidth(distance) * screenWidth);

    return component;
  }

  factory ArrowHeadComponent.cross({
    required GameTrackerSkin skin,
    required double distance,
    required double screenWidth,
  }) {
    final component = ArrowHeadComponent();

    component.add(_CrossLineComponent(skin: skin)
      ..x = -(convertYardsToWidth(distance) * screenWidth + 1)
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))));

    return component;
  }
}

class _CrossLineComponent extends PositionComponent with HasPaint {
  _CrossLineComponent({required GameTrackerSkin skin}) {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 1.5;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawLine(const Offset(0, 0), const Offset(2 * 2, 2 * 2), paint);

    canvas.drawLine(const Offset(0, 2 * 2), const Offset(2 * 2, 0), paint);
  }
}
