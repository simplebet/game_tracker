import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:recase/recase.dart';

part 'football_match_incident_model.freezed.dart';
part 'football_match_incident_model.g.dart';

enum FootballMatchIncidentEventType {
  @JsonValue('pass_that_gains_yards')
  passThatGainsYards,

  @JsonValue('rush_that_gains_yards')
  rushThatGainsYards,

  @JsonValue('pass_that_resulted_in_a_first_down')
  passThatResultedInAFirstDown,

  @JsonValue('rush_that_resulted_in_a_first_down')
  rushThatResultedInAFirstDown,

  @JsonValue('pass_that_loses_yards')
  passThatLosesYards,

  @JsonValue('rush_that_loses_yards')
  rushThatLosesYards,

  @JsonValue('extra_point_made')
  extraPointMade,

  @JsonValue('extra_point_missed')
  extraPointMissed,

  @JsonValue('punt_return')
  puntReturn,

  @JsonValue('punt_fair_catch')
  puntFairCatch,

  @JsonValue('field_goal_missed')
  fieldGoalMissed,

  @JsonValue('field_goal_made')
  fieldGoalMade,

  @JsonValue('fumble_from_rush')
  fumbleFromRush,

  @JsonValue('fumble_from_pass')
  fumbleFromPass,

  @JsonValue('fumble_from_kickoff')
  fumbleFromKickoff,

  @JsonValue('fumble_from_punt')
  fumbleFromPunt,

  @JsonValue('interception')
  interception,

  @JsonValue('pre_snap_flag')
  preSnapFlag,

  @JsonValue('post_snap_flag')
  postSnapFlag,

  @JsonValue('touchdown_from_rush')
  touchdownFromRush,

  @JsonValue('touchdown_from_blocked_punt')
  touchdownFromBlockedPunt,

  @JsonValue('touchdown_from_pass')
  touchdownFromPass,

  @JsonValue('touchdown_from_pick_six')
  touchdownFromPickSix,

  @JsonValue('touchdown_from_scoop_and_score')
  touchdownFromScoopAndScore,

  @JsonValue('touchdown_from_punt')
  touchdownFromPunt,

  @JsonValue('touchdown_from_kickoff')
  touchdownFromKickoff,

  @JsonValue('touchdown_from_returned_field_goal')
  touchdownFromReturnedFieldGoal,

  @JsonValue('touchdown_from_fumbled_kickoff')
  touchdownFromFumbledKickoff,

  @JsonValue('touchdown_from_fumbled_punt')
  touchdownFromFumbledPunt,

  @JsonValue('safety_from_rush')
  safetyFromRush,

  @JsonValue('safety_from_pass')
  safetyFromPass,

  @JsonValue('safety_from_kickoff')
  safetyFromKickoff,

  @JsonValue('safety_from_punt')
  safetyFromPunt,

  @JsonValue('safety_from_blocked_punt')
  safetyFromBlockedPunt,

  @JsonValue('safety_from_sack')
  safetyFromSack,

  @JsonValue('two_point_conversion_made')
  twoPointConversionMade,

  @JsonValue('two_point_conversion_missed')
  twoPointConversionMissed,

  @JsonValue('coin_toss')
  coinToss,

  @JsonValue('sack')
  sack,

  @JsonValue('double_turnover')
  doubleTurnover,

  @JsonValue('kickoff_with_touchback')
  kickoffWithTouchback,

  @JsonValue('kickoff_return')
  kickoffReturn,

  @JsonValue('rush_that_resulted_in_a_turnover')
  rushThatResultedInATurnover,

  @JsonValue('pass_that_resulted_in_a_turnover')
  passThatResultedInATurnover,

  @JsonValue('pass_incomplete')
  passIncomplete,

  @JsonValue('punt_blocked')
  puntBlocked,

  @JsonValue('punt_touchback')
  puntTouchback,

  @JsonValue('period_end')
  periodEnd,

  @JsonValue('timeout')
  timeout,

  @JsonValue('drive_started')
  driveStarted,

  @JsonValue('drive_ended')
  driveEnded,

  @JsonValue('awaiting_ot')
  awaitingOt,

  @JsonValue('onside_kick_fails')
  onsideKickFails,

  @JsonValue('onside_kick_succeeds')
  onsideKickSucceeds,

  @JsonValue('match_ended')
  matchEnded,

  @JsonValue('defensive_two_point')
  defensiveTwoPoint,

  @JsonValue('previous_play_under_review')
  previousPlayUnderReview,

  @JsonValue('previous_play_stands')
  previousPlayStands,

  @JsonValue('previous_play_overturned')
  previousPlayOverturned,

  unknown
}

extension FootballMatchIncidentEventTypeExtension
    on FootballMatchIncidentEventType {
  String? get name {
    return ReCase(name ?? '').snakeCase;
  }

  bool get isFumbleEvent => [
        FootballMatchIncidentEventType.fumbleFromPass,
        FootballMatchIncidentEventType.fumbleFromKickoff,
        FootballMatchIncidentEventType.fumbleFromPunt,
        FootballMatchIncidentEventType.fumbleFromRush,
      ].contains(this);

  bool get isComboSolidLineEvent => [
        FootballMatchIncidentEventType.doubleTurnover,
        FootballMatchIncidentEventType.touchdownFromPickSix,
        FootballMatchIncidentEventType.interception,
        FootballMatchIncidentEventType.touchdownFromScoopAndScore,
      ].contains(this);

  bool get isDoubleTurnoverEvent =>
      FootballMatchIncidentEventType.doubleTurnover == this;

  bool get isRushEvent => [
        FootballMatchIncidentEventType.rushThatGainsYards,
        FootballMatchIncidentEventType.rushThatLosesYards,
        FootballMatchIncidentEventType.rushThatResultedInAFirstDown,
        FootballMatchIncidentEventType.rushThatResultedInATurnover,
      ].contains(this);

  bool get isPassEvent => [
        FootballMatchIncidentEventType.passThatGainsYards,
        FootballMatchIncidentEventType.passThatResultedInAFirstDown,
        FootballMatchIncidentEventType.passThatLosesYards,
        FootballMatchIncidentEventType.passThatResultedInATurnover,
        FootballMatchIncidentEventType.passIncomplete,
      ].contains(this);

  bool get isPassIncompleteEvent =>
      [FootballMatchIncidentEventType.passIncomplete].contains(this);

  bool get isLosesYardEvent => [
        FootballMatchIncidentEventType.passThatLosesYards,
        FootballMatchIncidentEventType.rushThatLosesYards,
      ].contains(this);

  bool get isFieldGoalEvents => [
        FootballMatchIncidentEventType.fieldGoalMissed,
        FootballMatchIncidentEventType.fieldGoalMade,
      ].contains(this);

  bool get isExtraPointEvents => [
        FootballMatchIncidentEventType.extraPointMissed,
        FootballMatchIncidentEventType.extraPointMade,
      ].contains(this);

  bool get isTwoPointsConversionEvents => [
        FootballMatchIncidentEventType.twoPointConversionMade,
        FootballMatchIncidentEventType.twoPointConversionMissed,
      ].contains(this);

  bool get isKickoffEvents => [
        FootballMatchIncidentEventType.kickoffWithTouchback,
        FootballMatchIncidentEventType.kickoffReturn,
        FootballMatchIncidentEventType.touchdownFromKickoff,
        FootballMatchIncidentEventType.safetyFromKickoff,
        FootballMatchIncidentEventType.fumbleFromKickoff,
        FootballMatchIncidentEventType.onsideKickSucceeds,
        FootballMatchIncidentEventType.onsideKickFails,
        FootballMatchIncidentEventType.touchdownFromFumbledKickoff,
      ].contains(this);

  bool get isPenaltyEvent => [
        FootballMatchIncidentEventType.preSnapFlag,
        FootballMatchIncidentEventType.postSnapFlag,
      ].contains(this);

  bool get isDriveStartOrEnd => [
        FootballMatchIncidentEventType.driveStarted,
        FootballMatchIncidentEventType.driveEnded,
      ].contains(this);

  bool get isPuntEvents => [
        FootballMatchIncidentEventType.puntBlocked,
        FootballMatchIncidentEventType.puntFairCatch,
        FootballMatchIncidentEventType.puntReturn,
        FootballMatchIncidentEventType.puntTouchback,
      ].contains(this);

  bool get isSafetyEvents => [
        FootballMatchIncidentEventType.safetyFromPass,
        FootballMatchIncidentEventType.safetyFromRush,
        FootballMatchIncidentEventType.safetyFromPunt,
      ].contains(this);

  /// we won't persist the following incidents
  /// exclude the incidents from the following list
  bool get isPersistingEvent => ![
        FootballMatchIncidentEventType.kickoffReturn,
        FootballMatchIncidentEventType.kickoffWithTouchback,
        FootballMatchIncidentEventType.fumbleFromKickoff,
        FootballMatchIncidentEventType.safetyFromKickoff,
        FootballMatchIncidentEventType.touchdownFromKickoff,
        FootballMatchIncidentEventType.onsideKickFails,
        FootballMatchIncidentEventType.onsideKickSucceeds,
        FootballMatchIncidentEventType.driveStarted,
        FootballMatchIncidentEventType.driveEnded,
        FootballMatchIncidentEventType.fumbleFromPunt,
        FootballMatchIncidentEventType.periodEnd,
        FootballMatchIncidentEventType.timeout,
        FootballMatchIncidentEventType.coinToss,
        FootballMatchIncidentEventType.awaitingOt,
        FootballMatchIncidentEventType.matchEnded,
        FootballMatchIncidentEventType.unknown,
      ].contains(this);

  bool get isPeriodEndOrOverTime => [
        FootballMatchIncidentEventType.periodEnd,
        FootballMatchIncidentEventType.awaitingOt,
      ].contains(this);

  bool get isDriveEndedOrMatchEnded => [
        FootballMatchIncidentEventType.driveEnded,
        FootballMatchIncidentEventType.matchEnded,
      ].contains(this);

  bool get isOnsideKickEvent => [
        FootballMatchIncidentEventType.onsideKickFails,
        FootballMatchIncidentEventType.onsideKickSucceeds,
      ].contains(this);

  bool get isUnderReviewEvent => [
        FootballMatchIncidentEventType.previousPlayOverturned,
        FootballMatchIncidentEventType.previousPlayStands,
        FootballMatchIncidentEventType.previousPlayUnderReview,
      ].contains(this);

  bool get isNoSummaryWhenCorrectedEvent => [
        FootballMatchIncidentEventType.driveStarted,
      ].contains(this);

  bool get isIncidentStartArrowHidden =>
      isPeriodEndOrOverTime ||
      isUnderReviewEvent ||
      [
        FootballMatchIncidentEventType.timeout,
        FootballMatchIncidentEventType.coinToss,
        FootballMatchIncidentEventType.driveStarted,
        FootballMatchIncidentEventType.driveEnded,
        FootballMatchIncidentEventType.matchEnded,
        FootballMatchIncidentEventType.unknown,
      ].contains(this);

  bool get isIncidentEndArrowHidden => [
        FootballMatchIncidentEventType.fumbleFromRush,
        FootballMatchIncidentEventType.touchdownFromRush,
        FootballMatchIncidentEventType.rushThatResultedInATurnover,
        FootballMatchIncidentEventType.safetyFromRush,
        FootballMatchIncidentEventType.doubleTurnover,
        FootballMatchIncidentEventType.unknown,
      ].contains(this);

  bool get isDownLinesHidden =>
      isExtraPointEvents ||
      isTwoPointsConversionEvents ||
      isKickoffEvents ||
      isUnderReviewEvent ||
      [
        FootballMatchIncidentEventType.timeout,
        FootballMatchIncidentEventType.awaitingOt,
        FootballMatchIncidentEventType.periodEnd,
        FootballMatchIncidentEventType.coinToss,
        FootballMatchIncidentEventType.driveEnded,
        FootballMatchIncidentEventType.driveStarted,
        FootballMatchIncidentEventType.unknown,
      ].contains(this);

  bool get isDistanceYardlineHidden =>
      isExtraPointEvents ||
      isTwoPointsConversionEvents ||
      isKickoffEvents ||
      isUnderReviewEvent ||
      [
        FootballMatchIncidentEventType.defensiveTwoPoint,
        FootballMatchIncidentEventType.awaitingOt,
        FootballMatchIncidentEventType.periodEnd,
        FootballMatchIncidentEventType.coinToss,
        FootballMatchIncidentEventType.driveEnded,
        FootballMatchIncidentEventType.driveStarted,
        FootballMatchIncidentEventType.unknown,
      ].contains(this);

  bool get isUseEndPossessionEvents => [
        FootballMatchIncidentEventType.puntTouchback,
        FootballMatchIncidentEventType.kickoffWithTouchback,
        FootballMatchIncidentEventType.touchdownFromPunt,
        FootballMatchIncidentEventType.touchdownFromBlockedPunt,
        FootballMatchIncidentEventType.touchdownFromKickoff,
        FootballMatchIncidentEventType.touchdownFromRush,
        FootballMatchIncidentEventType.safetyFromRush,
        FootballMatchIncidentEventType.safetyFromPass,
        FootballMatchIncidentEventType.touchdownFromPass,
        FootballMatchIncidentEventType.safetyFromSack,
        FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal,
        FootballMatchIncidentEventType.safetyFromPunt,
        FootballMatchIncidentEventType.safetyFromKickoff,
      ].contains(this);

  bool get isUseFieldColorEvents => [
        FootballMatchIncidentEventType.puntFairCatch,
        FootballMatchIncidentEventType.puntTouchback,
        FootballMatchIncidentEventType.passThatResultedInATurnover,
        FootballMatchIncidentEventType.rushThatResultedInATurnover,
        FootballMatchIncidentEventType.touchdownFromFumbledPunt,
        FootballMatchIncidentEventType.touchdownFromFumbledKickoff,
        FootballMatchIncidentEventType.fumbleFromPass,
        FootballMatchIncidentEventType.fumbleFromRush,
        FootballMatchIncidentEventType.fumbleFromKickoff,
        FootballMatchIncidentEventType.fumbleFromPunt,
        FootballMatchIncidentEventType.interception,
        FootballMatchIncidentEventType.kickoffWithTouchback,
        FootballMatchIncidentEventType.touchdownFromPickSix,
        FootballMatchIncidentEventType.touchdownFromScoopAndScore,
        FootballMatchIncidentEventType.touchdownFromFumbledPunt,
        FootballMatchIncidentEventType.touchdownFromFumbledKickoff,
      ].contains(this);

  bool get isDelayingEvents =>
      isPeriodEndOrOverTime ||
      isDriveEndedOrMatchEnded ||
      [
        FootballMatchIncidentEventType.driveStarted,
        FootballMatchIncidentEventType.timeout,
      ].contains(this);
}

@freezed
class FootballMatchIncidentModel with _$FootballMatchIncidentModel {
  const factory FootballMatchIncidentModel({
    @JsonKey(unknownEnumValue: FootballMatchIncidentEventType.unknown)
    required FootballMatchIncidentEventType event,
    required String eventId,
    SportLeague? league,
    FootballMatchIncidentState? start,
    FootballMatchIncidentState? end,
    FootballMatchIncidentStateMetaData? meta,
  }) = _FootballMatchIncidentModel;

  factory FootballMatchIncidentModel.fromJson(Map<String, dynamic> json) =>
      _$FootballMatchIncidentModelFromJson(json);
}

extension PlayID on FootballMatchIncidentModel {
  String get driveNumber => '${meta?.driveNumber ?? 0}';

  String get driveId {
    /// we receive start/end null for match_ended
    /// so we need to hardcode the driveId here
    if (event == FootballMatchIncidentEventType.matchEnded) {
      return 'match-ended';
    }

    final driveId = '${drivePossession.name}-$driveNumber';

    if (event.isKickoffEvents) {
      return '$driveId-kickoff';
    }

    if (isEvenPeriodEnd) {
      return '$driveId-period-end';
    }

    if (event == FootballMatchIncidentEventType.awaitingOt) {
      return '$driveId-awaiting-ot';
    }

    if (event == FootballMatchIncidentEventType.coinToss) {
      return '$driveId-coin-toss';
    }

    return driveId;
  }

  String get playNumber => '${meta?.playNumber}';

  HomeOrAway? get side => meta?.side;

  HomeOrAway get drivePossession {
    if (event.isKickoffEvents) {
      return end!.possession ?? HomeOrAway.unknown;
    }
    return start!.possession ?? HomeOrAway.unknown;
  }

  String get netYards => '${meta?.netYards ?? ''}';

  bool get isCorrectedPlay => meta?.correction ?? false;

  HomeOrAway get coinTossWinner => meta?.winner ?? HomeOrAway.unknown;

  HomeOrAway get coinTossReceiving => meta?.receiving ?? HomeOrAway.unknown;
}

extension FootballEventsCategory on FootballMatchIncidentModel {
  bool get isScoringPlay =>
      (event.name ?? '').toLowerCase().contains('touchdown') ||
      [
        FootballMatchIncidentEventType.safetyFromPass,
        FootballMatchIncidentEventType.safetyFromRush,
        FootballMatchIncidentEventType.fieldGoalMade,
        FootballMatchIncidentEventType.twoPointConversionMade,
      ].contains(event);

  bool get isKickOff => [
        FootballMatchIncidentEventType.kickoffReturn,
        FootballMatchIncidentEventType.kickoffWithTouchback,
        FootballMatchIncidentEventType.fumbleFromKickoff,
        FootballMatchIncidentEventType.touchdownFromKickoff,
        FootballMatchIncidentEventType.safetyFromKickoff,
      ].contains(event);

  bool get isNextEventKickOff =>
      [FootballMatchIncidentEventType.coinToss].contains(event) ||
      isFieldGoalEvents ||
      isTwoPointConversionEvents ||
      isExtraPointEvents ||
      isSafetyEvents;

  bool get isPenalty => [
        FootballMatchIncidentEventType.preSnapFlag,
        FootballMatchIncidentEventType.postSnapFlag,
      ].contains(event);

  bool get isExtraPointOrTwoPointConversion => [
        FootballMatchIncidentEventType.extraPointMade,
        FootballMatchIncidentEventType.extraPointMissed,
        FootballMatchIncidentEventType.twoPointConversionMade,
        FootballMatchIncidentEventType.twoPointConversionMissed,
      ].contains(event);

  bool get isInterception =>
      event == FootballMatchIncidentEventType.interception;

  bool get isSafetyEvents => [
        FootballMatchIncidentEventType.safetyFromRush,
        FootballMatchIncidentEventType.safetyFromPass,
        FootballMatchIncidentEventType.safetyFromPunt,
        FootballMatchIncidentEventType.safetyFromKickoff,
      ].contains(event);

  bool get isFieldGoalEvents => [
        FootballMatchIncidentEventType.fieldGoalMissed,
        FootballMatchIncidentEventType.fieldGoalMade,
      ].contains(event);

  bool get isTwoPointConversionEvents => [
        FootballMatchIncidentEventType.twoPointConversionMissed,
        FootballMatchIncidentEventType.twoPointConversionMade,
      ].contains(event);

  bool get isExtraPointEvents => [
        FootballMatchIncidentEventType.extraPointMissed,
        FootballMatchIncidentEventType.extraPointMade,
      ].contains(event);

  bool get isTouchdownEvents => [
        FootballMatchIncidentEventType.touchdownFromRush,
        FootballMatchIncidentEventType.touchdownFromPass,
        FootballMatchIncidentEventType.touchdownFromScoopAndScore,
        FootballMatchIncidentEventType.touchdownFromPickSix,
        FootballMatchIncidentEventType.touchdownFromKickoff,
        FootballMatchIncidentEventType.touchdownFromBlockedPunt,
        FootballMatchIncidentEventType.touchdownFromPunt,
      ].contains(event);

  bool get isTurnoverPlays => [
        FootballMatchIncidentEventType.interception,
        FootballMatchIncidentEventType.fumbleFromRush,
        FootballMatchIncidentEventType.fumbleFromPass,
        FootballMatchIncidentEventType.fumbleFromPunt,
        FootballMatchIncidentEventType.fumbleFromKickoff,
        FootballMatchIncidentEventType.rushThatResultedInATurnover,
        FootballMatchIncidentEventType.passThatResultedInATurnover,
        FootballMatchIncidentEventType.doubleTurnover,
      ].contains(event);

  bool get isPuntPlays => [
        FootballMatchIncidentEventType.puntBlocked,
        FootballMatchIncidentEventType.puntReturn,
        FootballMatchIncidentEventType.puntFairCatch,
        FootballMatchIncidentEventType.fumbleFromPunt,
      ].contains(event);

  bool get isHalfTime =>
      event == FootballMatchIncidentEventType.periodEnd &&
      meta != null &&
      meta?.period == 2;

  bool get isEvenPeriodEnd =>
      event == FootballMatchIncidentEventType.periodEnd &&
      meta != null &&
      meta!.period != null &&
      (meta!.period == 2 || meta!.period! > 3);

  bool get isFirstOrThirdPeriodEnd =>
      event == FootballMatchIncidentEventType.periodEnd &&
      meta != null &&
      meta!.period != null &&
      (meta!.period == 1 || meta!.period == 3);

  bool get isStandAloneEvent =>
      [
        FootballMatchIncidentEventType.awaitingOt,
        FootballMatchIncidentEventType.matchEnded,
        FootballMatchIncidentEventType.coinToss,
      ].contains(event) ||
      event.isKickoffEvents ||
      isEvenPeriodEnd;
}

@freezed
class FootballMatchIncidentState with _$FootballMatchIncidentState {
  const factory FootballMatchIncidentState({
    int? distance,
    int? down,
    HomeOrAway? possession,
    HomeOrAway? side,
    int? yardline,
  }) = _FootballMatchIncidentState;

  factory FootballMatchIncidentState.fromJson(Map<String, dynamic> json) =>
      _$FootballMatchIncidentStateFromJson(json);
}

@freezed
class FootballMatchIncidentStateMetaData
    with _$FootballMatchIncidentStateMetaData {
  const factory FootballMatchIncidentStateMetaData({
    required int driveNumber,
    required int playNumber,
    int? period,
    bool? correction,
    bool? goalToGo,
    HomeOrAway? side,
    HomeOrAway? winner,
    HomeOrAway? receiving,
    int? netYards,
  }) = _FootballMatchIncidentStateMetaData;

  factory FootballMatchIncidentStateMetaData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FootballMatchIncidentStateMetaDataFromJson(json);
}
