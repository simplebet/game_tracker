import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/team_color.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class EndZoneComponent extends PositionComponent {
  EndZoneComponent(this.paint, this.borderPaint, this.homeOrAway);

  factory EndZoneComponent.away({
    required GameTrackerSkin skin,
    required TeamModel teamData,
    required double screenWidth,
    required double screenHeight,
    required Vector2 scale,
    bool isMinimizedView = false,
  }) {
    final body1Italic = TextPaint(
      style: skin.textStyles.body1Italic
          .copyWith(color: skin.colors.grey1.withOpacity(.50)),
    );
    final isNFL = teamData.league?.isNFL ?? false;
    final awayTeamName =
        isNFL ? teamData.franchiseName : teamData.footballFieldName;

    final Paint paint = Paint()..color = teamData.primaryColor;
    final Paint borderPaint = Paint()
      ..color = skin.colors.grey1.withOpacity(.50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final component = EndZoneComponent(paint, borderPaint, HomeOrAway.away);

    if (!isMinimizedView) {
      component.add(
        TextComponent(
          text: awayTeamName?.toUpperCase(),
          textRenderer: body1Italic,
        )

          ///rotate component counter clockwise for 90 degrees
          ..angle = -(math.pi / 180) * 90
          ..anchor = Anchor.center
          ..position = Vector2(screenWidth * 0.04, screenHeight / 2)

          /// increase the font size
          ..scale = scale,
      );
    }

    return component;
  }

  factory EndZoneComponent.home({
    required GameTrackerSkin skin,
    required TeamModel teamData,
    required double screenWidth,
    required double screenHeight,
    required Vector2 scale,
    bool isMinimizedView = false,
  }) {
    final body1Italic = TextPaint(
      style: skin.textStyles.body1Italic
          .copyWith(color: skin.colors.grey1.withOpacity(0.5)),
    );
    final isNFL = teamData.league?.isNFL ?? false;
    final homeTeamName =
        isNFL ? teamData.franchiseName : teamData.footballFieldName;

    final Paint paint = Paint()..color = teamData.primaryColor;
    final Paint borderPaint = Paint()
      ..color = skin.colors.grey1.withOpacity(.50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final component = EndZoneComponent(paint, borderPaint, HomeOrAway.home);

    if (!isMinimizedView) {
      component.add(
        TextComponent(
          text: homeTeamName?.toUpperCase(),
          textRenderer: body1Italic,
        )

          /// rotate component clockwise for 90 degrees
          ..angle = (math.pi / 180) * 90
          ..anchor = Anchor.center
          ..position = Vector2(screenWidth * 0.04, screenHeight / 2)

          /// increase the font size
          ..scale = scale,
      );
    }

    return component;
  }

  late HomeOrAway homeOrAway;
  final Paint paint;
  final Paint borderPaint;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), paint);

    /// draw the right border for away team endzone
    if (homeOrAway == HomeOrAway.away) {
      canvas.drawLine(Offset(width, 0), Offset(width, height), borderPaint);
    } else {
      /// draw the left border for home team endzone
      canvas.drawLine(Offset.zero, Offset(0, height), borderPaint);
    }

    final gradientPaint = Paint()
      ..shader = kFieldLinearShadowGradient.createShader(size.toRect());

    canvas.drawRect(size.toRect(), gradientPaint);
  }
}
