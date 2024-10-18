import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class YardLineComponentMinimized extends PositionComponent with HasGameRef {
  YardLineComponentMinimized({
    required this.skin,
    required this.yards,
  });

  final double yards;
  final GameTrackerSkin skin;

  late TextStyle textStyle;
  late int yardLine;

  String get label => yardLine > 50
      ? (100 - yardLine).toStringAsFixed(0)
      : yardLine.toStringAsFixed(0);

  @override
  FutureOr<void> onLoad() {
    final screenWidth = gameRef.size.x;

    textStyle = skin.textStyles.body4Medium.copyWith(
      color: skin.colors.grey1.withOpacity(0.5),
      fontSize: 18,
      letterSpacing: 1,
      fontWeight: FontWeight.w600,
    );

    yardLine = yards.toInt();

    x = convertYardLineToWidth(yards) * screenWidth;

    super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    renderText(canvas);
  }

  void renderText(Canvas canvas) {
    if (label.isNotEmpty) {
      final Size size = textSize(label, textStyle);
      final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(textStyle.getTextStyle())
        ..addText(label);
      canvas.drawParagraph(
        paragraphBuilder.build()
          ..layout(ui.ParagraphConstraints(width: size.width)),
        Offset(-size.width / 2, -3),
      );
    }
  }
}
