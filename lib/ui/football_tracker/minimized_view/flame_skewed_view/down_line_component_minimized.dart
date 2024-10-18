import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/distance_between_rectangle_component.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class DownLineComponentMinimized extends PositionComponent with HasPaint {
  factory DownLineComponentMinimized.start({
    required GameTrackerSkin skin,
    required double yardline,
    required HomeOrAway side,
    required double screenWidth,
    double? distanceBetween,
    bool? isHomePossession,
    bool isEnd = false,
  }) {
    /// style of the yardline line, e.g. color, width, opacity
    final Paint paint = Paint()
      ..color = skin.colors.scrimmage.withOpacity(0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final DownLineComponentMinimized downLine = DownLineComponentMinimized._(
      paint,
      yardline,
      true,
      distanceBetween,
      isHomePossession,
      side,
      isEnd,
    )..x = getXPositionMinimized(yardline.toInt(), side, screenWidth);

    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;
    return downLine;
  }

  factory DownLineComponentMinimized.end({
    required GameTrackerSkin skin,
    required double yardline,
    required HomeOrAway side,
    required double screenWidth,
    bool isEnd = false,
  }) {
    /// style of the yardline line, e.g. color, width, opacity
    final Paint paint = Paint()
      ..color = skin.colors.attention.withOpacity(0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final DownLineComponentMinimized downLine = DownLineComponentMinimized._(
      paint,
      yardline,
      false,
      null,
      null,
      side,
      isEnd,
    )..x = getXPositionMinimized(yardline.toInt(), side, screenWidth);

    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;
    return downLine;
  }
  DownLineComponentMinimized._(
    this.downLinePaint,
    this.yardline,
    this.isStartDownLine,
    this.distanceBetween,
    this.isHomePossession,
    this.side,
    this.isEnd,
  );

  final Paint downLinePaint;
  final double yardline;
  final double? distanceBetween;
  final bool? isHomePossession;
  final bool isStartDownLine;
  final HomeOrAway side;
  final bool isEnd;

  @override
  void onLoad() {
    height = kFootballTrackerMinimizedHeight;
    paint = downLinePaint;
    priority = 1;

    if (isStartDownLine && distanceBetween != null) {
      add(
        DistanceBetweenRectangleComponent(
          distanceBetween: distanceBetween,
          isPersisting: isEnd,
          isHomePossession: isHomePossession ?? false,
        ),
      );
    }

    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    /// automatically fade the DownLine to 50% opacity after 2 seconds
    if (!isEnd) {
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
