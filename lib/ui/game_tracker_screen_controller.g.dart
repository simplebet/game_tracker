// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_tracker_screen_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameTrackerScreenStateImpl _$$GameTrackerScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GameTrackerScreenStateImpl(
      allMatches: (json['all_matches'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']),
      match: json['match'] == null
          ? null
          : MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      pastFootballIncidents: (json['past_football_incidents'] as List<dynamic>?)
          ?.map((e) =>
              FootballMatchIncidentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastBasketballIncidents: (json['past_basketball_incidents']
              as List<dynamic>?)
          ?.map((e) =>
              BasketballMatchIncidentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      footballIncidents: (json['football_incidents'] as List<dynamic>?)
          ?.map((e) =>
              FootballMatchIncidentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      basketballIncidents: (json['basketball_incidents'] as List<dynamic>?)
          ?.map((e) =>
              BasketballMatchIncidentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedFootballPlaysList: json['selected_football_plays_list'] == null
          ? null
          : FootballMatchIncidentDriveListModel.fromJson(
              json['selected_football_plays_list'] as Map<String, dynamic>),
      matchIsDisabled: json['match_is_disabled'] as bool? ?? false,
      matchIsCovered: json['match_is_covered'] as bool? ?? true,
    );

Map<String, dynamic> _$$GameTrackerScreenStateImplToJson(
        _$GameTrackerScreenStateImpl instance) =>
    <String, dynamic>{
      'all_matches': instance.allMatches?.map((e) => e.toJson()).toList(),
      'league': _$SportLeagueEnumMap[instance.league],
      'match': instance.match?.toJson(),
      'past_football_incidents':
          instance.pastFootballIncidents?.map((e) => e.toJson()).toList(),
      'past_basketball_incidents':
          instance.pastBasketballIncidents?.map((e) => e.toJson()).toList(),
      'football_incidents':
          instance.footballIncidents?.map((e) => e.toJson()).toList(),
      'basketball_incidents':
          instance.basketballIncidents?.map((e) => e.toJson()).toList(),
      'selected_football_plays_list':
          instance.selectedFootballPlaysList?.toJson(),
      'match_is_disabled': instance.matchIsDisabled,
      'match_is_covered': instance.matchIsCovered,
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
