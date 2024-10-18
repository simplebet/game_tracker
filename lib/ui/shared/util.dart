import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';

Size textSize(String text, TextStyle style, [double textScaleFactor = 1]) {
  final TextPainter textPainter = TextPainter(
    strutStyle: StrutStyle.fromTextStyle(style),
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textScaleFactor: textScaleFactor,
    textDirection: TextDirection.ltr,
  )..layout();
  return textPainter.size;
}

(HomeOrAway, int) getSideAndYardlineIfPast50(HomeOrAway side, int yardline) {
  int downlineEndYardline = yardline;
  if (yardline > 50) {
    final difference = yardline - 50;
    downlineEndYardline = 50 - difference;
    side = side.opposite;
  }

  return (side, downlineEndYardline);
}

double getXPosition(int yardline, HomeOrAway side, double screenWidth) {
  final double endzoneWidth = screenWidth / 12;
  final double fieldWidth = screenWidth - 2 * endzoneWidth;
  final double pixelsPerYard = fieldWidth / 100;
  double x = 0;

  if (side == HomeOrAway.home) {
    x = screenWidth - endzoneWidth - (yardline * pixelsPerYard) - kXSkewOffset;
  } else {
    x = endzoneWidth + (yardline * pixelsPerYard) - kXSkewOffset;
  }
  return x;
}

double getXPositionMinimized(
  int yardline,
  HomeOrAway side,
  double screenWidth,
) {
  final double endzoneWidth = screenWidth / 12;
  final double fieldWidth = screenWidth - 2 * endzoneWidth;
  final double pixelsPerYard = fieldWidth / 100;
  double x = 0;

  if (side == HomeOrAway.home) {
    x = screenWidth - endzoneWidth - (yardline * pixelsPerYard);
  } else {
    x = endzoneWidth + (yardline * pixelsPerYard);
  }

  return x;
}

double getEndXPositionMinimized(
  int yardline,
  HomeOrAway side,
  double screenWidth,
) {
  final double endzoneWidth = screenWidth / 12;
  final double fieldWidth = screenWidth - 2 * endzoneWidth;
  final double pixelsPerYard = fieldWidth / 100;
  double x = 0;

  if (yardline > 50) {
    if (side == HomeOrAway.home) {
      x = endzoneWidth + (yardline * pixelsPerYard);
    } else {
      x = screenWidth - endzoneWidth - (yardline * pixelsPerYard);
    }
  } else {
    if (side == HomeOrAway.home) {
      x = screenWidth - endzoneWidth - (yardline * pixelsPerYard);
    } else {
      x = endzoneWidth + (yardline * pixelsPerYard);
    }
  }

  return x;
}

double getDeltaX(
  int startingYardline,
  int endingYardline,
  HomeOrAway startingSide,
  HomeOrAway endingSide,
  double screenWidth,
) {
  final double initX =
      getXPosition(startingYardline, startingSide, screenWidth);
  final double finalX = getXPosition(endingYardline, endingSide, screenWidth);
  return finalX - initX;
}

int getYardageInBetween(
  HomeOrAway firstSide,
  int firstYardline,
  HomeOrAway secondSide,
  int secondYardline,
) {
  int yardage = 0;
  if (firstSide == secondSide) {
    yardage = (firstYardline - secondYardline).abs();
  } else {
    yardage = 50 - firstYardline + 50 - secondYardline;
  }
  return yardage;
}

double getYardsTraveled(double deltaX, double screenWidth) {
  return deltaX.abs() / getPixelsPerYard(screenWidth);
}

double getPixelsPerYard(double screenWidth) {
  final double endzoneWidth = screenWidth / 12;
  final double fieldWidth = screenWidth - 2 * endzoneWidth;
  return fieldWidth / 100;
}

double convertYardLine(int yardLine, HomeOrAway side) {
  double fieldOffset;
  if (side == HomeOrAway.home) {
    fieldOffset = kEndZoneOffset + kPlayAreaSize - yardLine.toDouble();
  } else {
    fieldOffset = kEndZoneOffset + yardLine.toDouble();
  }
  return fieldOffset;
}

double convertYardLineToWidth(double yardLine) {
  return (yardLine + 10) / 120;
}

double convertYardsToWidth(double yards) {
  return yards / 120;
}

RushOrPass convertTypeToRushOrPass(FootballMatchIncidentEventType type) {
  if (type.isPassEvent || type.isPenaltyEvent) {
    return RushOrPass.pass;
  } else if (type.isRushEvent) {
    return RushOrPass.rush;
  } else {
    return RushOrPass.none;
  }
}

void invertSkewedView(Canvas canvas) {
  final matrix4 = Matrix4.identity()
    ..rotateX(math.pi / kSkewMatrixRotateFactor);
  canvas.transform(matrix4.storage);
}

double set45DegreeAngle(HomeOrAway possession) =>
    (possession == HomeOrAway.away ? -1 : 1) * ((math.pi / 180) * 45);

bool isTeamNameContainsJOrQ(String? teamName) {
  return teamName?.toUpperCase().contains(RegExp('[JQ]')) ?? false;
}

String setPlayRibbonText(
  FootballMatchIncidentEventType event,
  String yardlineLabel,
) {
  if (event.isExtraPointEvents || event.isTwoPointsConversionEvents) {
    return 'PAT';
  }
  if (event.isFieldGoalEvents ||
      event == FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal) {
    return 'FG';
  }
  if (event.isKickoffEvents) {
    return 'KO';
  }
  return yardlineLabel;
}

String formatFieldSide(
  HomeOrAway? fieldSide,
  TeamModel? homeTeam,
  TeamModel? awayTeam,
) {
  if (fieldSide == null || homeTeam == null || awayTeam == null) {
    return '';
  }

  return fieldSide == HomeOrAway.home
      ? homeTeam.shortName?.formattedTeamName() ?? ''
      : awayTeam.shortName?.formattedTeamName() ?? '';
}
