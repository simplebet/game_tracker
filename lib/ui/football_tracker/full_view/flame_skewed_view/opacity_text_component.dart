import 'package:flame/components.dart';

import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/opacity_provider_mixin.dart';

class OpacityTextComponent extends TextComponent with HasOpacityProvider {
  OpacityTextComponent({
    super.anchor,
    super.angle,
    super.children,
    super.position,
    super.priority,
    super.scale,
    super.size,
    super.text,
    super.textRenderer,
  });
}
