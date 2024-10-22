import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/triangle_component.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class ArrowHeadComponent extends PositionComponent with HasPaint {
  ArrowHeadComponent() {
    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));
  }

  factory ArrowHeadComponent.circle({
    required Paint paint,
    required double distance,
    required double screenWidth,
  }) {
    final component = ArrowHeadComponent()
      ..add(
        CircleComponent(
          radius: kCircleComponentRadius,
          paint: paint,
          priority: 10,
        )..x = -convertYardsToWidth(distance) * screenWidth,
      );

    return component;
  }

  factory ArrowHeadComponent.arrow({
    required Paint paint,
    required double distance,
    required double screenWidth,
    ArrowDirection? arrowDirection,
  }) {
    final component = ArrowHeadComponent()
      ..add(
        TriangleComponent(arrowDirection: arrowDirection, arrowPaint: paint)
          ..x = -convertYardsToWidth(distance) * screenWidth,
      );

    return component;
  }

  factory ArrowHeadComponent.cross({
    required GameTrackerSkin skin,
    required double distance,
    required double screenWidth,
  }) {
    final component = ArrowHeadComponent()
      ..add(
        _CrossLineComponent(skin: skin)
          ..x = -(convertYardsToWidth(distance) * screenWidth + 1)
          ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))),
      );

    return component;
  }
}

class _CrossLineComponent extends PositionComponent with HasPaint {
  _CrossLineComponent({required GameTrackerSkin skin}) {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()
      ..color = skin.colors.grey1.withOpacity(0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.5;
  }

  @override
  void render(Canvas canvas) {
    canvas
      ..drawLine(Offset.zero, const Offset(2 * 2, 2 * 2), paint)
      ..drawLine(const Offset(0, 2 * 2), const Offset(2 * 2, 0), paint);
  }
}
