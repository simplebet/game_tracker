import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';

class GoalPostSprite extends SpriteComponent with HasGameRef {
  GoalPostSprite({required this.side});

  final HomeOrAway side;

  void fadeOut() {
    add(
      OpacityEffect.fadeOut(EffectController(duration: 1), onComplete: () {
        removeFromParent();
      }),
    );
  }

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    opacity = 0;
    sprite = await Sprite.load(kGoalPostSpritePath);
    final screenHeight = gameRef.size.y;

    x = getXPosition(kGoalPostXOffset.toInt(), side, gameRef.size.x);

    y = screenHeight * kGoalPostYFactor;

    if (side == HomeOrAway.away) {
      flipHorizontally();
    }

    add(
      OpacityEffect.fadeIn(EffectController(duration: 1)),
    );
  }

  @override
  void render(Canvas canvas) {
    canvas.save();

    Matrix4 skewMatrix = Matrix4.inverted(kSkewMatrixSmall.clone());

    // Apply the transformation
    canvas.transform(skewMatrix.storage);

    super.render(canvas);
    canvas.restore();
  }
}
