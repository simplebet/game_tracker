import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../../../shared/constants.dart';

class StarSprite extends SpriteComponent {
  StarSprite();

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    scale = Vector2.all(0);
    sprite = await Sprite.load(kStarSpritePath);
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

  Future<void> scaleInOut({required Vector2 position}) async {
    Completer completer = Completer();

    x = position.x;
    y = position.y;
    final effect = SequenceEffect([
      ScaleEffect.to(
        Vector2.all(.4),
        EffectController(
          duration: .20,
        ),
      ),
      ScaleEffect.to(
        Vector2.all(0),
        EffectController(
          duration: .20,
        ),
        onComplete: () {
          completer.complete();
          removeFromParent();
        },
      ),
    ]);

    add(effect);
    return completer.future;
  }
}
