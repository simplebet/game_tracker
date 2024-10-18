// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'football_match_incident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FootballMatchIncidentModelImpl _$$FootballMatchIncidentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FootballMatchIncidentModelImpl(
      event: $enumDecode(_$FootballMatchIncidentEventTypeEnumMap, json['event'],
          unknownValue: FootballMatchIncidentEventType.unknown),
      eventId: json['event_id'] as String,
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']),
      start: json['start'] == null
          ? null
          : FootballMatchIncidentState.fromJson(
              json['start'] as Map<String, dynamic>),
      end: json['end'] == null
          ? null
          : FootballMatchIncidentState.fromJson(
              json['end'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : FootballMatchIncidentStateMetaData.fromJson(
              json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FootballMatchIncidentModelImplToJson(
        _$FootballMatchIncidentModelImpl instance) =>
    <String, dynamic>{
      'event': _$FootballMatchIncidentEventTypeEnumMap[instance.event]!,
      'event_id': instance.eventId,
      'league': _$SportLeagueEnumMap[instance.league],
      'start': instance.start?.toJson(),
      'end': instance.end?.toJson(),
      'meta': instance.meta?.toJson(),
    };

const _$FootballMatchIncidentEventTypeEnumMap = {
  FootballMatchIncidentEventType.passThatGainsYards: 'pass_that_gains_yards',
  FootballMatchIncidentEventType.rushThatGainsYards: 'rush_that_gains_yards',
  FootballMatchIncidentEventType.passThatResultedInAFirstDown:
      'pass_that_resulted_in_a_first_down',
  FootballMatchIncidentEventType.rushThatResultedInAFirstDown:
      'rush_that_resulted_in_a_first_down',
  FootballMatchIncidentEventType.passThatLosesYards: 'pass_that_loses_yards',
  FootballMatchIncidentEventType.rushThatLosesYards: 'rush_that_loses_yards',
  FootballMatchIncidentEventType.extraPointMade: 'extra_point_made',
  FootballMatchIncidentEventType.extraPointMissed: 'extra_point_missed',
  FootballMatchIncidentEventType.puntReturn: 'punt_return',
  FootballMatchIncidentEventType.puntFairCatch: 'punt_fair_catch',
  FootballMatchIncidentEventType.fieldGoalMissed: 'field_goal_missed',
  FootballMatchIncidentEventType.fieldGoalMade: 'field_goal_made',
  FootballMatchIncidentEventType.fumbleFromRush: 'fumble_from_rush',
  FootballMatchIncidentEventType.fumbleFromPass: 'fumble_from_pass',
  FootballMatchIncidentEventType.fumbleFromKickoff: 'fumble_from_kickoff',
  FootballMatchIncidentEventType.fumbleFromPunt: 'fumble_from_punt',
  FootballMatchIncidentEventType.interception: 'interception',
  FootballMatchIncidentEventType.preSnapFlag: 'pre_snap_flag',
  FootballMatchIncidentEventType.postSnapFlag: 'post_snap_flag',
  FootballMatchIncidentEventType.touchdownFromRush: 'touchdown_from_rush',
  FootballMatchIncidentEventType.touchdownFromBlockedPunt:
      'touchdown_from_blocked_punt',
  FootballMatchIncidentEventType.touchdownFromPass: 'touchdown_from_pass',
  FootballMatchIncidentEventType.touchdownFromPickSix:
      'touchdown_from_pick_six',
  FootballMatchIncidentEventType.touchdownFromScoopAndScore:
      'touchdown_from_scoop_and_score',
  FootballMatchIncidentEventType.touchdownFromPunt: 'touchdown_from_punt',
  FootballMatchIncidentEventType.touchdownFromKickoff: 'touchdown_from_kickoff',
  FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal:
      'touchdown_from_returned_field_goal',
  FootballMatchIncidentEventType.touchdownFromFumbledKickoff:
      'touchdown_from_fumbled_kickoff',
  FootballMatchIncidentEventType.touchdownFromFumbledPunt:
      'touchdown_from_fumbled_punt',
  FootballMatchIncidentEventType.safetyFromRush: 'safety_from_rush',
  FootballMatchIncidentEventType.safetyFromPass: 'safety_from_pass',
  FootballMatchIncidentEventType.safetyFromKickoff: 'safety_from_kickoff',
  FootballMatchIncidentEventType.safetyFromPunt: 'safety_from_punt',
  FootballMatchIncidentEventType.safetyFromBlockedPunt:
      'safety_from_blocked_punt',
  FootballMatchIncidentEventType.safetyFromSack: 'safety_from_sack',
  FootballMatchIncidentEventType.twoPointConversionMade:
      'two_point_conversion_made',
  FootballMatchIncidentEventType.twoPointConversionMissed:
      'two_point_conversion_missed',
  FootballMatchIncidentEventType.coinToss: 'coin_toss',
  FootballMatchIncidentEventType.sack: 'sack',
  FootballMatchIncidentEventType.doubleTurnover: 'double_turnover',
  FootballMatchIncidentEventType.kickoffWithTouchback: 'kickoff_with_touchback',
  FootballMatchIncidentEventType.kickoffReturn: 'kickoff_return',
  FootballMatchIncidentEventType.rushThatResultedInATurnover:
      'rush_that_resulted_in_a_turnover',
  FootballMatchIncidentEventType.passThatResultedInATurnover:
      'pass_that_resulted_in_a_turnover',
  FootballMatchIncidentEventType.passIncomplete: 'pass_incomplete',
  FootballMatchIncidentEventType.puntBlocked: 'punt_blocked',
  FootballMatchIncidentEventType.puntTouchback: 'punt_touchback',
  FootballMatchIncidentEventType.periodEnd: 'period_end',
  FootballMatchIncidentEventType.timeout: 'timeout',
  FootballMatchIncidentEventType.driveStarted: 'drive_started',
  FootballMatchIncidentEventType.driveEnded: 'drive_ended',
  FootballMatchIncidentEventType.awaitingOt: 'awaiting_ot',
  FootballMatchIncidentEventType.onsideKickFails: 'onside_kick_fails',
  FootballMatchIncidentEventType.onsideKickSucceeds: 'onside_kick_succeeds',
  FootballMatchIncidentEventType.matchEnded: 'match_ended',
  FootballMatchIncidentEventType.defensiveTwoPoint: 'defensive_two_point',
  FootballMatchIncidentEventType.previousPlayUnderReview:
      'previous_play_under_review',
  FootballMatchIncidentEventType.previousPlayStands: 'previous_play_stands',
  FootballMatchIncidentEventType.previousPlayOverturned:
      'previous_play_overturned',
  FootballMatchIncidentEventType.unknown: 'unknown',
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

_$FootballMatchIncidentStateImpl _$$FootballMatchIncidentStateImplFromJson(
        Map<String, dynamic> json) =>
    _$FootballMatchIncidentStateImpl(
      distance: (json['distance'] as num?)?.toInt(),
      down: (json['down'] as num?)?.toInt(),
      possession: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession']),
      side: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['side']),
      yardline: (json['yardline'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FootballMatchIncidentStateImplToJson(
        _$FootballMatchIncidentStateImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'down': instance.down,
      'possession': _$HomeOrAwayEnumMap[instance.possession],
      'side': _$HomeOrAwayEnumMap[instance.side],
      'yardline': instance.yardline,
    };

const _$HomeOrAwayEnumMap = {
  HomeOrAway.unknown: 'unknown',
  HomeOrAway.home: 'home',
  HomeOrAway.away: 'away',
  HomeOrAway.none: 'none',
};

_$FootballMatchIncidentStateMetaDataImpl
    _$$FootballMatchIncidentStateMetaDataImplFromJson(
            Map<String, dynamic> json) =>
        _$FootballMatchIncidentStateMetaDataImpl(
          driveNumber: (json['drive_number'] as num).toInt(),
          playNumber: (json['play_number'] as num).toInt(),
          period: (json['period'] as num?)?.toInt(),
          correction: json['correction'] as bool?,
          goalToGo: json['goal_to_go'] as bool?,
          side: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['side']),
          winner: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['winner']),
          receiving:
              $enumDecodeNullable(_$HomeOrAwayEnumMap, json['receiving']),
          netYards: (json['net_yards'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$FootballMatchIncidentStateMetaDataImplToJson(
        _$FootballMatchIncidentStateMetaDataImpl instance) =>
    <String, dynamic>{
      'drive_number': instance.driveNumber,
      'play_number': instance.playNumber,
      'period': instance.period,
      'correction': instance.correction,
      'goal_to_go': instance.goalToGo,
      'side': _$HomeOrAwayEnumMap[instance.side],
      'winner': _$HomeOrAwayEnumMap[instance.winner],
      'receiving': _$HomeOrAwayEnumMap[instance.receiving],
      'net_yards': instance.netYards,
    };
