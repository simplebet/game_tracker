import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/enums.dart';

part 'basketball_match_incident_model.freezed.dart';
part 'basketball_match_incident_model.g.dart';

enum BasketballMatchIncidentEventType {
  @JsonValue('field_goal_made_two')
  fieldGoalMadeTwo,

  @JsonValue('field_goal_missed_two')
  fieldGoalMissedTwo,

  @JsonValue('field_goal_made_three')
  fieldGoalMadeThree,

  @JsonValue('field_goal_missed_three')
  fieldGoalMissedThree,

  @JsonValue('defensive_rebound')
  defensiveRebound,

  @JsonValue('offensive_rebound')
  offensiveRebound,

  @JsonValue('turnover')
  turnover,

  @JsonValue('possession_change')
  possessionChange,

  @JsonValue('tip_off')
  tipOff,

  @JsonValue('foul_floor')
  foulFloor,

  @JsonValue('foul_shooting_two')
  foulShootingTwo,

  @JsonValue('foul_shooting_three')
  foulShootingThree,

  @JsonValue('foul_offensive')
  foulOffensive,

  @JsonValue('foul_technical_a')
  foulTechnicalA,

  @JsonValue('foul_technical_b')
  foulTechnicalB,

  @JsonValue('foul_flagrant')
  foulFlagrant,

  @JsonValue('foul_unknown')
  foulUnknown,

  @JsonValue('pass_in')
  passIn,

  @JsonValue('free_throw_awarded_one')
  freeThrowAwardedOne,

  @JsonValue('free_throw_awarded_two')
  freeThrowAwardedTwo,

  @JsonValue('free_throw_awarded_three')
  freeThrowAwardedThree,

  @JsonValue('free_throw_awarded_one_and_one')
  freeThrowAwardedOneAndOne,

  @JsonValue('timeout_team')
  timeoutTeam,

  @JsonValue('timeout_official')
  timeoutOfficial,

  @JsonValue('jump_ball')
  jumpBall,

  @JsonValue('period_end')
  periodEnd,

  @JsonValue('period_start')
  periodStart,

  @JsonValue('match_ended')
  matchEnded,

  @JsonValue('awaiting_ot')
  awaitingOt,

  @JsonValue('free_throw_made')
  freeThrowMade,

  @JsonValue('free_throw_missed')
  freeThrowMissed,

  @JsonValue('player_at_line')
  playerAtLine,

  @JsonValue('free_throw_ended')
  freeThrowEnded,

  @JsonValue('match_state_corrected')
  matchStateCorrected,

  @JsonValue('clock_started')
  clockStarted,

  @JsonValue('foul_take')
  foulTake,

  unknown;

  String get label {
    switch (this) {
      case BasketballMatchIncidentEventType.foulTechnicalA:
        return 'Technical foul';
      case BasketballMatchIncidentEventType.foulTechnicalB:
        return 'Technical foul';
      case BasketballMatchIncidentEventType.foulFlagrant:
        return 'Flagrant foul';
      case BasketballMatchIncidentEventType.foulFloor:
        return 'Floor foul';
      case BasketballMatchIncidentEventType.foulShootingTwo:
        return 'Shooting foul';
      case BasketballMatchIncidentEventType.foulShootingThree:
        return 'Shooting foul';
      case BasketballMatchIncidentEventType.foulOffensive:
        return 'Offensive foul';
      case BasketballMatchIncidentEventType.foulUnknown:
        return 'Foul';
      case BasketballMatchIncidentEventType.foulTake:
        return 'Take Foul';
      default:
        return toString().split('.').last;
    }
  }
}

extension BasketballEventsCategory on BasketballMatchIncidentEventType {
  bool get isFieldGoalAttemptEvents => [
        BasketballMatchIncidentEventType.fieldGoalMadeTwo,
        BasketballMatchIncidentEventType.fieldGoalMadeThree,
        BasketballMatchIncidentEventType.fieldGoalMissedTwo,
        BasketballMatchIncidentEventType.fieldGoalMissedThree,
      ].contains(this);

  bool get isFreeThrowEvents => [
        BasketballMatchIncidentEventType.playerAtLine,
        BasketballMatchIncidentEventType.freeThrowMade,
        BasketballMatchIncidentEventType.freeThrowMissed,
        BasketballMatchIncidentEventType.freeThrowEnded,
      ].contains(this);

  bool get isFreeThrowResultEvents => [
        BasketballMatchIncidentEventType.freeThrowMade,
        BasketballMatchIncidentEventType.freeThrowMissed,
      ].contains(this);

  bool get isFreeThrowEnded =>
      this == BasketballMatchIncidentEventType.freeThrowEnded;

  bool get isBallMissedEvents => [
        BasketballMatchIncidentEventType.fieldGoalMissedThree,
        BasketballMatchIncidentEventType.fieldGoalMissedTwo,
        BasketballMatchIncidentEventType.freeThrowMissed,
      ].contains(this);

  bool get isFreeThrowAwardedEvents => [
        BasketballMatchIncidentEventType.freeThrowAwardedOne,
        BasketballMatchIncidentEventType.freeThrowAwardedTwo,
        BasketballMatchIncidentEventType.freeThrowAwardedThree,
        BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne,
      ].contains(this);

  bool get isTwoPointFieldGoalEvents => [
        BasketballMatchIncidentEventType.fieldGoalMadeTwo,
        BasketballMatchIncidentEventType.fieldGoalMissedTwo,
      ].contains(this);

  bool get isThreePointFieldGoalEvents => [
        BasketballMatchIncidentEventType.fieldGoalMadeThree,
        BasketballMatchIncidentEventType.fieldGoalMissedThree,
      ].contains(this);
}

enum FoulType {
  unknown,

  @JsonValue('common')
  common,

  @JsonValue('floor')
  floor,

  @JsonValue('shooting')
  shooting,

  @JsonValue('offensive')
  offensive,

  @JsonValue('technical')
  technical,

  @JsonValue('technical_class_a')
  technicalClassA,

  @JsonValue('technical_class_b')
  technicalClassB,

  @JsonValue('flagrant')
  flagrant,

  @JsonValue('one_and_one')
  oneAndOne,

  @JsonValue('take')
  take,
}

extension BasketballCategory on BasketballMatchIncidentModel {
  bool get isFreeThrowEnded =>
      event == BasketballMatchIncidentEventType.freeThrowEnded ||
      (meta?.remaining != null && meta!.remaining! == 0);
}

@freezed
class BasketballMatchIncidentModel with _$BasketballMatchIncidentModel {
  const factory BasketballMatchIncidentModel({
    @JsonKey(unknownEnumValue: BasketballMatchIncidentEventType.unknown)
    required BasketballMatchIncidentEventType event,
    @JsonKey(name: 'event_id') required String eventId,
    SportLeague? league,
    BasketballMatchIncidentStateMetaData? meta,
  }) = _BasketballMatchIncidentModel;

  factory BasketballMatchIncidentModel.fromJson(Map<String, dynamic> json) =>
      _$BasketballMatchIncidentModelFromJson(json);
}

@freezed
class BasketballMatchIncidentStateMetaData
    with _$BasketballMatchIncidentStateMetaData {
  const factory BasketballMatchIncidentStateMetaData({
    HomeOrAway? side,
    int? period,
    int? attempts,
    int? attempt,
    int? remaining,
    int? points,
    HomeOrAway? possession,
    HomeOrAway? possessionArrow,
    FoulType? type,
    String? reason,
    int? gameClock,
    int? homeTeamFouls,
    int? awayTeamFouls,
    bool? homeTeamBonus,
    bool? awayTeamBonus,
    bool? homeTeamDoubleBonus,
    bool? awayTeamDoubleBonus,
    int? homeScore,
    int? awayScore,
  }) = _BasketballMatchIncidentStateMetaData;

  factory BasketballMatchIncidentStateMetaData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BasketballMatchIncidentStateMetaDataFromJson(json);
}
