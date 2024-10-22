import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:path_drawing/path_drawing.dart';

class DashedDoubleArcComponent extends PositionComponent
    with HasPaint, Completable, HasGameRef {
  DashedDoubleArcComponent({
    required this.color,
    required this.netYards,
    this.driveComponentHeight,
    this.autoRemove = false,
  });

  factory DashedDoubleArcComponent.regular({
    required GameTrackerSkin skin,
    required double yardline,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
    required double netYards,
    bool autoRemove = false,
  }) {
    final doubleArcWidth = convertYardsToWidth(10) * screenWidth;

    final paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    final isHomeSide = side == HomeOrAway.home;

    /// when the side is on home we use the difference between 100 and distance
    yardline = isHomeSide ? 100 - yardline : yardline;

    final component = DashedDoubleArcComponent(
      color: paint.color,
      netYards: netYards,
      autoRemove: autoRemove,
    )

      /// minus 10 distance because we wanna the double arc end at the yard line
      ..x = convertYardLineToWidth(yardline) * screenWidth
      ..y = screenHeight * kPassLineHeightFactor;

    final startDot = CircleComponent(
      radius: kCircleComponentRadius,
      paint: paint,
      priority: 10,
    )
      ..x = doubleArcWidth
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    component.add(startDot);

    /// when netYards is positive it means possession team got the ball and gained yards
    if (netYards >= 0) {
      if (possession == HomeOrAway.home) {
        component.flipHorizontally();
      }
    }

    /// when netYards is negative it means possession team lost the ball and loses yards
    if (netYards.isNegative) {
      if (possession == HomeOrAway.away) {
        component.flipHorizontally();
      }
    }
    return component;
  }

  factory DashedDoubleArcComponent.fumble({
    required GameTrackerSkin skin,
    required double yardline,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required double netYards,
    bool shouldMoveUp = true,
    double? driveComponentHeight,
    double? delay,
    Paint? paint,
  }) {
    final doubleArcYardline = convertYardsToWidth(netYards) * screenWidth;

    paint ??= Paint()..color = skin.colors.negative.withOpacity(0);

    final isHomeSide = side == HomeOrAway.home;

    /// when the side is on home we use the difference between 100 and distance
    yardline = isHomeSide ? 100 - yardline : yardline;

    final component = DashedDoubleArcComponent(
      netYards: netYards,
      color: paint.color,
      driveComponentHeight: driveComponentHeight,
    )
      ..x = convertYardLineToWidth(yardline) * screenWidth
      ..x += isHomeSide ? doubleArcYardline : -doubleArcYardline;

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        component.y = driveComponentHeight + kComponentMoveUpDistance + 6;
      } else {
        component.y = screenHeight * kPassLineHeightFactor;

        /// stack the components below past incidents
        if (shouldMoveUp) {
          component.add(
            MoveToEffect(
              Vector2(
                component.x,
                driveComponentHeight + kComponentMoveUpDistance,
              ),
              DelayedEffectController(
                LinearEffectController(kFadeOutSpeed),
                delay: delay ?? kRushOrPassLineDelay,
              ),
            ),
          );
        }
      }
    }

    final startDot = CircleComponent(
      radius: kCircleComponentRadius,
      paint: paint,
      priority: 10,
    )
      ..x = doubleArcYardline
      ..add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    component.add(startDot);

    if (side == HomeOrAway.home) {
      component.flipHorizontally();
    }

    return component;
  }

  factory DashedDoubleArcComponent.combo({
    required GameTrackerSkin skin,
    required double yardline,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required double netYards,
    bool autoRemove = false,
    double? driveComponentHeight,
  }) {
    final isHomeSide = side == HomeOrAway.home;

    /// when the side is on home we use the difference between 100 and distance
    yardline = isHomeSide ? 100 - yardline : yardline;

    final paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    final component = DashedDoubleArcComponent(
      netYards: netYards,
      color: paint.color,
      autoRemove: autoRemove,
    )

      /// minus 10 distance because we wanna the double arc end at the yard line
      ..x = convertYardLineToWidth(yardline) * screenWidth;

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        component.y = driveComponentHeight + kComponentMoveUpDistance + 6;
      } else {
        component
          ..y = screenHeight * kPassLineHeightFactor

          /// stack the components below past incidents
          ..add(
            MoveToEffect(
              Vector2(
                component.x,
                driveComponentHeight + kComponentMoveUpDistance,
              ),
              DelayedEffectController(
                LinearEffectController(kFadeOutSpeed),
                delay: kRushOrPassLineDelay,
              ),
            ),
          );
      }
    }

    return component;
  }
  final double? driveComponentHeight;
  final Color color;
  final double netYards;
  final bool autoRemove;

  @override
  void onLoad() {
    final screenWidth = gameRef.size.x;

    add(
      OpacityEffect.to(
        kFadeOutFactorWithMoveUp,
        DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kRushOrPassLineDelay,
        ),
      ),
    );

    add(
      _DoubleDashedArc(
        color: color,
        screenWidth: screenWidth,
        netYards: netYards,
      )..add(
          OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))
            ..onComplete = complete,
        ),
    );

    if (autoRemove) {
      add(
        OpacityEffect.fadeOut(
          DelayedEffectController(
            LinearEffectController(kFadeOutSpeed),
            delay: kPlayStartArrowDelay,
          ),
        )..onComplete = () {
            complete();
            removeFromParent();
          },
      );
    }
  }

  @override
  void render(Canvas canvas) {
    invertSkewedView(canvas);

    canvas
      ..save()
      ..clipRect(Rect.fromLTWH(0, 0, width, height))
      ..restore();
  }
}

class _DoubleDashedArc extends PositionComponent with HasPaint {
  _DoubleDashedArc({
    required Color color,
    required this.screenWidth,
    required this.netYards,
  }) {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()..color = color;

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
  }
  final double screenWidth;
  final double netYards;

  double get pathStartingPointX =>
      netYards.isNegative ? kCircleComponentRadius : -kCircleComponentRadius;

  double get arcWidth => (5 / 120) * screenWidth;

  @override
  void render(Canvas canvas) {
    canvas
      ..drawPath(
        dashPath(
          Path()

            /// negative 2 because CircleComponent radius
            ..moveTo(pathStartingPointX, 0)
            ..arcToPoint(
              Offset(arcWidth, 0),

              /// ellipse width and height
              radius: const Radius.elliptical(6, 8),
            ),
          dashArray: CircularIntervalList<double>(
            /// dashSize, gap gapSize
            <double>[6, 4],
          ),
        ),
        paint,
      )

      /// plus CircleComponent radius 2
      ..translate(arcWidth - pathStartingPointX, 0)
      ..drawPath(
        dashPath(
          Path()

            /// minus 2 because CircleComponent radius
            ..moveTo(pathStartingPointX, 0)
            ..arcToPoint(
              Offset(arcWidth, 0),

              /// ellipse width and height
              radius: const Radius.elliptical(6, 4),
            ),
          dashArray: CircularIntervalList<double>(
            /// dashSize, gap gapSize
            <double>[6, 4],
          ),
        ),
        paint,
      );
  }
}
