import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class YardLineComponent extends PositionComponent {
  YardLineComponent({
    required GameTrackerSkin skin,
    required double yards,
    required double screenWidth,
    required double screenHeight,
  }) {
    /// style of the yard line, e.g. color, width, opacity
    paint = Paint()..color = skin.colors.grey1.withOpacity(.25);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    x = convertYardLineToWidth(yards) * screenWidth;

    y = kYardLineTopPadding;

    final isSmallerScreen = screenWidth < kSmallerScreenWidth;

    height = screenHeight *
        (isSmallerScreen
            ? kFootballYardLineHeightFactorSmall
            : kFootballYardLineHeightFactor);

    textStyle = skin.textStyles.body4Medium.copyWith(
      fontSize: 20,
      letterSpacing: 1,
      fontWeight: FontWeight.w600,
      color: skin.colors.grey1,
    );

    yardLine = yards.toInt();
  }
  late TextStyle textStyle;
  late Paint paint;
  late int yardLine;

  String get label => yardLine > 50
      ? (100 - yardLine).toStringAsFixed(0)
      : yardLine.toStringAsFixed(0);

  @override
  void render(Canvas canvas) {
    canvas.drawLine(Offset.zero, Offset(0, height), paint);
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
        Offset(-size.width / 2, this.size.y + 2),
      );
    }
  }
}
