import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';
import 'package:game_tracker/ui/shared/text_utils.dart';

class FootballLastPlayTrayFormatter {
  FootballLastPlayTrayFormatter({
    required this.homeTeam,
    required this.awayTeam,
  });

  final TeamModel? homeTeam;
  final TeamModel? awayTeam;

  String lastPlayTrayTitle(
    FootballMatchIncidentModel? play, {
    required bool isExpandedTitle,
  }) {
    if (play == null) {
      return '';
    }

    final teamAbbrv = getTeamAbbrvByHomeOrAway(play.start!.possession);
    final formattedDriveNumber = formatDriveNumber(play.driveNumber);

    if (play.event == FootballMatchIncidentEventType.awaitingOt) {
      return '';
    }

    if (play.event == FootballMatchIncidentEventType.matchEnded) {
      return 'Game Ended';
    }

    if (play.event == FootballMatchIncidentEventType.driveStarted &&
        !isExpandedTitle) {
      return "$teamAbbrv'S $formattedDriveNumber Started";
    }

    if (play.event == FootballMatchIncidentEventType.driveEnded &&
        !isExpandedTitle) {
      return "$teamAbbrv'S $formattedDriveNumber Ended";
    }

    if (play.event == FootballMatchIncidentEventType.periodEnd) {
      return play.isFirstOrThirdPeriodEnd
          ? "$teamAbbrv'S $formattedDriveNumber"
          : 'Halftime';
    }

    if (play.event == FootballMatchIncidentEventType.coinToss) {
      return 'Coin Toss';
    }

    if (play.event == FootballMatchIncidentEventType.defensiveTwoPoint) {
      return 'Point After Attempt';
    }

    if (play.event.isKickoffEvents) {
      return 'Kickoff';
    }

    if (play.event.isExtraPointEvents) {
      return 'Extra Point Attempt';
    }

    if (play.event.isTwoPointsConversionEvents) {
      return 'Two-Point Conversion Attempt';
    }

    if (play.event.isPenaltyEvent) {
      return 'Penalty';
    }

    if (play.event.isOnsideKickEvent) {
      return 'Onside Kick Attempt';
    }

    if (play.event == FootballMatchIncidentEventType.timeout) {
      return 'Timeout';
    }

    final down = '${play.start!.down}${formatOrdinalSuffix(play.start!.down)}';
    final distance = play.start!.distance;
    final startSideTeamName = getTeamAbbrvByHomeOrAway(play.start!.side);
    final yardline = play.event == FootballMatchIncidentEventType.driveStarted
        ? play.end!.yardline
        : play.start!.yardline;

    final distanceOrGoal = play.meta?.goalToGo ?? false ? 'Goal' : distance;
    final downDistanceYardline =
        '$down & $distanceOrGoal at $startSideTeamName $yardline';

    final teamNameWithDrive = "$teamAbbrv'S $formattedDriveNumber";
    final playNumber =
        play.meta?.playNumber == 0 ? '' : 'PLAY ${play.playNumber}';

    return isExpandedTitle
        ? downDistanceYardline
        : '$teamNameWithDrive $playNumber';
  }

  /// sub title on the Last Play Tray collapsed and expanded view
  String lastPlayTraySubtitle(FootballMatchIncidentModel? play) {
    if (play == null) {
      return 'PENDING...';
    }

    String summary = '';

    final playStartPossession =
        getTeamAbbrvByHomeOrAway(play.start!.possession);
    final playStartPossessionOpposite =
        getTeamAbbrvByHomeOrAwayOpposite(play.start!.possession);
    final playEndSide = getTeamAbbrvByHomeOrAway(play.end!.side);
    final playStartSide = getTeamAbbrvByHomeOrAway(play.start!.side);
    final playEndPossession = getTeamAbbrvByHomeOrAway(play.end!.possession);
    final startYardline = play.start?.yardline ?? '';
    final endYardline = play.end?.yardline ?? '';

    switch (play.event) {
      case FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal:
        summary =
            '$playStartPossession field goal is NO GOOD, $playEndPossession returned for a TOUCHDOWN';

      case FootballMatchIncidentEventType.touchdownFromFumbledPunt:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, $playStartPossessionOpposite FUMBLES, RECOVERED by $playEndPossession, returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromFumbledKickoff:
        summary =
            '$playStartPossession kicks from the $playStartSide $startYardline, $playStartPossessionOpposite FUMBLES, RECOVERED by $playEndPossession, returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.safetyFromBlockedPunt:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, BLOCKED, $playEndPossession downed in the end zone, SAFETY';
      case FootballMatchIncidentEventType.puntTouchback:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, touchback';
      case FootballMatchIncidentEventType.onsideKickFails:
        summary =
            '$playStartPossession onside kick attempt FAILS, $playEndPossession returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.onsideKickSucceeds:
        summary =
            '$playStartPossession onside kick attempt SUCCEEDS, $playEndPossession returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.awaitingOt:
        summary = 'Overtime';
      case FootballMatchIncidentEventType.extraPointMade:
        summary = '$playStartPossession extra point is GOOD';
      case FootballMatchIncidentEventType.extraPointMissed:
        summary = '$playStartPossession extra point is NO GOOD';
      case FootballMatchIncidentEventType.twoPointConversionMade:
        summary = '$playStartPossession two-point conversion attempt SUCCEEDS';
      case FootballMatchIncidentEventType.twoPointConversionMissed:
        summary = '$playStartPossession two-point conversion attempt FAILS';
      case FootballMatchIncidentEventType.coinToss:
        summary =
            '${getTeamAbbrvByHomeOrAway(play.coinTossWinner)} has won the toss. ${getTeamAbbrvByHomeOrAway(play.coinTossReceiving)} will receive the ball';
      case FootballMatchIncidentEventType.doubleTurnover:
        summary =
            '$playStartPossession from the $playStartSide $startYardline, TURNOVER, recovered by $playStartPossessionOpposite. $playStartPossessionOpposite FUMBLES, RECOVERED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.passThatGainsYards:
      case FootballMatchIncidentEventType.passThatLosesYards:
        summary =
            '$playStartPossession pass complete for ${play.netYards} yards to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.passThatResultedInAFirstDown:
        summary =
            '$playStartPossession pass complete for ${play.netYards} yards to the $playEndSide $endYardline, 1ST DOWN';
      case FootballMatchIncidentEventType.rushThatResultedInAFirstDown:
        summary =
            '$playStartPossession rush for ${play.netYards} yards to the $playEndSide $endYardline, 1ST DOWN';
      case FootballMatchIncidentEventType.fieldGoalMissed:
        summary =
            '$playStartPossession ${play.netYards} yard field goal is NO GOOD';
      case FootballMatchIncidentEventType.fieldGoalMade:
        summary =
            '$playStartPossession ${play.netYards} yard field goal is GOOD';
      case FootballMatchIncidentEventType.sack:
        summary =
            '$playStartPossession sacked for a loss of ${play.netYards} yards to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.postSnapFlag:
        summary = 'PENALTY to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.puntFairCatch:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, fair catch by $playEndPossession at the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.puntReturn:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, $playEndPossession returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.passIncomplete:
        summary = '$playStartPossession pass incomplete';
      case FootballMatchIncidentEventType.fumbleFromKickoff:
        summary =
            '$playStartPossession kicks from the $playStartSide $startYardline, $playStartPossessionOpposite FUMBLES, RECOVERED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.fumbleFromPass:
        summary =
            '$playStartPossession pass complete, $playStartPossession FUMBLES, RECOVERED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.fumbleFromPunt:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, $playStartPossessionOpposite FUMBLES, RECOVERED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.fumbleFromRush:
        summary =
            '$playStartPossession rush, $playStartPossession FUMBLES, RECOVERED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.interception:
        summary =
            '$playStartPossession pass INTERCEPTED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.kickoffWithTouchback:
        summary =
            '$playStartPossession kicks from the $playStartSide $startYardline, touchback';
      case FootballMatchIncidentEventType.passThatResultedInATurnover:
        summary = '$playStartPossession pass, TURNOVER ON DOWNS';
      case FootballMatchIncidentEventType.preSnapFlag:
        summary = 'PENALTY to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.puntBlocked:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, BLOCKED, RECOVERED by $playEndPossession, returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.rushThatGainsYards:
        summary =
            '$playStartPossession rush for ${play.netYards} yards to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.rushThatLosesYards:
        summary =
            '$playStartPossession rush for ${play.netYards} yards to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.rushThatResultedInATurnover:
        summary =
            '$playStartPossession rush for ${play.netYards} yards to the $playEndSide $endYardline, TURNOVER ON DOWNS';
      case FootballMatchIncidentEventType.safetyFromKickoff:
        summary =
            '$playStartPossession kicks from the $playStartSide $startYardline, $playEndPossession downed in the end zone, SAFETY';
      case FootballMatchIncidentEventType.safetyFromPunt:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, $playEndPossession downed in the end zone, SAFETY';
      case FootballMatchIncidentEventType.safetyFromPass:
        summary =
            '$playStartPossession pass complete, $playEndPossession downed in the end zone, SAFETY';
      case FootballMatchIncidentEventType.safetyFromRush:
        summary =
            '$playStartPossession rush, $playEndPossession downed in the end zone, SAFETY';
      case FootballMatchIncidentEventType.safetyFromSack:
        summary =
            '$playStartPossession sacked in the end zone for a loss of ${play.meta!.netYards!.abs().toString()} yards, SAFETY';
      case FootballMatchIncidentEventType.touchdownFromKickoff:
        summary =
            '$playStartPossession kicks from the $playStartSide $startYardline, $playEndPossession returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromBlockedPunt:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, BLOCKED, RECOVERED by $playEndPossession, returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromPass:
        summary =
            '$playStartPossession pass complete for ${play.netYards} yards, TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromPickSix:
        summary =
            '$playStartPossession pass INTERCEPTED by $playEndPossession, returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromPunt:
        summary =
            '$playStartPossession punts from the $playStartSide $startYardline, $playEndPossession returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromRush:
        summary =
            '$playStartPossession rush for ${play.netYards} yards, TOUCHDOWN';
      case FootballMatchIncidentEventType.touchdownFromScoopAndScore:
        summary =
            '$playStartPossession rush, $playStartPossession FUMBLES, RECOVERED by $playEndPossession, returned for a TOUCHDOWN';
      case FootballMatchIncidentEventType.kickoffReturn:
        summary =
            '$playStartPossession kicks from the $playStartSide $startYardline, $playEndPossession returned to the $playEndSide $endYardline';
      case FootballMatchIncidentEventType.periodEnd:
        summary = play.meta!.period == 2
            ? 'Halftime'
            : 'End of Quarter ${play.meta!.period}';
      case FootballMatchIncidentEventType.timeout:
        summary = '${getTeamAbbrvByHomeOrAway(play.side!)} timeout';
      case FootballMatchIncidentEventType.defensiveTwoPoint:
        summary =
            '$playStartPossession two-point conversion attempt FAILS, $playEndPossession returned for a DEFENSIVE TWO-POINT';
      case FootballMatchIncidentEventType.previousPlayUnderReview:
        summary = 'Play Under Review';
      case FootballMatchIncidentEventType.previousPlayStands:
        summary = 'Play Stands';
      case FootballMatchIncidentEventType.previousPlayOverturned:
        summary = 'Play Overturned';
      case FootballMatchIncidentEventType.driveStarted:
      case FootballMatchIncidentEventType.driveEnded:
      case FootballMatchIncidentEventType.unknown:
        summary = '';
      default:
        summary = '';
    }

    if (play.isCorrectedPlay) {
      play.event.isNoSummaryWhenCorrectedEvent
          ? summary = ''
          : summary = 'corrected: $summary';
      return summary;
    }

    return summary;
  }

  ///Drive number description used in the expanded and minimized last play tray
  String formatDriveNumber(String driveNumber) {
    return '$driveNumber${formatOrdinalSuffix(int.parse(driveNumber))} DRIVE';
  }

  String formatDriveNumberWithName(
    HomeOrAway? possession,
    String? driveNumber,
  ) {
    if (possession == null || driveNumber == null) {
      return '';
    }

    return "${getTeamAbbrvByHomeOrAway(possession)}'s ${formatDriveNumber(driveNumber)}";
  }

  /// Retrieve Abbreviation for the given side
  String getTeamAbbrvByHomeOrAway(HomeOrAway? homeOrAway) {
    if (homeOrAway == null) {
      return '';
    }

    if (homeOrAway == HomeOrAway.none) {
      return 'Official';
    }

    return (homeOrAway == HomeOrAway.home ? homeTeam : awayTeam)!
        .lastPlayTrayName;
  }

  /// Retrieve Abbreviation for the opposite of given side
  String getTeamAbbrvByHomeOrAwayOpposite(HomeOrAway? homeOrAway) {
    if (homeOrAway == null) {
      return '';
    }

    return (homeOrAway == HomeOrAway.home ? awayTeam : homeTeam)!
        .lastPlayTrayName;
  }

  String formatPlayNumber(FootballMatchIncidentModel? play) {
    if (play == null) {
      return '';
    }

    if (play.event == FootballMatchIncidentEventType.driveStarted) {
      return '${getTeamAbbrvByHomeOrAway(play.start?.possession)} Drive Started - ';
    }

    if (play.event == FootballMatchIncidentEventType.driveEnded) {
      return '${getTeamAbbrvByHomeOrAway(play.start?.possession)} Drive Ended';
    }

    return 'Play ${play.meta!.playNumber}  •  ';
  }

  String formatDownDistance(FootballMatchIncidentModel? play) {
    if (play == null) {
      return '';
    }

    final down = '${play.start!.down}${formatOrdinalSuffix(play.start!.down)}';
    final distance = play.start?.distance;
    final distanceOrGoal = play.meta?.goalToGo ?? false ? 'Goal' : distance;

    return '$down & $distanceOrGoal';
  }
}
