import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class CrossComponent extends PositionComponent
    with HasPaint, HasGameRef, Completable {
  CrossComponent({
    required this.skin,
    required this.side,
    required this.yardline,
    this.driveComponentHeight,
    this.autoRemove = false,
  });
  final GameTrackerSkin skin;
  final HomeOrAway side;
  final double yardline;
  final double? driveComponentHeight;
  final bool autoRemove;

  @override
  void onLoad() {
    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    paint
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final yardlineToUse = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardlineToUse) * screenWidth;

    if (driveComponentHeight != null) {
      /// when past incidents didn't fill up the screen
      if (driveComponentHeight! >=
          screenHeight * kDriveComponentMaxHeightFactor) {
        /// when past incidents filled up the screen
        y = driveComponentHeight! + kComponentMoveUpDistance + 6;
      } else {
        y = screenHeight * kArrowPathHeightFactor +
            kPassArrowHeight / 2 -
            (kCircleComponentRadius * 2);

        /// stack the components below past incidents
        add(
          MoveToEffect(
            Vector2(x, driveComponentHeight! + kComponentMoveUpDistance),
            DelayedEffectController(
              LinearEffectController(kFadeOutSpeed),
              delay: kRushOrPassLineDelay,
            ),
          ),
        );
      }
    }

    add(
      OpacityEffect.fadeIn(LinearEffectController(0.5))..onComplete = complete,
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
      ..drawLine(Offset.zero, const Offset(8, 8), paint)
      ..drawLine(const Offset(0, 8), const Offset(8, 0), paint)
      ..restore();
  }
}
