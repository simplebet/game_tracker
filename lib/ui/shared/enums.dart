import 'package:game_tracker/core/models/enums.dart';

enum ArrowHeadType { circle, arrow, cross }

enum ArrowDirection { left, right, down }

enum RushOrPass {
  rush,
  pass,
  none;

  @override
  String toString() {
    return this == RushOrPass.rush ? 'rush' : 'pass';
  }
}

extension HomeOrAwayOpposite on HomeOrAway {
  HomeOrAway get opposite =>
      this == HomeOrAway.away ? HomeOrAway.home : HomeOrAway.away;
}

enum ClientName {
  betr,
  draftKings,
  testBed,
  hardRock,
  unknown;

  @override
  String toString() {
    return name;
  }
}

enum ViewMode {
  minimized,
  full,
  none;

  @override
  String toString() {
    return name;
  }
}

enum SlideInArrowType {
  jumpBallRight,
  jumpBallLeft,
  turnoverRight,
  turnoverLeft
}

enum GameTrackerUnavailableReason {
  matchDisabled,
  matchNotCovered,
}

enum AnalyticsEvents {
  gameTrackerLaunched,
  lastPlayTrayClicked,
  allDrivesHistoryClicked,
  statsViewClicked,
  statsViewScrolled,
  playTrayScrolled,
}
