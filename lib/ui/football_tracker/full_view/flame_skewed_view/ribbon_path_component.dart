import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/completable_mixin.dart';
import '../../../shared/constants.dart';
import '../../../shared/util.dart';
import 'opacity_text_component.dart';

enum RibbonPathType {
  regular,
  large,
}

class RibbonPathComponent extends PositionComponent
    with HasGameRef, Completable {
  RibbonPathComponent(
      {required this.skin,
      required this.text,
      required this.tailColor,
      required this.yardline,
      required this.side,
      required this.possession,
      this.type = RibbonPathType.regular});

  final GameTrackerSkin skin;
  final String text;
  final Color tailColor;
  final double yardline;
  final HomeOrAway side;
  final HomeOrAway possession;
  final RibbonPathType type;

  @override
  void onLoad() {
    super.onLoad();
    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    final head = _RibbonPathHead(
      skin: skin,
      text: text,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline,
      side: side,
      possession: possession,
    );

    final body = _RibbonPathBody(
        skin: skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: yardline,
        side: side,
        possession: possession,
        type: type);

    final tail = _RibbonPathTail(
        skin: skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: yardline,
        side: side,
        tailColor: tailColor,
        possession: possession,
        type: type);

    add(head);
    add(body);
    add(tail);

    head.add(OpacityEffect.fadeOut(DelayedEffectController(
        LinearEffectController(kFadeOutSpeed),
        delay: kPlayStartArrowDelay))
      ..onComplete = () {
        remove(head);
      });

    body.add(OpacityEffect.fadeOut(DelayedEffectController(
        LinearEffectController(kFadeOutSpeed),
        delay: kPlayStartArrowDelay))
      ..onComplete = () {
        remove(body);
      });

    tail.add(OpacityEffect.fadeOut(DelayedEffectController(
        LinearEffectController(kFadeOutSpeed),
        delay: kPlayStartArrowDelay))
      ..onComplete = () {
        complete();
        remove(tail);
        removeFromParent();
      });
  }
}

class _RibbonPathHead extends PositionComponent with HasPaint {
  final GameTrackerSkin skin;
  final String text;
  final double screenWidth;
  final double screenHeight;
  final double yardline;
  final HomeOrAway side;
  final HomeOrAway possession;

  _RibbonPathHead({
    required this.skin,
    required this.text,
    required this.screenWidth,
    required this.screenHeight,
    required this.yardline,
    required this.side,
    required this.possession,
  });

  @override
  void onLoad() {
    paint = Paint()..color = skin.colors.grey5.withOpacity(0);

    paint.style = PaintingStyle.fill;

    /// when the side is on home we use the difference between 100 and distance
    final yardlineToUse = side == HomeOrAway.home ? 100 - yardline : yardline;

    /// add the 10 endzone distance and divided by full width
    /// plus home and away endzones
    x = convertYardLineToWidth(yardlineToUse) * screenWidth;

    /// adds the swiped distance the component go through
    x = possession == HomeOrAway.away
        ? x - kPassArrowSwipeDistance
        : x + kPassArrowSwipeDistance;

    y = screenHeight * kArrowPathHeightFactor;

    /// add priority so the TextComponent can be over the ribbon
    priority = 1;

    // todo: text animation
    final textComponent = OpacityTextComponent(
      text: text,
      textRenderer: TextPaint(
        style: skin.textStyles.body4Thick
            .copyWith(color: skin.colors.grey1.withOpacity(1)),
      ),
    );

    textComponent
      ..scale = Vector2.all(1.6)
      ..x = kPassArrowHeadWidth + (text.length <= 3 ? 14 : 0)
      ..y = kPassArrowHeight / 4;

    if (possession == HomeOrAway.away) {
      flipHorizontally();
      textComponent.flipHorizontallyAroundCenter();
    }

    add(textComponent);

    textComponent.add(OpacityEffect.fadeOut(DelayedEffectController(
        LinearEffectController(kFadeOutSpeed),
        delay: kPlayStartArrowDelay))
      ..onComplete = () => remove(textComponent));

    add(OpacityEffect.fadeIn(LinearEffectController(1)));

    final moveEffect = MoveByEffect(
        Vector2(
            possession == HomeOrAway.away
                ? kPassArrowSwipeDistance
                : -kPassArrowSwipeDistance,
            0),
        LinearEffectController(0.7));
    add(
      moveEffect,
    );
  }

  @override
  void render(Canvas canvas) {
    final path = Path();

    path.moveTo(kPassArrowHeadWidth, 0);
    path.lineTo(kPassArrowHeadWidth, kPassArrowHeight);
    path.lineTo(0, kPassArrowHeight / 2);
    canvas.drawPath(path, paint);
  }
}

class _RibbonPathBody extends PositionComponent with HasPaint {
  final GameTrackerSkin skin;
  final double screenWidth;
  final double screenHeight;
  final double yardline;
  final HomeOrAway side;
  final HomeOrAway possession;
  final RibbonPathType type;

  _RibbonPathBody({
    required this.skin,
    required this.screenWidth,
    required this.screenHeight,
    required this.yardline,
    required this.side,
    required this.possession,
    this.type = RibbonPathType.regular,
  });

  @override
  void onLoad() {
    paint = Paint()..color = skin.colors.grey5.withOpacity(0);

    paint.filterQuality = FilterQuality.high;

    paint.style = PaintingStyle.fill;

    /// when the side is on home we use the difference between 100 and distance
    final yardlineToUse = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardlineToUse) * screenWidth;

    /// the swiping distance the component animated through
    x = possession == HomeOrAway.away
        ? x - (kPassArrowSwipeDistance + kPassArrowHeadWidth)
        : x + (kPassArrowSwipeDistance + kPassArrowHeadWidth);

    y = screenHeight * kArrowPathHeightFactor;

    add(OpacityEffect.fadeIn(LinearEffectController(1)));

    add(
      MoveByEffect(
          Vector2(
              possession == HomeOrAway.away
                  ? kPassArrowSwipeDistance
                  : -kPassArrowSwipeDistance,
              0),
          LinearEffectController(kArrowPathFadeOutSpeed)),
    );

    add(ScaleEffect.by(Vector2(type == RibbonPathType.regular ? 5 : 8, 1),
        LinearEffectController(kArrowPathFadeOutSpeed)));

    if (possession == HomeOrAway.away) {
      flipHorizontally();
    }
  }

  @override
  void render(Canvas canvas) {
    final path = Path();

    path.lineTo(kPassArrowWidth, 0);
    path.lineTo(kPassArrowWidth, kPassArrowHeight);
    path.lineTo(0, kPassArrowHeight);
    path.close();
    canvas.drawPath(path, paint);
  }
}

class _RibbonPathTail extends PositionComponent with HasPaint {
  final GameTrackerSkin skin;
  final double screenWidth;
  final double screenHeight;
  final double yardline;
  final HomeOrAway side;
  final HomeOrAway possession;
  final Color tailColor;
  final RibbonPathType type;

  _RibbonPathTail(
      {required this.skin,
      required this.screenWidth,
      required this.screenHeight,
      required this.yardline,
      required this.side,
      required this.possession,
      required this.tailColor,
      this.type = RibbonPathType.regular});

  @override
  void onLoad() {
    paint = Paint()..color = tailColor.withOpacity(0);

    paint.style = PaintingStyle.fill;

    /// when the side is on home we use the difference between 100 and distance
    final yardlineToUse = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardlineToUse) * screenWidth;

    x = possession == HomeOrAway.away
        ? x - (kPassArrowWidth * (type == RibbonPathType.regular ? 5 : 8) + 16)
        : x + (kPassArrowWidth * (type == RibbonPathType.regular ? 5 : 8) + 16);

    y = screenHeight * kArrowPathHeightFactor;

    add(
      OpacityEffect.fadeIn(
          DelayedEffectController(LinearEffectController(0.8), delay: 0.6)),
    );

    add(
      MoveByEffect(Vector2(possession == HomeOrAway.away ? 14 : -14, 0),
          DelayedEffectController(LinearEffectController(0.8), delay: 0.6)),
    );

    /// flip the Component to a different direction
    /// when it's away possession
    if (possession == HomeOrAway.away) {
      flipHorizontally();
    }
  }

  @override
  void render(Canvas canvas) {
    final path = Path();

    path.moveTo(kPassArrowHeadWidth - 6, 0);
    path.lineTo(kPassArrowHeadWidth, 0);
    path.lineTo(kPassArrowHeadWidth, kPassArrowHeight);
    path.lineTo(kPassArrowHeadWidth - 6, kPassArrowHeight);
    path.lineTo(-6, kPassArrowHeight / 2);
    path.close();
    canvas.drawPath(path, paint);
  }
}
