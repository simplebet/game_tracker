import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/opacity_text_component.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class ArrowPathComponent extends PositionComponent
    with Completable, HasGameRef {
  ArrowPathComponent({
    required this.skin,
    required this.yardline,
    required this.playDistance,
    required this.side,
    required this.possession,
    required this.rushOrPass,
  });

  final GameTrackerSkin skin;
  final double yardline;
  final double playDistance;
  final HomeOrAway side;
  final HomeOrAway possession;
  final RushOrPass rushOrPass;

  @override
  void onLoad() {
    /// use the opposite HomeOrAway to flip the arrow when it's loss yards
    final $possession =
        playDistance.isNegative ? possession.opposite : possession;

    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    final head = _ArrowPathHead(
      skin: skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline,
      distance: playDistance,
      side: side,
      possession: $possession,
      rushOrPass: rushOrPass,
    );

    final body = _ArrowPathBody(
      skin: skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline,
      distance: playDistance,
      side: side,
      possession: $possession,
    );

    add(head);
    add(body);

    priority = 11;

    head.add(
      OpacityEffect.fadeOut(
        DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kRushOrPassLineDelay,
        ),
      )..onComplete = () {
          complete();
          remove(head);
          removeFromParent();
        },
    );
    body.add(
      OpacityEffect.fadeOut(
        DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kRushOrPassLineDelay,
        ),
      )..onComplete = () => remove(body),
    );
  }
}

class _ArrowPathHead extends PositionComponent with HasPaint {
  _ArrowPathHead({
    required GameTrackerSkin skin,
    required double yardline,
    required double distance,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
    RushOrPass rushOrPass = RushOrPass.pass,
  }) {
    paint = Paint()..color = skin.colors.grey5.withOpacity(0);

    paint.style = PaintingStyle.fill;

    /// when the side is on home we use the difference between 100 and distance
    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardline) * screenWidth;

    final isAwayPossession = possession == HomeOrAway.away;

    x = isAwayPossession
        ? x - kPassArrowSwipeDistance
        : x + kPassArrowSwipeDistance;

    if (distance.isNegative) {
      if (possession == HomeOrAway.home) {
        x += 10;
      } else {
        x -= 10;
      }
    }

    y = screenHeight * kArrowPathHeightFactor;

    priority = 1;

    final textComponent = OpacityTextComponent(
      text: '${distance.toInt()} yd ${rushOrPass.name}'.toUpperCase(),
      textRenderer: TextPaint(
        style: skin.textStyles.body5Thick
            .copyWith(color: skin.colors.grey1.withOpacity(1)),
      ),
    )
      ..scale = Vector2.all(1.5)
      ..x = kPassArrowHeadWidth
      ..y = kPassArrowHeight / 3;

    if (isAwayPossession) {
      flipHorizontally();
      textComponent.flipHorizontallyAroundCenter();
    }

    add(textComponent);

    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    add(
      MoveByEffect(
        Vector2(
          isAwayPossession ? kPassArrowSwipeDistance : -kPassArrowSwipeDistance,
          0,
        ),
        LinearEffectController(kFadeOutSpeed),
      ),
    );

    textComponent.add(
      OpacityEffect.fadeOut(
        DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kRushOrPassLineDelay,
        ),
      )..onComplete = () {
          removeFromParent();
          remove(textComponent);
        },
    );
  }

  @override
  void render(Canvas canvas) {
    final path = Path()
      ..moveTo(kPassArrowHeadWidth, 0)
      ..lineTo(kPassArrowHeadWidth, kPassArrowHeight)
      ..lineTo(0, kPassArrowHeight / 2)
      ..close();
    canvas.drawPath(path, paint);
  }
}

class _ArrowPathBody extends PositionComponent with HasPaint {
  _ArrowPathBody({
    required GameTrackerSkin skin,
    required double yardline,
    required double distance,
    required double screenWidth,
    required double screenHeight,
    required HomeOrAway side,
    required HomeOrAway possession,
  }) {
    paint = Paint()..color = skin.colors.grey5.withOpacity(0);

    paint.style = PaintingStyle.fill;

    /// when the side is on home we use the difference between 100 and distance
    yardline = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardline) * screenWidth;

    final isAwayPossession = possession == HomeOrAway.away;

    x = isAwayPossession
        ? x - (kPassArrowHeadWidth + kPassArrowSwipeDistance)
        : x + (kPassArrowHeadWidth + kPassArrowSwipeDistance);

    /// move arrow accordingly when it's negative net yards
    if (distance.isNegative) {
      if (possession == HomeOrAway.home) {
        x += 10;
      } else {
        x -= 10;
      }
    }

    y = screenHeight * kArrowPathHeightFactor;

    add(OpacityEffect.fadeIn(LinearEffectController(kFadeInSpeed)));

    add(
      MoveByEffect(
        Vector2(
          isAwayPossession ? kPassArrowSwipeDistance : -kPassArrowSwipeDistance,
          0,
        ),
        LinearEffectController(kFadeOutSpeed),
      ),
    );

    final isTwoDigits = distance >= 10.0 || distance.isNegative;

    add(
      ScaleEffect.by(
        Vector2(isTwoDigits ? 5.5 : 5, 1),
        LinearEffectController(kArrowPathFadeOutSpeed),
      ),
    );

    if (isAwayPossession) {
      flipHorizontally();
    }
  }

  @override
  void render(Canvas canvas) {
    final path = Path()
      ..lineTo(kPassArrowWidth, 0)
      ..lineTo(kPassArrowWidth, kPassArrowHeight)
      ..lineTo(0, kPassArrowHeight)
      ..close();
    canvas.drawPath(path, paint);
  }
}
