import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/arrow_head_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/triangle_component.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class SolidArcComponent extends PositionComponent
    with HasPaint, HasGameRef, Completable {
  factory SolidArcComponent({
    required GameTrackerSkin skin,
    required double yardline,
    required HomeOrAway side,
    required HomeOrAway possession,
    double? driveComponentHeight,
  }) {
    final triangle = TriangleComponent();

    return SolidArcComponent._(
      skin: skin,
      yardline: yardline,
      side: side,
      possession: possession,
      arcHead: triangle,
      driveComponentHeight: driveComponentHeight,
    );
  }

  factory SolidArcComponent.cross({
    required GameTrackerSkin skin,
    required double yardline,
    required HomeOrAway side,
    required HomeOrAway possession,
    required double distance,
    required double screenWidth,
    double? driveComponentHeight,
  }) {
    final head = ArrowHeadComponent.cross(
      skin: skin,
      distance: distance,
      screenWidth: screenWidth,
    );

    return SolidArcComponent._(
      skin: skin,
      yardline: yardline,
      side: side,
      possession: possession,
      arcHead: head,
      driveComponentHeight: driveComponentHeight,
    );
  }
  SolidArcComponent._({
    required this.skin,
    required this.yardline,
    required this.side,
    required this.possession,
    required this.arcHead,
    this.driveComponentHeight,
  });

  final GameTrackerSkin skin;
  final double yardline;
  final HomeOrAway side;
  final HomeOrAway possession;
  final PositionComponent arcHead;
  final double? driveComponentHeight;

  @override
  void onLoad() {
    super.onLoad();

    final screenHeight = gameRef.size.y;
    final screenWidth = gameRef.size.x;

    if (possession == HomeOrAway.away) {
      flipHorizontally();
    }

    paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    /// when the side is on home we use the difference between 100 and distance
    final newYardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(newYardline) * screenWidth;

    /// minus/plus the radius of the circle
    /// so the Component start from yardline mark
    /// `side` and `possession` are not on the same side
    if (side == HomeOrAway.home) {
      x += (side != possession)
          ? 2 * kCircleComponentRadius
          : -2 * kCircleComponentRadius;
    } else {
      x += (side != possession)
          ? -2 * kCircleComponentRadius
          : 2 * kCircleComponentRadius;
    }

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight! >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        y = driveComponentHeight! + kComponentMoveUpDistance + 6;
      } else {
        y = screenHeight * kArrowPathHeightFactor;

        /// stack the components below past incidents
        add(
          MoveToEffect(
            Vector2(
              x,
              driveComponentHeight! +
                  kComponentMoveUpDistance +
                  kComponentBottomPadding,
            ),
            DelayedEffectController(
              LinearEffectController(kFadeOutSpeed),
              delay: kRushOrPassLineDelay,
            ),
          ),
        );
      }
    }

    y += 40;

    final circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = skin.colors.grey1.withOpacity(1);

    final circle = CircleComponent(
      radius: kCircleComponentRadius,
      paint: circlePaint,
      priority: 10,
    )..x = 2;

    final solidArc = _SolidArc(
      yardline: newYardline,
      screenWidth: screenWidth,
      possession: possession,
      paint: paint,
    );

    final arcWidthFactor = _setArcWidthFactor(newYardline);
    final yardlineOnField =
        possession == HomeOrAway.away ? 120 - newYardline : newYardline + 20;

    arcHead

      /// move triangle arrow to end of arc on x axis
      /// width of the full arc * 0.5 (only half of arc) * arcFactor + move left triangle width
      ..x = -(yardlineOnField / 120) * screenWidth * 0.5 * arcWidthFactor + 8

      /// move triangle arrow to end of arc on y axis
      ..y = -kSolidArcHeight / 2 - kCircleComponentRadius

      ///rotate component clockwise for 90 degrees
      ..angle = (math.pi / 180) * 90;

    final components = [circle, solidArc, arcHead];

    addAll(components);

    add(
      OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed))
        ..onComplete = complete,
    );
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

class _SolidArc extends PositionComponent with HasPaint {
  _SolidArc({
    required this.yardline,
    required this.screenWidth,
    required this.possession,
    required Paint paint,
  }) {
    /// style of the yard line, e.g. color, width, opacity
    this.paint = paint;

    paint.style = PaintingStyle.stroke;

    paint.strokeWidth = 2;

    /// the way the arc is draw in `path_drawing` the arc needs to be flipped
    flipHorizontally();
  }
  final double yardline;
  final double screenWidth;
  final HomeOrAway possession;

  double get arcWidthFactor => _setArcWidthFactor(yardline);

  /// when away team has possession use the rest of the field yard line (120 - yardline) to calculate the arc width
  /// when home team has possession add the endzones yards (20) to the yardline
  double get yardlineOnField =>
      possession == HomeOrAway.away ? 120 - yardline : yardline + 20;

  @override
  void render(Canvas canvas) {
    canvas.drawArc(
      /// the width of the arc will be determined by the start of play to the edge of endzone
      /// -white dot radius and -arc height / 2
      Rect.fromLTWH(
        -kCircleComponentRadius * 2,
        -kSolidArcHeight / 2,

        /// minus one here so the solid arc won't get clipped beyond field
        ((yardlineOnField - 1) / 120) * screenWidth * arcWidthFactor,
        kSolidArcHeight,
      ),

      /// The startAngle is the location on the oval that the line starts drawing from.
      /// An angle of 0 is at the right side. Angles are in radians, not degrees.
      /// The top is at 3π/2 (or -π/2), the left at π, and the bottom at π/2.
      -math.pi,

      /// The sweepAngle is how much of the oval is included in the arc.
      /// A value of 2π would draw the entire oval.
      math.pi / 2,

      /// useCenter: true will set the arc to form a circle
      false,
      paint,
    );
  }
}

double _setArcWidthFactor(double yardline) {
  final double formattedYardline = yardline > 50 ? 100 - yardline : yardline;

  if (formattedYardline >= 30) {
    return kLargeArcWidthFactor;
  } else if (formattedYardline >= 10) {
    return kMediumArcWidthFactor;
  } else {
    return kSmallArcWidthFactor;
  }
}
