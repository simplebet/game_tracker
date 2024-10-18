import "package:flutter/material.dart";

const Color fieldGoalMissedFieldColor = Color(0xFF8a8a8a);

const double kBasketballTrackerBaseScreenWidth = 430.0;

/// the ratio of basketball tracker Rive asset
const double kBasketballTrackerAspectRatio = 610 / 177;

/// the ratio of minimized basketball tracker Rive asset
const double kBasketballTrackerAspectRatioMinimized = 343 / 41;

const int cbbBonusFactor = 6;

const int cbbBonusPlusFactor = 9;

const int nbaBonusFactorRegular = 5;

const int nbaBonusFactorOvertime = 4;

final Matrix4 possessionArrowTextMinimizedTransform = Matrix4.identity()
  ..scale(1, 0.4)
  ..translate(0.0, 60);

final Matrix4 reboundTextMinimizedTransform = Matrix4.identity()
  ..scale(1, 0.376)
  ..translate(0.0, 60);

class BasketballTrackerRiveArtboards {
  static const String backboard = "Backboard";

  static const String backboardMinimized = "BackboardMinimized";

  static const String basketball = "Basketball";

  static const String basketballMinimized = "BasketballMinimized";

  static const String court = "Court";

  static const String courtMinimized = "CourtMinimized";

  static const String homeLaneFill = "Lane-Home-Fill";

  static const String awayLaneFill = "Lane-Away-Fill";

  static const String twoPointZoneHomeFill = "2PointZone-Home-Fill";

  static const String twoPointZoneAwayFill = "2PointZone-Away-Fill";

  static const String threePointZoneHomeFill = "3PointZone-Home-Fill";

  static const String threePointZoneAwayFill = "3PointZone-Away-Fill";

  static const String fieldGoalAttempts = "Field Goal Attempts";

  static const String fieldGoalAttemptsMinimized = "FieldGoalAttemptsMinimized";

  static const String freeThrows = "Free Throws";

  static const String freeThrowsMinimized = "FreeThrowsMinimized";

  static const String slideInArrows = "SlideInArrow";

  static const String slideInArrowsMinimized = "SlideInArrowMinimized";

  static const String possessionArrow = "PossessionArrow";

  static const String possessionArrowMinimized = "PossessionArrowMinimized";

  static const String possessionArrowFill = "PossessionArrowFill";

  static const int possessionArrowKeyedObjectID = 37;

  static const int possessionArrowKeyedPropertyID = 38;

  static const int possessionArrowFirstKeyFrameID = 39;

  static const int possessionArrowSecondKeyFrameID = 40;

  static const int possessionArrowMinimizedKeyedObjectID = 750;
}

class BasketballTrackerRiveStateMachines {
  static const String basketball = "Ball State Machine";

  static const String fieldGoalAttempts = "Field Goal State Machine";

  static const String slideInArrows = "Slide in arrow state machine";

  static const String possessionArrows = "Possession Arrow State Machine";

  static const String court = "Court State Machine";

  static const String freeThrows = "Free Throws State Machine";
}

class BasketballTrackerRiveStateMachineInputs {
  static const String tipOff = "TipOff";

  static const String possessionChange = "PossessionChange";

  static const String turnover = "Turnover";

  static const String jumpBall = "JumpBall";

  static const String twoPointerMade = "2PointerMake";

  static const String threePointerMade = "3PointerMake";

  static const String twoPointerMissed = "2PointerDefensiveRebound";

  static const String threePointerMissed = "3PointerDefensiveRebound";

  static const String jumpBallRight = "JumpBallRight";

  static const String jumpBallLeft = "JumpBallLeft";

  static const String turnoverRight = "TurnoverRight";

  static const String turnoverLeft = "TurnoverLeft";

  static const String freeThrowsMade = "FreeThrowMade";

  static const String freeThrowsMissed = "FreeThrowMissed";
}
