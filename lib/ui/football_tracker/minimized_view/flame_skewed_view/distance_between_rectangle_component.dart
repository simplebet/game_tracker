import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/util.dart';

class DistanceBetweenRectangleComponent extends PositionComponent
    with HasPaint, HasGameRef {
  DistanceBetweenRectangleComponent({
    this.distanceBetween,
    this.isPersisting = false,
    this.isHomePossession = false,
  });

  final double? distanceBetween;
  final bool isPersisting;
  final bool isHomePossession;

  @override
  FutureOr<void> onLoad() {
    final screenWidth = gameRef.size.x;
    final rectangleComponent = RectangleComponent(
      position: Vector2.zero(),
      size:
          Vector2(convertYardsToWidth(distanceBetween ?? 0) * screenWidth, 40),
      anchor: Anchor.centerLeft,
      paint: Paint()..color = const Color(0xFFD9D9D9).withOpacity(0.4),
    );

    add(rectangleComponent);

    if (!isPersisting) {
      rectangleComponent.add(OpacityEffect.fadeOut(DelayedEffectController(
          LinearEffectController(kFadeOutSpeed),
          delay: kDownLineDelay))
        ..onComplete = () {
          removeFromParent();
        });
    }

    if (isHomePossession) flipHorizontally();

    super.onLoad();
  }
}
