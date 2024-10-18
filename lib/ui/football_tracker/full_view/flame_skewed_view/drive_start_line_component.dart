import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import '../../../shared/util.dart';

class DriveStartLineComponent extends PositionComponent
    with HasPaint, HasGameRef {
  final GameTrackerSkin skin;
  final double yardline;
  final HomeOrAway side;
  final HomeOrAway possession;
  final String awayTeamName;
  final String homeTeamName;

  DriveStartLineComponent({
    required this.skin,
    required this.yardline,
    required this.side,
    required this.possession,
    required this.awayTeamName,
    required this.homeTeamName,
  });

  @override
  void onLoad() {
    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    paint = Paint()..color = skin.colors.grey1.withOpacity(0);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    final yardlineToUse = side == HomeOrAway.home ? 100 - yardline : yardline;

    x = convertYardLineToWidth(yardlineToUse) * screenWidth;

    y = kYardLineTopPadding;

    height = screenHeight *
        (screenWidth < kSmallerScreenWidth
            ? kFootballYardLineHeightFactorSmall
            : kFootballYardLineHeightFactor);

    TextPaint body5Medium = TextPaint(
        style: skin.textStyles.body5Medium
            .copyWith(fontSize: 19, color: skin.colors.grey1));

    String possessionTeamAbbrv =
        possession == HomeOrAway.away ? awayTeamName : homeTeamName;

    String sideTeamAbbrv =
        side == HomeOrAway.away ? awayTeamName : homeTeamName;

    add(TextComponent(
        text: '$possessionTeamAbbrv Drive Start: $sideTeamAbbrv $yardline'
            .toUpperCase(),
        textRenderer: body5Medium)

      ///rotate component counter clockwise for 90 degrees
      ..angle = -(math.pi / 180) * 90
      ..position = Vector2(possession == HomeOrAway.away ? -25 : -2, height));

    add(OpacityEffect.to(1, LinearEffectController(kFadeInSpeed)));
  }

  @override
  void render(Canvas canvas) {
    canvas.drawLine(const Offset(0, 0), Offset(0, height), paint);
  }
}
