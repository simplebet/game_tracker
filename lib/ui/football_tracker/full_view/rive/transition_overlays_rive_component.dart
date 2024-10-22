import 'package:flame/components.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/widgets.dart';

class TransitionOverlaysRiveComponent extends RiveComponent with HasGameRef {
  TransitionOverlaysRiveComponent(Artboard artboard)
      : super(artboard: artboard, fit: BoxFit.fill);

  @override
  void onLoad() {
    super.onLoad();
    priority = 12;

    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    width = screenWidth;
    height = screenHeight;
  }
}
