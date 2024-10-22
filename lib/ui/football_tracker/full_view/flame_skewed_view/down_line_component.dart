import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/distance_between_rectangle_component.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class DownLineComponent extends PositionComponent with HasPaint, HasGameRef {
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
    final Paint paint = Paint()
      ..color = skin.colors.scrimmage.withOpacity(0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final DownLineComponent downLine = DownLineComponent._(
      paint,
      yardline,
      true,
      distanceBetween,
      isPersisting,
    );

    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    downLine
      ..x = convertYardLineToWidth(yardline) * screenWidth
      ..y = kYardLineTopPadding
      ..height = screenHeight *
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
    final Paint paint = Paint()
      ..color = skin.colors.attention.withOpacity(0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final DownLineComponent downLine =
        DownLineComponent._(paint, yardline, false, null, isPersisting);

    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    downLine
      ..x = convertYardLineToWidth(yardline) * screenWidth
      ..y = kYardLineTopPadding
      ..height = screenHeight *
          (screenWidth < kSmallerScreenWidth
              ? kFootballYardLineHeightFactorSmall
              : kFootballYardLineHeightFactor);

    return downLine;
  }
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

  @override
  void onLoad() {
    paint = downLinePaint;
    priority = 1;

    if (isStartDownLine && distanceBetween != null) {
      add(
        DistanceBetweenRectangleComponent(
          distanceBetween: distanceBetween,
          isPersisting: isPersisting,
        ),
      );
    }

    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    /// automatically fade the DownLine to 50% opacity after 2 seconds
    if (!isPersisting) {
      add(
        OpacityEffect.to(
          0.5,
          DelayedEffectController(LinearEffectController(1.2), delay: 2),
        ),
      );

      add(
        OpacityEffect.fadeOut(
          DelayedEffectController(
            LinearEffectController(kFadeOutSpeed),
            delay: kDownLineDelay,
          ),
        )..onComplete = removeFromParent,
      );
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawLine(Offset.zero, Offset(0, height), paint);
  }
}
