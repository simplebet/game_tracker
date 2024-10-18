import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/end_zone_component.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/yard_line_component_minimized.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballFieldComponentMinimized extends PositionComponent {
  FootballFieldComponentMinimized({
    required this.width,
    required this.skin,
    required this.awayTeam,
    required this.homeTeam,
  });

  @override
  final double width;
  @override
  double height = kFootballTrackerMinimizedHeight;
  final GameTrackerSkin skin;
  final TeamModel awayTeam;
  final TeamModel homeTeam;

  // Variables used for field rendering.
  late Rect _fieldRect;
  late Paint _fieldPaint;

  @override
  void onLoad() {
    // Initialize the variables for the rendering method
    _fieldRect = Rect.fromLTWH(0, 0, width, height);
    _fieldPaint = Paint()..color = skin.colors.field;

    final isNFL = awayTeam.league?.isNFL ?? false;
    final awayTeamName =
        isNFL ? awayTeam.franchiseName : awayTeam.footballFieldName;
    final homeTeamName =
        isNFL ? homeTeam.franchiseName : homeTeam.footballFieldName;

    final teamsNameContainJorQ = isTeamNameContainsJOrQ(awayTeamName) ||
        isTeamNameContainsJOrQ(homeTeamName);

    final teamsNameScale =
        teamsNameContainJorQ ? Vector2.all(1.4) : Vector2.all(2);

    /// away team endzone
    add(
      EndZoneComponent.away(
        skin: skin,
        teamData: awayTeam,
        screenWidth: width,
        screenHeight: height,
        scale: teamsNameScale,
        isMinimizedView: true,
      )
        ..position = Vector2(0, 0)
        ..width = width * kFootballFieldEndzoneWidthFactorFlame
        ..height = height
        ..anchor = Anchor.topLeft,
    );

    /// home team endzone
    add(
      EndZoneComponent.home(
        skin: skin,
        teamData: homeTeam,
        screenWidth: width,
        screenHeight: height,
        scale: teamsNameScale,
        isMinimizedView: true,
      )
        ..position = Vector2(width, 0)
        ..width = width * kFootballFieldEndzoneWidthFactorFlame
        ..height = height
        ..anchor = Anchor.topRight,
    );

    /// render yard lines in the order of:
    /// 20-35-50-35-20
    for (final double yardLine in yardLineList) {
      add(
        YardLineComponentMinimized(
          skin: skin,
          yards: yardLine,
        ),
      );
    }
  }

  @override
  void render(Canvas canvas) {
    // Draw the base field color
    canvas.drawRect(_fieldRect, _fieldPaint);
  }
}
