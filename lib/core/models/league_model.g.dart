// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaguesResponseDataModelSuccessImpl
    _$$LeaguesResponseDataModelSuccessImplFromJson(Map<String, dynamic> json) =>
        _$LeaguesResponseDataModelSuccessImpl(
          data: LeagueListDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
          status:
              $enumDecodeNullable(_$ResponseStatusEnumMap, json['status']) ??
                  ResponseStatus.success,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$LeaguesResponseDataModelSuccessImplToJson(
        _$LeaguesResponseDataModelSuccessImpl instance) =>
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

_$LeaguesResponseDataModelErrorImpl
    _$$LeaguesResponseDataModelErrorImplFromJson(Map<String, dynamic> json) =>
        _$LeaguesResponseDataModelErrorImpl(
          error: ErrorResponseModel.fromJson(
              json['error'] as Map<String, dynamic>),
          status:
              $enumDecodeNullable(_$ResponseStatusEnumMap, json['status']) ??
                  ResponseStatus.error,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$LeaguesResponseDataModelErrorImplToJson(
        _$LeaguesResponseDataModelErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
      'status': _$ResponseStatusEnumMap[instance.status]!,
      'runtimeType': instance.$type,
    };

_$LeagueListDataModelImpl _$$LeagueListDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeagueListDataModelImpl(
      leagues: (json['leagues'] as List<dynamic>?)
          ?.map((e) => LeagueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      league: json['league'] == null
          ? null
          : LeagueModel.fromJson(json['league'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeagueListDataModelImplToJson(
        _$LeagueListDataModelImpl instance) =>
    <String, dynamic>{
      'leagues': instance.leagues?.map((e) => e.toJson()).toList(),
      'league': instance.league?.toJson(),
    };

_$LeagueModelImpl _$$LeagueModelImplFromJson(Map<String, dynamic> json) =>
    _$LeagueModelImpl(
      name: $enumDecode(_$SportLeagueEnumMap, json['name']),
      title: json['title'] as String? ?? '',
      offSeasonMessage: json['off_season_message'] as String? ?? '',
      isBeta: json['is_beta'] as bool? ?? false,
      icon: json['icon'] as String?,
      isDefault: json['is_default'] as bool? ?? false,
      isEnabled: json['is_enabled'] as bool? ?? true,
      isOffSeason: json['is_off_season'] as bool? ?? false,
      expectedPeriods: (json['expected_periods'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeagueModelImplToJson(_$LeagueModelImpl instance) =>
    <String, dynamic>{
      'name': _$SportLeagueEnumMap[instance.name]!,
      'title': instance.title,
      'off_season_message': instance.offSeasonMessage,
      'is_beta': instance.isBeta,
      'icon': instance.icon,
      'is_default': instance.isDefault,
      'is_enabled': instance.isEnabled,
      'is_off_season': instance.isOffSeason,
      'expected_periods': instance.expectedPeriods,
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
