import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:path_drawing/path_drawing.dart';

import '../../../shared/completable_mixin.dart';
import '../../../shared/constants.dart';
import '../../../shared/util.dart';
import 'arrow_head_component.dart';

class DashedArcComponent extends PositionComponent
    with HasPaint, Completable, HasGameRef {
  DashedArcComponent({
    required this.skin,
    required this.possession,
    required this.arcDistance,
    this.driveComponentHeight,
    this.autoRemove = false,
  });

  final HomeOrAway possession;
  final GameTrackerSkin skin;
  final double arcDistance;
  final double? driveComponentHeight;
  final bool autoRemove;

  factory DashedArcComponent.regular({
    required GameTrackerSkin skin,
    required double yardline,
    required double distance,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
    double? driveComponentHeight,
    double? delay,
    ArrowHeadType arrowHeadType = ArrowHeadType.circle,
    bool shouldMoveUp = true,
    bool autoRemove = false,
  }) {
    final paint = Paint()
      ..color = distance.isNegative
          ? skin.colors.negative.withOpacity(0)
          : skin.colors.grey1.withOpacity(0);

    final component = DashedArcComponent(
      skin: skin,
      possession: possession,
      arcDistance: distance,
      driveComponentHeight: driveComponentHeight,
      autoRemove: autoRemove,
    );

    /// when the side is on home we use the difference between 100 and distance
    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    /// minus/plus the radius of the circle
    /// so the Component start from yardline mark
    component.x = convertYardLineToWidth(yardline) * screenWidth;

    /// `side` and `possession` are not on the same side
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
        final moveUpDistance = distance >= kLargeDashedArcThreshold
            ? 54
            : kDashedArcComponentMoveUpDistance;

        component.y = screenHeight * kArrowPathHeightFactor +
            (kPassArrowHeight / 2) -
            kCircleComponentRadius;

        /// stack the components below past incidents
        if (shouldMoveUp) {
          component.add(MoveToEffect(
              Vector2(component.x, driveComponentHeight + moveUpDistance),
              DelayedEffectController(LinearEffectController(kFadeOutSpeed),
                  delay: delay ?? kComponentMoveUpDelay)));
        }
      }
    }

    final startDot = CircleComponent(
        radius: kCircleComponentRadius, paint: paint, priority: 10)
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    component.add(startDot);

    if (arrowHeadType == ArrowHeadType.circle) {
      component.add(ArrowHeadComponent.circle(
          paint: paint, distance: distance, screenWidth: screenWidth));
    } else if (arrowHeadType == ArrowHeadType.arrow) {
      if (distance.abs() > kSmallerArcThreshold) {
        component.add(ArrowHeadComponent.arrow(
            arrowDirection: ArrowDirection.down,
            paint: paint,
            distance: distance,
            screenWidth: screenWidth));
      } else {
        component.add(ArrowHeadComponent.arrow(
            paint: paint, distance: distance, screenWidth: screenWidth));
      }
    } else if (arrowHeadType == ArrowHeadType.cross) {
      component.add(ArrowHeadComponent.cross(
          skin: skin, distance: distance, screenWidth: screenWidth));
    }

    return component;
  }

  factory DashedArcComponent.combo({
    required GameTrackerSkin skin,
    required double yardline,
    required double distance,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
    bool shouldMoveUp = true,
    double? driveComponentHeight,
  }) {
    final paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    final component = DashedArcComponent(
        skin: skin,
        possession: possession,
        arcDistance: distance,
        autoRemove: false);

    /// when the side is on home we use the difference between 100 and distance
    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    component.x = convertYardLineToWidth(yardline) * screenWidth;

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        component.y = driveComponentHeight + kComponentMoveUpDistance + 6;
      } else {
        final moveUpDistance = distance >= kLargeDashedArcThreshold
            ? 54
            : kDashedArcComponentMoveUpDistance;

        component.y = screenHeight * kArrowPathHeightFactor +
            kPassArrowHeight / 2 -
            (kCircleComponentRadius * 2);

        /// stack the components below past incidents
        if (shouldMoveUp) {
          component.add(MoveToEffect(
              Vector2(component.x, driveComponentHeight + moveUpDistance),
              DelayedEffectController(LinearEffectController(kFadeOutSpeed),
                  delay: kRushOrPassLineDelay)));
        }
      }
    }

    final startDot = CircleComponent(
        radius: kCircleComponentRadius, paint: paint, priority: 10)
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    component.add(startDot);

    return component;
  }

  @override
  void onLoad() {
    final screenWidth = gameRef.size.x;

    final dashedArc = _DashArc(
        color: arcDistance.isNegative
            ? skin.colors.negative.withOpacity(0)
            : skin.colors.grey1.withOpacity(0),
        length: arcDistance,
        screenWidth: screenWidth)
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))
        ..onComplete = () => complete());

    add(dashedArc);

    if (possession == HomeOrAway.away) {
      flipHorizontally();
    }

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

class _DashArc extends PositionComponent with HasPaint {
  final double length;
  final double screenWidth;

  _DashArc(
      {required Color color, required this.length, required this.screenWidth}) {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()..color = color;

    paint.style = PaintingStyle.stroke;

    paint.strokeWidth = 2;

    /// the way the arc is draw in `path_drawing` the arc needs to be flipped
    if (!length.isNegative) {
      flipHorizontally();
    }
  }

  @override
  void render(Canvas canvas) {
    final bool isSmallerYards = length.abs() <= kSmallerArcThreshold;
    final Radius radius = isSmallerYards
        ? const Radius.elliptical(2, 2.5)
        : const Radius.elliptical(6, 2);

    canvas.drawPath(
      dashPath(
        Path()

          /// minus 2 because CircleComponent radius
          ..moveTo(kCircleComponentRadius * (length.isNegative ? 1 : -1), 0)
          ..arcToPoint(
            /// minus 2 because CircleComponent radius
            Offset(
                (length.abs() / 120) * screenWidth -
                    (kCircleComponentRadius * (length.isNegative ? -1 : 1)),
                -kCircleComponentRadius),

            /// ellipse width and height
            radius: radius,
          ),
        dashArray: CircularIntervalList<double>(
          /// dash is dashSize followed by a gap gapSize
          <double>[3.0, 1.8],
        ),
      ),
      paint,
    );
  }
}
