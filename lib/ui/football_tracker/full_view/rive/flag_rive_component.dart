import 'package:flame/components.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/widgets.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/util.dart';

class FlagRiveComponent extends RiveComponent with HasGameRef, Completable {
  FlagRiveComponent(Artboard artboard) : super(artboard: artboard);

  @override
  void onLoad() {
    super.onLoad();

    priority = 12;
  }

  @override
  void render(Canvas canvas) {
    invertSkewedView(canvas);

    super.render(canvas);
  }
}
