import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Football tracker Canvas
const double kFootballFieldEndzoneWidthFactor = 0.072;

const double kAnimationFieldShaderHeightFactor = 0.22;

/// Basketball tracker Canvas
const double kBaseMatchStateWidgetHeightFactor = 0.1;

const double kBaseFootballFieldHeightFactor = 0.78;

const double kLastPlayTrayHeightFactor = 0.2;

const double kLastPlayTrayWrapperHeightFactor = 0.26;

const double kLastPlayTrayLoadingWidgetHeightFactor = 0.26;

const double kLastPlayTrayLoadingWidgetMatchStateFactor = 0.12;

const double kFootballSpriteWidth = 24;

const String kFootballTrackerRivePath =
    'assets/animations/football_tracker.riv';

const String kTransitionOverlaysRivePath =
    'assets/animations/transition_overlays.riv';

const String kTransitionOverlaysMinimizedRivePath =
    'assets/animations/transition_overlays_minimized.riv';

Color darkGrey =
    const Color(0xFF2C2C2C); // 44, 44, 44 (basketballGrey3 from gameskin)

/// Football tracker Flame
const double kLinePadding = 5;

const double kDefaultStroke = 4;

const double kPlayAreaSize = 100;

const double kEndZoneOffset = 10;

const double kBoldHeight = 10;

const double kRegularHeight = kBoldHeight / 2;

const double kFieldWidth = 120;

const double kFieldHeight = 53;

const double kDriveTopPadding = 10;

const double kPlayTopPadding = 2;

const double kYardLineTopPadding = 18;

const double kPassArrowHeight = 42.0;

const double kPassArrowHeightMinimized = 20.0;

const double kPassArrowWidth = 14.0;

const double kPassArrowHeadWidth = 16.0;

const double kPassArrowSwipeDistance = 80;

const double kSolidArcHeight = 60;

const double kSmallArcWidthFactor = 0.9;

const double kMediumArcWidthFactor = 1.25;

const double kLargeArcWidthFactor = 1.5;

const double kFadeInSpeed = 1.2;

const double kFadeOutSpeed = 0.6;

const double kArrowPathFadeOutSpeed = 0.7;

const double kDownLineDelay = 4.5;

const double kPlayStartArrowDelay = 2;

const double kRushOrPassLineDelay = 2;

const double kComponentMoveUpDelay = 4;

const double kFootballFieldEndzoneWidthFactorFlame = 0.08;

const double kFootballYardLineHeightFactor = 0.87;

const double kFootballYardLineHeightFactorSmall = 0.83;

const double kArrowPathHeightFactor = 0.76;

const double kPenaltyFlagHeightFactor = 0.82;

const double kFieldGoalHeightFactor = 0.64;

const double kFootballComponentHeightFactor = 0.78;

const double kPassLineHeightFactor = 0.83;

const double kCircleComponentRadius = 2.0;

const double kFadeOutFactorWithMoveUp = 0.75;

const double kXSkewOffset = 2.5;

const double kXSkewOffsetMinimized = 3;

const double kEndXSkewOffsetMinimized = 4;

const double kRiseAndFallEffectDuration = 0.5;

const double kSackEffectMoveDuration = 3.0;

const String kFlameImagesPrefixPath = 'assets/images/';

const String kGoalPostSpritePath = 'goal_post.png';

const double kGoalPostYFactor = 0.64;

const double kStarSpriteYFactor = 0.76;

const double kGoalPostXOffset = -18;

const String kStarSpritePath = 'star.png';

const String kXIconSpritePath = 'x_icon.png';

const double kSkewMatrixRotateFactor = 2.58;

final Matrix4 kSkewMatrix = Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..rotateX(-math.pi / kSkewMatrixRotateFactor)
  ..scale(0.765, 1.27);

final Matrix4 kSkewMatrixSmall = Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..rotateX(-math.pi / 2.45)
  ..scale(0.78, 1.59);

final Matrix4 kSkewMatrixMinimized = Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..rotateX(-math.pi / 2.3)
  ..scale(0.955, 4.8);

final Matrix4 kSkewMatrixDisabled = Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..translate(0, 56, 0)
  ..rotateX(-math.pi / kSkewMatrixRotateFactor)
  ..scale(0.86, 2.2);

final Matrix4 kSkewMatrixSmallDisabled = Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..translate(0, 30, 0)
  ..rotateX(-math.pi / 2.45)
  ..scale(0.80, 2);

const double kPassIncompleteNetYards = 5.0;

const double kInterceptionNetYards = 5.0;

const double kDoubleArcWidth = 10.0;

const double kTouchdownFromPuntEndYardline = 20.0;

const double kFumbleDuration = 3;

const double kKickoffDelay = .5;

const double kComponentMoveUpDistance = 40;

const double kPenaltyComponentMoveUpDistance = 30;

const double kDashedArcComponentMoveUpDistance = 30;

const double kLargeDashedArcThreshold = 30;

const double kDriveComponentMaxHeightFactor = 0.8;

const double kDriveScrollUpSpeed = 0.4;

const double kComponentBottomPadding = 35;

const int kShimmerPeriod = 1200;

final LinearGradient kFieldLinearShadowGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.black.withOpacity(0.25),
    Colors.black.withOpacity(0.12),
    Colors.transparent,
  ],
  stops: const [
    0.0,
    0.35,
    0.65,
  ],
);

const int kSmallerScreenWidth = 421;

const int kSmallerArcThreshold = 7;

const double kFootballTrackerMatchStateWidthFactor = 0.3;

const List<double> yardLineList = [20, 35, 50, 65, 80];

const double kFootballTrackerMinimizedHeight = 20;

const int kFootballTrackerMinimizedLongDescCap = 58;

const Color footballFieldColor = Color(0xFF4E794D);

const List<int> dividerList = [0, 1, 2, 3, 4];

const List<int> yardlineList = [20, 35, 50, 35, 20];
