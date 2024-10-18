// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsUpdateResponseModelImpl _$$StatsUpdateResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatsUpdateResponseModelImpl(
      league: $enumDecode(_$SportLeagueEnumMap, json['league']),
      match: json['match'] == null
          ? null
          : StatsUpdateModel.fromJson(json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatsUpdateResponseModelImplToJson(
        _$StatsUpdateResponseModelImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'match': instance.match?.toJson(),
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

_$StatsUpdateModelImpl _$$StatsUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatsUpdateModelImpl(
      awayTeam: json['away_team'] == null
          ? null
          : TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
      eventId: json['event_id'] as String?,
      homeTeam: json['home_team'] == null
          ? null
          : TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
      id: json['id'] as String?,
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']),
      players: json['players'] as List<dynamic>?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      match: json['match'] == null
          ? null
          : StatsUpdateMatchModel.fromJson(
              json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatsUpdateModelImplToJson(
        _$StatsUpdateModelImpl instance) =>
    <String, dynamic>{
      'away_team': instance.awayTeam?.toJson(),
      'event_id': instance.eventId,
      'home_team': instance.homeTeam?.toJson(),
      'id': instance.id,
      'league': _$SportLeagueEnumMap[instance.league],
      'players': instance.players,
      'start_time': instance.startTime?.toIso8601String(),
      'match': instance.match?.toJson(),
    };

_$StatsUpdateMatchModelImpl _$$StatsUpdateMatchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatsUpdateMatchModelImpl(
      awayTwoPointMakes: (json['away_two_point_makes'] as num).toInt(),
      homeTwoPointMakes: (json['home_two_point_makes'] as num).toInt(),
      awaySteals: (json['away_steals'] as num).toInt(),
      homeSteals: (json['home_steals'] as num).toInt(),
      awayOffensiveRebounds: (json['away_offensive_rebounds'] as num).toInt(),
      homeOffensiveRebounds: (json['home_offensive_rebounds'] as num).toInt(),
      awayFieldGoalMakes: (json['away_field_goal_makes'] as num).toInt(),
      homeFieldGoalMakes: (json['home_field_goal_makes'] as num).toInt(),
      awayFieldGoalAttempts: (json['away_field_goal_attempts'] as num).toInt(),
      homeFieldGoalAttempts: (json['home_field_goal_attempts'] as num).toInt(),
      awayTwoPointAttempts: (json['away_two_point_attempts'] as num).toInt(),
      homeTwoPointAttempts: (json['home_two_point_attempts'] as num).toInt(),
      awayThreePointMakes: (json['away_three_point_makes'] as num).toInt(),
      homeThreePointMakes: (json['home_three_point_makes'] as num).toInt(),
      awayScore: (json['away_score'] as num).toInt(),
      homeScore: (json['home_score'] as num).toInt(),
      awayFieldGoalPercentage:
          (json['away_field_goal_percentage'] as num).toDouble(),
      homeFieldGoalPercentage:
          (json['home_field_goal_percentage'] as num).toDouble(),
      awayFouls: (json['away_fouls'] as num).toInt(),
      homeFouls: (json['home_fouls'] as num).toInt(),
      awayTurnovers: (json['away_turnovers'] as num).toInt(),
      homeTurnovers: (json['home_turnovers'] as num).toInt(),
      awayFreeThrowAttempts: (json['away_free_throw_attempts'] as num).toInt(),
      homeFreeThrowAttempts: (json['home_free_throw_attempts'] as num).toInt(),
      awayTwoPointPercentage:
          (json['away_two_point_percentage'] as num).toDouble(),
      homeTwoPointPercentage:
          (json['home_two_point_percentage'] as num).toDouble(),
      awayAssists: (json['away_assists'] as num).toInt(),
      homeAssists: (json['home_assists'] as num).toInt(),
      awayBlocks: (json['away_blocks'] as num).toInt(),
      homeBlocks: (json['home_blocks'] as num).toInt(),
      awayFreeThrowMakes: (json['away_free_throw_makes'] as num).toInt(),
      homeFreeThrowMakes: (json['home_free_throw_makes'] as num).toInt(),
      awayDefensiveRebounds: (json['away_defensive_rebounds'] as num).toInt(),
      homeDefensiveRebounds: (json['home_defensive_rebounds'] as num).toInt(),
      awayFreeThrowPercentage:
          (json['away_free_throw_percentage'] as num).toDouble(),
      homeFreeThrowPercentage:
          (json['home_free_throw_percentage'] as num).toDouble(),
      awayThreePointPercentage:
          (json['away_three_point_percentage'] as num).toDouble(),
      homeThreePointPercentage:
          (json['home_three_point_percentage'] as num).toDouble(),
      awayThreePointAttempts:
          (json['away_three_point_attempts'] as num).toInt(),
      homeThreePointAttempts:
          (json['home_three_point_attempts'] as num).toInt(),
      currentPeriod: (json['current_period'] as num).toInt(),
      status: json['status'] as String,
      periodScores: (json['period_scores'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, PeriodScoreModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$StatsUpdateMatchModelImplToJson(
        _$StatsUpdateMatchModelImpl instance) =>
    <String, dynamic>{
      'away_two_point_makes': instance.awayTwoPointMakes,
      'home_two_point_makes': instance.homeTwoPointMakes,
      'away_steals': instance.awaySteals,
      'home_steals': instance.homeSteals,
      'away_offensive_rebounds': instance.awayOffensiveRebounds,
      'home_offensive_rebounds': instance.homeOffensiveRebounds,
      'away_field_goal_makes': instance.awayFieldGoalMakes,
      'home_field_goal_makes': instance.homeFieldGoalMakes,
      'away_field_goal_attempts': instance.awayFieldGoalAttempts,
      'home_field_goal_attempts': instance.homeFieldGoalAttempts,
      'away_two_point_attempts': instance.awayTwoPointAttempts,
      'home_two_point_attempts': instance.homeTwoPointAttempts,
      'away_three_point_makes': instance.awayThreePointMakes,
      'home_three_point_makes': instance.homeThreePointMakes,
      'away_score': instance.awayScore,
      'home_score': instance.homeScore,
      'away_field_goal_percentage': instance.awayFieldGoalPercentage,
      'home_field_goal_percentage': instance.homeFieldGoalPercentage,
      'away_fouls': instance.awayFouls,
      'home_fouls': instance.homeFouls,
      'away_turnovers': instance.awayTurnovers,
      'home_turnovers': instance.homeTurnovers,
      'away_free_throw_attempts': instance.awayFreeThrowAttempts,
      'home_free_throw_attempts': instance.homeFreeThrowAttempts,
      'away_two_point_percentage': instance.awayTwoPointPercentage,
      'home_two_point_percentage': instance.homeTwoPointPercentage,
      'away_assists': instance.awayAssists,
      'home_assists': instance.homeAssists,
      'away_blocks': instance.awayBlocks,
      'home_blocks': instance.homeBlocks,
      'away_free_throw_makes': instance.awayFreeThrowMakes,
      'home_free_throw_makes': instance.homeFreeThrowMakes,
      'away_defensive_rebounds': instance.awayDefensiveRebounds,
      'home_defensive_rebounds': instance.homeDefensiveRebounds,
      'away_free_throw_percentage': instance.awayFreeThrowPercentage,
      'home_free_throw_percentage': instance.homeFreeThrowPercentage,
      'away_three_point_percentage': instance.awayThreePointPercentage,
      'home_three_point_percentage': instance.homeThreePointPercentage,
      'away_three_point_attempts': instance.awayThreePointAttempts,
      'home_three_point_attempts': instance.homeThreePointAttempts,
      'current_period': instance.currentPeriod,
      'status': instance.status,
      'period_scores':
          instance.periodScores.map((k, e) => MapEntry(k, e.toJson())),
    };

_$PeriodScoreModelImpl _$$PeriodScoreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PeriodScoreModelImpl(
      away: (json['away'] as num?)?.toInt(),
      home: (json['home'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PeriodScoreModelImplToJson(
        _$PeriodScoreModelImpl instance) =>
    <String, dynamic>{
      'away': instance.away,
      'home': instance.home,
    };
