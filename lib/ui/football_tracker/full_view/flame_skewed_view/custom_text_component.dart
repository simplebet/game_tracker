import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/ui/shared/constants.dart';

final _textRenderer = TextPaint(
  style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
);

class CustomTextComponent extends TextComponent {
  CustomTextComponent({
    required String text,
    required Vector2 position,
    required double angle,
  }) : super(
          text: text,
          position: position,
          textRenderer: _textRenderer,
          angle: angle,
        );

  @override
  void onLoad() {
    anchor = Anchor.center;
    scale = Vector2.all(0);
  }

  Future<void> scaleIn() async {
    final Completer completer = Completer();

    final effect = ScaleEffect.to(
      Vector2.all(1),
      EffectController(
        duration: .33,
      ),
      onComplete: completer.complete,
    );

    add(effect);

    return completer.future;
  }

  Future<void> scaleOut() async {
    final Completer completer = Completer();

    final effect = ScaleEffect.to(
      Vector2.all(0),
      EffectController(
        duration: .33,
      ),
      onComplete: () {
        completer.complete();
        removeFromParent();
      },
    );

    add(effect);

    return completer.future;
  }

  @override
  void render(Canvas canvas) {
    canvas.save();

    final Matrix4 skewMatrix = Matrix4.inverted(kSkewMatrixSmall.clone());

    canvas.transform(skewMatrix.storage);

    super.render(canvas);
    canvas.restore();
  }
}
