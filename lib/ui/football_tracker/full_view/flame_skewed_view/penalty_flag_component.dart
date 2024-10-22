import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class PenaltyFlagArrowComponent extends PositionComponent
    with HasPaint, Completable {
  PenaltyFlagArrowComponent({
    required this.skin,
    required this.screenWidth,
    required this.screenHeight,
    required this.side,
    required this.possession,
    required this.netYards,
    required this.yardline,
    this.driveComponentHeight,
  });
  late double length;

  double progress = 0;

  Path path = Path()..moveTo(0, 0);

  final GameTrackerSkin skin;
  final double screenWidth;
  final double screenHeight;
  final HomeOrAway side;
  final HomeOrAway possession;
  final double netYards;
  final double yardline;
  final double? driveComponentHeight;

  @override
  void update(double dt) {
    super.update(dt);

    /// use `progress` to keep track of `length`
    /// in order to animate arrow length
    if (progress <= length) {
      progress += 1;
    }

    /// animate the arrow line
    if (progress < length) {
      path.lineTo(progress, 0);
    } else if (progress >= length) {
      /// animate the arrow head
      path.lineTo(progress - 6, -8);
      complete();
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawPath(path, paint);
  }

  @override
  void onLoad() {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()..color = skin.colors.attention.withOpacity(1);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    /// when the side is on home we use the difference between 100 and distance
    final yardlineToUse = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardlineToUse) * screenWidth;

    length = (netYards.abs() / 120) * screenWidth;

    /// minus the arrow length so the arrow ends at the arrow head
    x += (possession == HomeOrAway.home ? length : -length);

    /// when it's home team possession flip the arrow
    if (possession == HomeOrAway.home) {
      flipHorizontally();
    }

    if (netYards.isNegative) {
      /// when it's negative that means team lost yards
      /// still follow the side but flip the possession of arrow head
      flipHorizontally();
      x += (possession == HomeOrAway.home ? -length * 2 : length * 2);
    }

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight! >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        y = driveComponentHeight! + kComponentMoveUpDistance + 6;
      } else {
        y = screenHeight * kPenaltyFlagHeightFactor;

        /// stack the components below past incidents
        add(
          MoveToEffect(
            Vector2(x, driveComponentHeight! + kPenaltyComponentMoveUpDistance),
            DelayedEffectController(
              LinearEffectController(kFadeOutSpeed),
              delay: kRushOrPassLineDelay,
            ),
          ),
        );
      }
    }
  }
}
