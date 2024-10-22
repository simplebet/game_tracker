import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'package:game_tracker/ui/shared/constants.dart';

class XIconSprite extends SpriteComponent with HasGameRef {
  XIconSprite();

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    opacity = 0;
    sprite = await Sprite.load(kXIconSpritePath);
  }

  Future<void> trigger({
    required Vector2 position,
    double duration = .3,
  }) async {
    this.position = position;

    await Future.wait([
      _fadeInOut(duration: duration),
      _scaleInOut(duration: duration),
    ]);

    removeFromParent();
  }

  Future<void> _fadeInOut({double duration = .3}) {
    final Completer completer = Completer();

    final effect = SequenceEffect(
      [
        OpacityEffect.fadeIn(
          EffectController(duration: duration),
        ),
        OpacityEffect.fadeOut(
          EffectController(duration: duration),
        ),
      ],
      onComplete: completer.complete,
    );

    add(effect);
    return completer.future;
  }

  Future<void> _scaleInOut({double duration = .3}) {
    final Completer completer = Completer();
    scale = Vector2.all(.5);

    final effect = SequenceEffect(
      [
        ScaleEffect.to(
          Vector2.all(1),
          EffectController(duration: duration),
        ),
        ScaleEffect.to(
          Vector2.all(.5),
          EffectController(duration: duration),
        ),
      ],
      onComplete: completer.complete,
    );

    add(effect);
    return completer.future;
  }
}
