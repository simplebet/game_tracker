// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchesResponseDataModelSuccessImpl
    _$$MatchesResponseDataModelSuccessImplFromJson(Map<String, dynamic> json) =>
        _$MatchesResponseDataModelSuccessImpl(
          data:
              MatchListDataModel.fromJson(json['data'] as Map<String, dynamic>),
          status:
              $enumDecodeNullable(_$ResponseStatusEnumMap, json['status']) ??
                  ResponseStatus.success,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$MatchesResponseDataModelSuccessImplToJson(
        _$MatchesResponseDataModelSuccessImpl instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'status': _$ResponseStatusEnumMap[instance.status]!,
      'runtimeType': instance.$type,
    };

const _$ResponseStatusEnumMap = {
  ResponseStatus.unknown: 'unknown',
  ResponseStatus.success: 'success',
  ResponseStatus.error: 'error',
};

_$MatchesResponseDataModelErrorImpl
    _$$MatchesResponseDataModelErrorImplFromJson(Map<String, dynamic> json) =>
        _$MatchesResponseDataModelErrorImpl(
          error: ErrorResponseModel.fromJson(
              json['error'] as Map<String, dynamic>),
          status:
              $enumDecodeNullable(_$ResponseStatusEnumMap, json['status']) ??
                  ResponseStatus.error,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$MatchesResponseDataModelErrorImplToJson(
        _$MatchesResponseDataModelErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
      'status': _$ResponseStatusEnumMap[instance.status]!,
      'runtimeType': instance.$type,
    };

_$MatchListDataModelImpl _$$MatchListDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchListDataModelImpl(
      matches: (json['matches'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      match: json['match'] == null
          ? null
          : MatchModel.fromJson(json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MatchListDataModelImplToJson(
        _$MatchListDataModelImpl instance) =>
    <String, dynamic>{
      'matches': instance.matches?.map((e) => e.toJson()).toList(),
      'match': instance.match?.toJson(),
    };

_$EmptyMatchImpl _$$EmptyMatchImplFromJson(Map<String, dynamic> json) =>
    _$EmptyMatchImpl(
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.unknown,
      awayScore: (json['away_team_score'] as num?)?.toInt(),
      awayTeam: json['away_team'] == null
          ? null
          : TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
      homeScore: (json['home_team_score'] as num?)?.toInt(),
      homeTeam: json['home_team'] == null
          ? null
          : TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
      id: json['id'] as String?,
      featured: json['featured'] as bool? ?? false,
      prizeSummary: json['prize_summary'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      period: (json['period'] as num?)?.toInt() ?? 1,
      status: $enumDecodeNullable(_$MatchStatusEnumMap, json['status'],
          unknownValue: MatchStatus.unknown),
      contestData: json['contest_data'] == null
          ? null
          : ContestData.fromJson(json['contest_data'] as Map<String, dynamic>),
      network: json['network'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EmptyMatchImplToJson(_$EmptyMatchImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league],
      'away_team_score': instance.awayScore,
      'away_team': instance.awayTeam?.toJson(),
      'home_team_score': instance.homeScore,
      'home_team': instance.homeTeam?.toJson(),
      'id': instance.id,
      'featured': instance.featured,
      'prize_summary': instance.prizeSummary,
      'start_time': instance.startTime?.toIso8601String(),
      'period': instance.period,
      'status': _$MatchStatusEnumMap[instance.status],
      'contest_data': instance.contestData?.toJson(),
      'network': instance.network,
      'categories': instance.categories,
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

const _$MatchStatusEnumMap = {
  MatchStatus.unknown: 'unknown',
  MatchStatus.preMatch: 'prematch',
  MatchStatus.active: 'active',
  MatchStatus.ended: 'ended',
};

_$BasketballMatchImpl _$$BasketballMatchImplFromJson(
        Map<String, dynamic> json) =>
    _$BasketballMatchImpl(
      awayTeam: json['away_team'] == null
          ? null
          : TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
      homeTeam: json['home_team'] == null
          ? null
          : TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
      id: json['id'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      sportData: json['sport_data'] == null
          ? null
          : NbaBasketballData.fromJson(
              json['sport_data'] as Map<String, dynamic>),
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.nba,
      awayScore: (json['away_team_score'] as num?)?.toInt(),
      homeScore: (json['home_team_score'] as num?)?.toInt(),
      featured: json['featured'] as bool? ?? false,
      prizeSummary: json['prize_summary'] as String?,
      period: (json['period'] as num?)?.toInt() ?? 1,
      status: $enumDecodeNullable(_$MatchStatusEnumMap, json['status'],
              unknownValue: MatchStatus.unknown) ??
          MatchStatus.preMatch,
      contestData: json['contest_data'] == null
          ? null
          : ContestData.fromJson(json['contest_data'] as Map<String, dynamic>),
      network: json['network'] as String?,
    );

Map<String, dynamic> _$$BasketballMatchImplToJson(
        _$BasketballMatchImpl instance) =>
    <String, dynamic>{
      'away_team': instance.awayTeam?.toJson(),
      'home_team': instance.homeTeam?.toJson(),
      'id': instance.id,
      'start_time': instance.startTime?.toIso8601String(),
      'sport_data': instance.sportData?.toJson(),
      'league': _$SportLeagueEnumMap[instance.league],
      'away_team_score': instance.awayScore,
      'home_team_score': instance.homeScore,
      'featured': instance.featured,
      'prize_summary': instance.prizeSummary,
      'period': instance.period,
      'status': _$MatchStatusEnumMap[instance.status],
      'contest_data': instance.contestData?.toJson(),
      'network': instance.network,
    };

_$CollegeBasketballMatchImpl _$$CollegeBasketballMatchImplFromJson(
        Map<String, dynamic> json) =>
    _$CollegeBasketballMatchImpl(
      awayTeam: json['away_team'] == null
          ? null
          : TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
      homeTeam: json['home_team'] == null
          ? null
          : TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
      id: json['id'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      sportData: json['sport_data'] == null
          ? null
          : CollegeBasketballData.fromJson(
              json['sport_data'] as Map<String, dynamic>),
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.cbb,
      awayScore: (json['away_team_score'] as num?)?.toInt(),
      homeScore: (json['home_team_score'] as num?)?.toInt(),
      featured: json['featured'] as bool? ?? false,
      prizeSummary: json['prize_summary'] as String?,
      period: (json['period'] as num?)?.toInt() ?? 1,
      status: $enumDecodeNullable(_$MatchStatusEnumMap, json['status'],
              unknownValue: MatchStatus.unknown) ??
          MatchStatus.preMatch,
      contestData: json['contest_data'] == null
          ? null
          : ContestData.fromJson(json['contest_data'] as Map<String, dynamic>),
      network: json['network'] as String?,
    );

Map<String, dynamic> _$$CollegeBasketballMatchImplToJson(
        _$CollegeBasketballMatchImpl instance) =>
    <String, dynamic>{
      'away_team': instance.awayTeam?.toJson(),
      'home_team': instance.homeTeam?.toJson(),
      'id': instance.id,
      'start_time': instance.startTime?.toIso8601String(),
      'sport_data': instance.sportData?.toJson(),
      'league': _$SportLeagueEnumMap[instance.league],
      'away_team_score': instance.awayScore,
      'home_team_score': instance.homeScore,
      'featured': instance.featured,
      'prize_summary': instance.prizeSummary,
      'period': instance.period,
      'status': _$MatchStatusEnumMap[instance.status],
      'contest_data': instance.contestData?.toJson(),
      'network': instance.network,
    };

_$NflFootballMatchImpl _$$NflFootballMatchImplFromJson(
        Map<String, dynamic> json) =>
    _$NflFootballMatchImpl(
      awayTeam: json['away_team'] == null
          ? null
          : TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
      homeTeam: json['home_team'] == null
          ? null
          : TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
      id: json['id'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      sportData: json['sport_data'] == null
          ? null
          : NflFootballData.fromJson(
              json['sport_data'] as Map<String, dynamic>),
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.nfl,
      awayScore: (json['away_team_score'] as num?)?.toInt(),
      homeScore: (json['home_team_score'] as num?)?.toInt(),
      featured: json['featured'] as bool? ?? false,
      period: (json['period'] as num?)?.toInt() ?? 1,
      status: $enumDecodeNullable(_$MatchStatusEnumMap, json['status']) ??
          MatchStatus.preMatch,
      contestData: json['contest_data'] == null
          ? null
          : ContestData.fromJson(json['contest_data'] as Map<String, dynamic>),
      network: json['network'] as String?,
    );

Map<String, dynamic> _$$NflFootballMatchImplToJson(
        _$NflFootballMatchImpl instance) =>
    <String, dynamic>{
      'away_team': instance.awayTeam?.toJson(),
      'home_team': instance.homeTeam?.toJson(),
      'id': instance.id,
      'start_time': instance.startTime?.toIso8601String(),
      'sport_data': instance.sportData?.toJson(),
      'league': _$SportLeagueEnumMap[instance.league],
      'away_team_score': instance.awayScore,
      'home_team_score': instance.homeScore,
      'featured': instance.featured,
      'period': instance.period,
      'status': _$MatchStatusEnumMap[instance.status],
      'contest_data': instance.contestData?.toJson(),
      'network': instance.network,
    };

_$CollegeFootballMatchImpl _$$CollegeFootballMatchImplFromJson(
        Map<String, dynamic> json) =>
    _$CollegeFootballMatchImpl(
      awayTeam: json['away_team'] == null
          ? null
          : TeamModel.fromJson(json['away_team'] as Map<String, dynamic>),
      homeTeam: json['home_team'] == null
          ? null
          : TeamModel.fromJson(json['home_team'] as Map<String, dynamic>),
      id: json['id'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      sportData: json['sport_data'] == null
          ? null
          : CollegeFootballData.fromJson(
              json['sport_data'] as Map<String, dynamic>),
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.cfb,
      awayScore: (json['away_team_score'] as num?)?.toInt(),
      homeScore: (json['home_team_score'] as num?)?.toInt(),
      featured: json['featured'] as bool? ?? false,
      period: (json['period'] as num?)?.toInt() ?? 1,
      status: $enumDecodeNullable(_$MatchStatusEnumMap, json['status']) ??
          MatchStatus.preMatch,
      contestData: json['contest_data'] == null
          ? null
          : ContestData.fromJson(json['contest_data'] as Map<String, dynamic>),
      network: json['network'] as String?,
    );

Map<String, dynamic> _$$CollegeFootballMatchImplToJson(
        _$CollegeFootballMatchImpl instance) =>
    <String, dynamic>{
      'away_team': instance.awayTeam?.toJson(),
      'home_team': instance.homeTeam?.toJson(),
      'id': instance.id,
      'start_time': instance.startTime?.toIso8601String(),
      'sport_data': instance.sportData?.toJson(),
      'league': _$SportLeagueEnumMap[instance.league],
      'away_team_score': instance.awayScore,
      'home_team_score': instance.homeScore,
      'featured': instance.featured,
      'period': instance.period,
      'status': _$MatchStatusEnumMap[instance.status],
      'contest_data': instance.contestData?.toJson(),
      'network': instance.network,
    };

_$NflFootballDataImpl _$$NflFootballDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NflFootballDataImpl(
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.nfl,
      fieldSide: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['field_side']),
      possession: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession']),
      distance: (json['distance'] as num?)?.toInt(),
      yardline: (json['yardline'] as num?)?.toInt(),
      down: (json['down'] as num?)?.toInt(),
      gameClock: (json['game_clock'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      awayTeamTimeoutsLeft: (json['away_team_timeouts_left'] as num?)?.toInt(),
      goalToGo: json['goal_to_go'] as bool?,
      clockRunning: json['clock_running'] as bool?,
      homeScore: (json['home_score'] as num?)?.toInt(),
      homeTeamTimeoutsLeft: (json['home_team_timeouts_left'] as num?)?.toInt(),
      period: (json['period'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NflFootballDataImplToJson(
        _$NflFootballDataImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'field_side': _$HomeOrAwayEnumMap[instance.fieldSide],
      'possession': _$HomeOrAwayEnumMap[instance.possession],
      'distance': instance.distance,
      'yardline': instance.yardline,
      'down': instance.down,
      'game_clock': instance.gameClock,
      'away_score': instance.awayScore,
      'away_team_timeouts_left': instance.awayTeamTimeoutsLeft,
      'goal_to_go': instance.goalToGo,
      'clock_running': instance.clockRunning,
      'home_score': instance.homeScore,
      'home_team_timeouts_left': instance.homeTeamTimeoutsLeft,
      'period': instance.period,
    };

const _$HomeOrAwayEnumMap = {
  HomeOrAway.unknown: 'unknown',
  HomeOrAway.home: 'home',
  HomeOrAway.away: 'away',
  HomeOrAway.none: 'none',
};

_$CollegeFootballDataImpl _$$CollegeFootballDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CollegeFootballDataImpl(
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.cfb,
      fieldSide: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['field_side']),
      possession: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession']),
      distance: (json['distance'] as num?)?.toInt(),
      yardline: (json['yardline'] as num?)?.toInt(),
      down: (json['down'] as num?)?.toInt(),
      gameClock: (json['game_clock'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      awayTeamTimeoutsLeft: (json['away_team_timeouts_left'] as num?)?.toInt(),
      clockRunning: json['clock_running'] as bool?,
      goalToGo: json['goal_to_go'] as bool?,
      homeScore: (json['home_score'] as num?)?.toInt(),
      homeTeamTimeoutsLeft: (json['home_team_timeouts_left'] as num?)?.toInt(),
      period: (json['period'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CollegeFootballDataImplToJson(
        _$CollegeFootballDataImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'field_side': _$HomeOrAwayEnumMap[instance.fieldSide],
      'possession': _$HomeOrAwayEnumMap[instance.possession],
      'distance': instance.distance,
      'yardline': instance.yardline,
      'down': instance.down,
      'game_clock': instance.gameClock,
      'away_score': instance.awayScore,
      'away_team_timeouts_left': instance.awayTeamTimeoutsLeft,
      'clock_running': instance.clockRunning,
      'goal_to_go': instance.goalToGo,
      'home_score': instance.homeScore,
      'home_team_timeouts_left': instance.homeTeamTimeoutsLeft,
      'period': instance.period,
    };

_$NbaBasketballDataImpl _$$NbaBasketballDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NbaBasketballDataImpl(
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.nba,
      gameClock: (json['game_clock'] as num?)?.toInt(),
      possession: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession']),
      possessionArrow:
          $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession_arrow']),
      teamFouls: json['team_fouls'] == null
          ? null
          : FoulDetails.fromJson(json['team_fouls'] as Map<String, dynamic>),
      playerStats: (json['player_stats'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, BasketballPlayerStats.fromJson(e as Map<String, dynamic>)),
      ),
      homeTeamFouls: (json['home_team_fouls'] as num?)?.toInt(),
      awayTeamFouls: (json['away_team_fouls'] as num?)?.toInt(),
      homeTeamBonus: json['home_team_bonus'] as bool?,
      awayTeamBonus: json['away_team_bonus'] as bool?,
      homeScore: (json['home_score'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      clockRunning: json['clock_running'] as bool?,
      period: (json['period'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NbaBasketballDataImplToJson(
        _$NbaBasketballDataImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'game_clock': instance.gameClock,
      'possession': _$HomeOrAwayEnumMap[instance.possession],
      'possession_arrow': _$HomeOrAwayEnumMap[instance.possessionArrow],
      'team_fouls': instance.teamFouls?.toJson(),
      'player_stats':
          instance.playerStats?.map((k, e) => MapEntry(k, e.toJson())),
      'home_team_fouls': instance.homeTeamFouls,
      'away_team_fouls': instance.awayTeamFouls,
      'home_team_bonus': instance.homeTeamBonus,
      'away_team_bonus': instance.awayTeamBonus,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'clock_running': instance.clockRunning,
      'period': instance.period,
    };

_$CollegeBasketballDataImpl _$$CollegeBasketballDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CollegeBasketballDataImpl(
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']) ??
          SportLeague.cbb,
      gameClock: (json['game_clock'] as num?)?.toInt(),
      possession: $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession']),
      possessionArrow:
          $enumDecodeNullable(_$HomeOrAwayEnumMap, json['possession_arrow']),
      teamFouls: json['team_fouls'] == null
          ? null
          : FoulDetails.fromJson(json['team_fouls'] as Map<String, dynamic>),
      playerStats: (json['player_stats'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, BasketballPlayerStats.fromJson(e as Map<String, dynamic>)),
      ),
      homeTeamFouls: (json['home_team_fouls'] as num?)?.toInt(),
      awayTeamFouls: (json['away_team_fouls'] as num?)?.toInt(),
      homeTeamBonus: json['home_team_bonus'] as bool?,
      awayTeamBonus: json['away_team_bonus'] as bool?,
      homeTeamDoubleBonus: json['home_team_double_bonus'] as bool?,
      awayTeamDoubleBonus: json['away_team_double_bonus'] as bool?,
      homeScore: (json['home_score'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      clockRunning: json['clock_running'] as bool?,
      period: (json['period'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CollegeBasketballDataImplToJson(
        _$CollegeBasketballDataImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'game_clock': instance.gameClock,
      'possession': _$HomeOrAwayEnumMap[instance.possession],
      'possession_arrow': _$HomeOrAwayEnumMap[instance.possessionArrow],
      'team_fouls': instance.teamFouls?.toJson(),
      'player_stats':
          instance.playerStats?.map((k, e) => MapEntry(k, e.toJson())),
      'home_team_fouls': instance.homeTeamFouls,
      'away_team_fouls': instance.awayTeamFouls,
      'home_team_bonus': instance.homeTeamBonus,
      'away_team_bonus': instance.awayTeamBonus,
      'home_team_double_bonus': instance.homeTeamDoubleBonus,
      'away_team_double_bonus': instance.awayTeamDoubleBonus,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'clock_running': instance.clockRunning,
      'period': instance.period,
    };

_$ContestDataImpl _$$ContestDataImplFromJson(Map<String, dynamic> json) =>
    _$ContestDataImpl(
      contestIds: (json['contest_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      numberOfWageringUsers:
          (json['number_of_wagering_users'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ContestDataImplToJson(_$ContestDataImpl instance) =>
    <String, dynamic>{
      'contest_ids': instance.contestIds,
      'number_of_wagering_users': instance.numberOfWageringUsers,
    };

_$BasketballPlayerStatsImpl _$$BasketballPlayerStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$BasketballPlayerStatsImpl(
      quarterPoints: (json['quarter_points'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BasketballPlayerStatsImplToJson(
        _$BasketballPlayerStatsImpl instance) =>
    <String, dynamic>{
      'quarter_points': instance.quarterPoints,
    };
