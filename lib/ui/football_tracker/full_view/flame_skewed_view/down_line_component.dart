import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import '../../../shared/util.dart';
import '../../minimized_view/flame_skewed_view/distance_between_rectangle_component.dart';

class DownLineComponent extends PositionComponent with HasPaint, HasGameRef {
  DownLineComponent._(
    this.downLinePaint,
    this.yardline,
    this.isStartDownLine,
    this.distanceBetween,
    this.isPersisting,
  );

  final Paint downLinePaint;
  final double yardline;
  final double? distanceBetween;
  final bool isStartDownLine;
  final bool isPersisting;

  factory DownLineComponent.start({
    required GameTrackerSkin skin,
    required double yardline,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    double? distanceBetween,
    bool isPersisting = false,
  }) {
    /// style of the yardline line, e.g. color, width, opacity
    Paint paint = Paint()..color = skin.colors.scrimmage.withOpacity(0);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    DownLineComponent downLine = DownLineComponent._(
        paint, yardline, true, distanceBetween, isPersisting);

    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    downLine.x = convertYardLineToWidth(yardline) * screenWidth;
    downLine.y = kYardLineTopPadding;
    downLine.height = screenHeight *
        (screenWidth < kSmallerScreenWidth
            ? kFootballYardLineHeightFactorSmall
            : kFootballYardLineHeightFactor);

    return downLine;
  }

  factory DownLineComponent.end({
    required GameTrackerSkin skin,
    required double yardline,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    bool isPersisting = false,
  }) {
    /// style of the yardline line, e.g. color, width, opacity
    Paint paint = Paint()..color = skin.colors.attention.withOpacity(0);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    DownLineComponent downLine =
        DownLineComponent._(paint, yardline, false, null, isPersisting);

    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    downLine.x = convertYardLineToWidth(yardline) * screenWidth;
    downLine.y = kYardLineTopPadding;
    downLine.height = screenHeight *
        (screenWidth < kSmallerScreenWidth
            ? kFootballYardLineHeightFactorSmall
            : kFootballYardLineHeightFactor);

    return downLine;
  }

  @override
  void onLoad() {
    paint = downLinePaint;
    priority = 1;

    if (isStartDownLine && distanceBetween != null) {
      add(DistanceBetweenRectangleComponent(
          distanceBetween: distanceBetween, isPersisting: isPersisting));
    }

    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    /// automatically fade the DownLine to 50% opacity after 2 seconds
    if (!isPersisting) {
      add(OpacityEffect.to(
          0.5, DelayedEffectController(LinearEffectController(1.2), delay: 2)));

      add(OpacityEffect.fadeOut(DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kDownLineDelay))
        ..onComplete = () {
          removeFromParent();
        });
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawLine(const Offset(0, 0), Offset(0, height), paint);
  }
}
