import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import '../../../shared/team_name_formatter.dart';
import '../../../shared/util.dart';
import 'end_zone_component.dart';
import 'yard_line_component.dart';

class FootballFieldComponent extends PositionComponent {
  FootballFieldComponent({
    required this.width,
    required this.height,
    required this.skin,
    required this.awayTeam,
    required this.homeTeam,
  });

  @override
  final double width;
  @override
  final double height;
  final GameTrackerSkin skin;
  final TeamModel awayTeam;
  final TeamModel homeTeam;

  // Variables used for field rendering.
  final int _numberOfStripesIncludingEndzones = 12;
  final Color _stripeColor = const Color(0xFF446F42);
  late Rect _fieldRect;
  late double _stripeWidth;
  late Paint _fieldPaint;
  late Paint _stripePaint;
  final List<Rect> _stripeRects = [];
  late Paint _shadowGradientPaint;
  late Paint _colorGradientPaint;

  @override
  void onLoad() {
    // Initialize the variables for the rendering method
    _fieldRect = Rect.fromLTWH(0, 0, width, height);
    _stripeWidth = width / _numberOfStripesIncludingEndzones;
    _fieldPaint = Paint()..color = skin.colors.field;
    _stripePaint = Paint()..color = _stripeColor;
    for (double i = 0; i < width; i += _stripeWidth * 2) {
      _stripeRects.add(Rect.fromLTWH(i, 2, _stripeWidth, height - 3));
    }

    /// maximum stripes added will be half of all zones
    /// when screen width is bigger than 470 extra stripes is added
    if (_stripeRects.length > _numberOfStripesIncludingEndzones / 2) {
      _stripeRects.removeRange(
          _numberOfStripesIncludingEndzones ~/ 2, _stripeRects.length);
    }

    _shadowGradientPaint = Paint()
      ..shader = kFieldLinearShadowGradient.createShader(_fieldRect);
    _colorGradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF44704C).withOpacity(.66),
          const Color(0xFF44704C).withOpacity(.33),
          Colors.transparent,
        ],
      ).createShader(_fieldRect);

    final isNFL = awayTeam.league == SportLeague.nfl;
    final awayTeamName =
        isNFL ? awayTeam.franchiseName : awayTeam.footballFieldName;
    final homeTeamName =
        isNFL ? homeTeam.franchiseName : homeTeam.footballFieldName;

    final teamsNameContainJorQ = isTeamNameContainsJOrQ(awayTeamName) ||
        isTeamNameContainsJOrQ(homeTeamName);

    final teamsNameScale =
        teamsNameContainJorQ ? Vector2.all(1.4) : Vector2.all(2);

    /// away team endzone
    add(EndZoneComponent.away(
        skin: skin,
        teamData: awayTeam,
        screenWidth: width,
        screenHeight: height,
        scale: teamsNameScale)
      ..position = Vector2(0, 0)
      ..width = width * kFootballFieldEndzoneWidthFactorFlame
      ..height = height
      ..anchor = Anchor.topLeft);

    /// home team endzone
    add(EndZoneComponent.home(
        skin: skin,
        teamData: homeTeam,
        screenWidth: width,
        screenHeight: height,
        scale: teamsNameScale)
      ..position = Vector2(width, 0)
      ..width = width * kFootballFieldEndzoneWidthFactorFlame
      ..height = height
      ..anchor = Anchor.topRight);

    /// render yard lines in the order of:
    /// 20-35-50-35-20
    for (double yardLine in yardLineList) {
      add(YardLineComponent(
        skin: skin,
        yards: yardLine,
        screenWidth: width,
        screenHeight: height,
      ));
    }
  }

  @override
  void render(Canvas canvas) {
    // Draw the base field color
    canvas.drawRect(_fieldRect, _fieldPaint);

    // Render the stripes
    for (final stripeRect in _stripeRects) {
      canvas.drawRect(stripeRect, _stripePaint);
    }

    canvas.drawRect(_fieldRect, _colorGradientPaint);
    canvas.drawRect(_fieldRect, _shadowGradientPaint);
  }
}
