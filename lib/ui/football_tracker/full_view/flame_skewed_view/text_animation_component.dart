import 'package:flame/components.dart';
import 'package:flame/text.dart';

class TextAnimationComponent extends TextComponent with HasPaint {
  TextAnimationComponent({
    required String text,
    required TextRenderer textRenderer,
    required double yard,
    required double screenWidth,
    required double screenHeight,
  }) : super(
          text: text,
          textRenderer: textRenderer,
          position: Vector2(
              ((yard + 10) / 120) * screenWidth + 25, screenHeight * 0.68 - 16),
          scale: Vector2.all(1.6),
        );
}
