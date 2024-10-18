import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/palette.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/completable_mixin.dart';
import '../../../shared/constants.dart';
import '../../../shared/util.dart';
import 'arrow_head_component.dart';

class SolidLineComponent extends PositionComponent
    with HasPaint, Completable, HasGameRef {
  final double length;
  final Color color;
  final bool autoRemove;

  SolidLineComponent({
    required this.length,
    required this.color,
    this.autoRemove = false,
  });

  factory SolidLineComponent.regular({
    required GameTrackerSkin skin,
    required double yardline,
    required double distance,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
    ArrowHeadType arrowHeadType = ArrowHeadType.circle,
    double? driveComponentHeight,
    bool shouldMoveUp = true,
    bool autoRemove = false,
  }) {
    final loseYardsColor = skin.colors.negative.withOpacity(0);
    final gainYardsColor = skin.colors.grey1.withOpacity(0);
    final color = distance < 0 ? loseYardsColor : gainYardsColor;

    final paint = Paint()..color = color;

    /// when the side is on home we use the difference between 100 and distance
    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    final component = SolidLineComponent(
        color: color, length: distance, autoRemove: autoRemove);

    component.x = convertYardLineToWidth(yardline) * screenWidth;

    /// minus/plus the radius of the circle
    /// so the Component start from yardline mark
    if (side == HomeOrAway.home) {
      component.x += (side != possession)
          ? 2 * kCircleComponentRadius
          : -2 * kCircleComponentRadius;
    } else {
      component.x += (side != possession)
          ? -2 * kCircleComponentRadius
          : 2 * kCircleComponentRadius;
    }

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        component.y = driveComponentHeight + kComponentMoveUpDistance + 6;
      } else {
        component.y = screenHeight * kArrowPathHeightFactor +
            (kPassArrowHeight / 2) -
            kCircleComponentRadius;

        /// stack the components below past incidents
        if (shouldMoveUp) {
          component.add(MoveToEffect(
              Vector2(component.x, driveComponentHeight + 20),
              DelayedEffectController(LinearEffectController(kFadeOutSpeed),
                  delay: kComponentMoveUpDelay)));
        }
      }
    }

    final distanceArrowExtraSmall = arrowHeadType == ArrowHeadType.arrow &&
        (distance.abs() >= 0 && distance.abs() <= 1);

    if (arrowHeadType != ArrowHeadType.arrow || !distanceArrowExtraSmall) {
      component.add(CircleComponent(
          radius: kCircleComponentRadius, paint: paint, priority: 2)
        ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))));
    } else {
      component.add(CircleComponent(radius: 0.1, paint: paint, priority: 2)
        ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))));
    }

    if (arrowHeadType == ArrowHeadType.arrow) {
      var arrowDirection = ArrowDirection.left;
      if (distance < 0) {
        arrowDirection = ArrowDirection.right;
      }
      component.add(ArrowHeadComponent.arrow(
          paint: paint,
          distance: distance,
          screenWidth: screenWidth,
          arrowDirection: arrowDirection)..y = -0.5);
    } else {
      component.add(CircleComponent(
          radius: kCircleComponentRadius, paint: paint, priority: 2)
        ..x = -(distance / 120) * screenWidth);
    }

    if (possession == HomeOrAway.away) {
      component.flipHorizontally();
    }

    return component;
  }

  factory SolidLineComponent.combo({
    required GameTrackerSkin skin,
    required double yardline,
    required double distance,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
    double? driveComponentHeight,
    int bottomPadding = 16,
    int extraPaddingForMoveUpDistance = 0,
    bool shouldMoveUp = true,
    ArrowHeadType arrowHeadType = ArrowHeadType.circle,
  }) {
    final paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    /// when the side is on home we use the difference between 100 and distance
    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    final component = SolidLineComponent(
        color: paint.color, length: distance, autoRemove: false);

    component.x = convertYardLineToWidth(yardline) * screenWidth;

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        component.y = driveComponentHeight + kComponentMoveUpDistance + 6;
      } else {
        /// to position the line in the middle of the Arrow
        /// use the ArrowPath height + half of the height of the Arrow - the radius of the solid line dot
        component.y = screenHeight * kArrowPathHeightFactor +
            (kPassArrowHeight / 2) -
            kCircleComponentRadius;

        /// stack the components below past incidents
        if (shouldMoveUp) {
          component.add(MoveToEffect(
              Vector2(
                  component.x,
                  driveComponentHeight +
                      kComponentMoveUpDistance +
                      bottomPadding +
                      extraPaddingForMoveUpDistance),
              DelayedEffectController(LinearEffectController(kFadeOutSpeed),
                  delay: kRushOrPassLineDelay)));
        }
      }
    }

    component.y += bottomPadding;

    if (arrowHeadType == ArrowHeadType.arrow) {
      ArrowDirection arrowDirection = ArrowDirection.left;
      if (distance < 0) {
        arrowDirection = ArrowDirection.right;
      }
      component.add(ArrowHeadComponent.arrow(
          paint: BasicPalette.white.paint(),
          distance: distance,
          screenWidth: screenWidth,
          arrowDirection: arrowDirection));
    } else {
      component.add(CircleComponent(
          radius: kCircleComponentRadius, paint: paint, priority: 2)
        ..x = -convertYardsToWidth(distance) * screenWidth
        ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))));
    }

    if (possession == HomeOrAway.home) {
      component.flipHorizontally();
    }

    return component;
  }

  @override
  void onLoad() {
    final screenWidth = gameRef.size.x;

    add(_SolidLine(color: color, length: length, screenWidth: screenWidth)
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))
        ..onComplete = () {
          complete();
        }));

    if (autoRemove) {
      add(OpacityEffect.fadeOut(DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kPlayStartArrowDelay))
        ..onComplete = () {
          complete();
          removeFromParent();
        });
    }
  }

  @override
  void render(Canvas canvas) {
    invertSkewedView(canvas);

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, width, height));
    canvas.restore();
  }
}

class _SolidLine extends PositionComponent with HasPaint {
  final double length;
  final double screenWidth;

  _SolidLine({
    required Color color,
    required this.length,
    required this.screenWidth,
  }) {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()..color = color;

    paint.strokeWidth = 2;
  }

  @override
  void render(Canvas canvas) {
    /// 4 is the radius
    /// minus 8 because we don't wanna line to show beneath circle
    canvas.drawLine(
        const Offset(0, kCircleComponentRadius),
        Offset(-((length / 120) * screenWidth - 2 * kCircleComponentRadius),
            kCircleComponentRadius),
        paint);
  }
}
