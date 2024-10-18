// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basketball_match_incident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketballMatchIncidentModelImpl _$$BasketballMatchIncidentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BasketballMatchIncidentModelImpl(
      event: $enumDecode(
          _$BasketballMatchIncidentEventTypeEnumMap, json['event'],
          unknownValue: BasketballMatchIncidentEventType.unknown),
      eventId: json['event_id'] as String,
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']),
      meta: json['meta'] == null
          ? null
          : BasketballMatchIncidentStateMetaData.fromJson(
              json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BasketballMatchIncidentModelImplToJson(
        _$BasketballMatchIncidentModelImpl instance) =>
    <String, dynamic>{
      'event': _$BasketballMatchIncidentEventTypeEnumMap[instance.event]!,
      'event_id': instance.eventId,
      'league': _$SportLeagueEnumMap[instance.league],
      'meta': instance.meta?.toJson(),
    };

const _$BasketballMatchIncidentEventTypeEnumMap = {
  BasketballMatchIncidentEventType.fieldGoalMadeTwo: 'field_goal_made_two',
  BasketballMatchIncidentEventType.fieldGoalMissedTwo: 'field_goal_missed_two',
  BasketballMatchIncidentEventType.fieldGoalMadeThree: 'field_goal_made_three',
  BasketballMatchIncidentEventType.fieldGoalMissedThree:
      'field_goal_missed_three',
  BasketballMatchIncidentEventType.defensiveRebound: 'defensive_rebound',
  BasketballMatchIncidentEventType.offensiveRebound: 'offensive_rebound',
  BasketballMatchIncidentEventType.turnover: 'turnover',
  BasketballMatchIncidentEventType.possessionChange: 'possession_change',
  BasketballMatchIncidentEventType.tipOff: 'tip_off',
  BasketballMatchIncidentEventType.foulFloor: 'foul_floor',
  BasketballMatchIncidentEventType.foulShootingTwo: 'foul_shooting_two',
  BasketballMatchIncidentEventType.foulShootingThree: 'foul_shooting_three',
  BasketballMatchIncidentEventType.foulOffensive: 'foul_offensive',
  BasketballMatchIncidentEventType.foulTechnicalA: 'foul_technical_a',
  BasketballMatchIncidentEventType.foulTechnicalB: 'foul_technical_b',
  BasketballMatchIncidentEventType.foulFlagrant: 'foul_flagrant',
  BasketballMatchIncidentEventType.foulUnknown: 'foul_unknown',
  BasketballMatchIncidentEventType.passIn: 'pass_in',
  BasketballMatchIncidentEventType.freeThrowAwardedOne:
      'free_throw_awarded_one',
  BasketballMatchIncidentEventType.freeThrowAwardedTwo:
      'free_throw_awarded_two',
  BasketballMatchIncidentEventType.freeThrowAwardedThree:
      'free_throw_awarded_three',
  BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne:
      'free_throw_awarded_one_and_one',
  BasketballMatchIncidentEventType.timeoutTeam: 'timeout_team',
  BasketballMatchIncidentEventType.timeoutOfficial: 'timeout_official',
  BasketballMatchIncidentEventType.jumpBall: 'jump_ball',
  BasketballMatchIncidentEventType.periodEnd: 'period_end',
  BasketballMatchIncidentEventType.periodStart: 'period_start',
  BasketballMatchIncidentEventType.matchEnded: 'match_ended',
  BasketballMatchIncidentEventType.awaitingOt: 'awaiting_ot',
  BasketballMatchIncidentEventType.freeThrowMade: 'free_throw_made',
  BasketballMatchIncidentEventType.freeThrowMissed: 'free_throw_missed',
  BasketballMatchIncidentEventType.playerAtLine: 'player_at_line',
  BasketballMatchIncidentEventType.freeThrowEnded: 'free_throw_ended',
  BasketballMatchIncidentEventType.matchStateCorrected: 'match_state_corrected',
  BasketballMatchIncidentEventType.clockStarted: 'clock_started',
  BasketballMatchIncidentEventType.foulTake: 'foul_take',
  BasketballMatchIncidentEventType.unknown: 'unknown',
};

const _$SportLeagueEnumMap = {
  SportLeague.unknown: 'unknown',
  SportLeague.nfl: 'nfl',
  SportLeague.nba: 'nba',
  SportLeague.mlb: 'mlb',
  SportLeague.cfb: 'cfb',
  SportLeague.cbb: 'cbb',
  SportLeague.ifl: 'ifl',
  SportLeague.liv: 'liv',
};

_$BasketballMatchIncidentStateMetaDataImpl
    _$$BasketballMatchIncidentStateMetaDataImplFromJson(
            Map<String, dynamic> json) =>
        _$BasketballMatchIncidentStateMetaDataImpl(
          side: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['side']),
          period: (json['period'] as num?)?.toInt(),
          attempts: (json['attempts'] as num?)?.toInt(),
          attempt: (json['attempt'] as num?)?.toInt(),
          remaining: (json['remaining'] as num?)?.toInt(),
          points: (json['points'] as num?)?.toInt(),
          possession:
              $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession']),
          possessionArrow: $enumDecodeNullable(
              _$HomeOrAwayEnumMap, json['possession_arrow']),
          type: $enumDecodeNullable(_$FoulTypeEnumMap, json['type']),
          reason: json['reason'] as String?,
          gameClock: (json['game_clock'] as num?)?.toInt(),
          homeTeamFouls: (json['home_team_fouls'] as num?)?.toInt(),
          awayTeamFouls: (json['away_team_fouls'] as num?)?.toInt(),
          homeTeamBonus: json['home_team_bonus'] as bool?,
          awayTeamBonus: json['away_team_bonus'] as bool?,
          homeTeamDoubleBonus: json['home_team_double_bonus'] as bool?,
          awayTeamDoubleBonus: json['away_team_double_bonus'] as bool?,
          homeScore: (json['home_score'] as num?)?.toInt(),
          awayScore: (json['away_score'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$BasketballMatchIncidentStateMetaDataImplToJson(
        _$BasketballMatchIncidentStateMetaDataImpl instance) =>
    <String, dynamic>{
      'side': _$HomeOrAwayEnumMap[instance.side],
      'period': instance.period,
      'attempts': instance.attempts,
      'attempt': instance.attempt,
      'remaining': instance.remaining,
      'points': instance.points,
      'possession': _$HomeOrAwayEnumMap[instance.possession],
      'possession_arrow': _$HomeOrAwayEnumMap[instance.possessionArrow],
      'type': _$FoulTypeEnumMap[instance.type],
      'reason': instance.reason,
      'game_clock': instance.gameClock,
      'home_team_fouls': instance.homeTeamFouls,
      'away_team_fouls': instance.awayTeamFouls,
      'home_team_bonus': instance.homeTeamBonus,
      'away_team_bonus': instance.awayTeamBonus,
      'home_team_double_bonus': instance.homeTeamDoubleBonus,
      'away_team_double_bonus': instance.awayTeamDoubleBonus,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
    };

const _$HomeOrAwayEnumMap = {
  HomeOrAway.unknown: 'unknown',
  HomeOrAway.home: 'home',
  HomeOrAway.away: 'away',
  HomeOrAway.none: 'none',
};

const _$FoulTypeEnumMap = {
  FoulType.unknown: 'unknown',
  FoulType.common: 'common',
  FoulType.floor: 'floor',
  FoulType.shooting: 'shooting',
  FoulType.offensive: 'offensive',
  FoulType.technical: 'technical',
  FoulType.technicalClassA: 'technical_class_a',
  FoulType.technicalClassB: 'technical_class_b',
  FoulType.flagrant: 'flagrant',
  FoulType.oneAndOne: 'one_and_one',
  FoulType.take: 'take',
};
