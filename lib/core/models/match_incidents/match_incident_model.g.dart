// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_incident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialFootballPayloadModelImpl _$$InitialFootballPayloadModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InitialFootballPayloadModelImpl(
      plays: (json['plays'] as List<dynamic>)
          .map((e) =>
              FootballMatchIncidentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCovered: json['is_covered?'] as bool,
      stats: json['stats'] == null
          ? null
          : StatsUpdateResponseModel.fromJson(
              json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InitialFootballPayloadModelImplToJson(
        _$InitialFootballPayloadModelImpl instance) =>
    <String, dynamic>{
      'plays': instance.plays.map((e) => e.toJson()).toList(),
      'is_covered?': instance.isCovered,
      'stats': instance.stats?.toJson(),
    };

_$InitialBasketballPayloadModelImpl
    _$$InitialBasketballPayloadModelImplFromJson(Map<String, dynamic> json) =>
        _$InitialBasketballPayloadModelImpl(
          plays: (json['plays'] as List<dynamic>)
              .map((e) => BasketballMatchIncidentModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          isCovered: json['is_covered?'] as bool,
          stats: json['stats'] == null
              ? null
              : StatsUpdateResponseModel.fromJson(
                  json['stats'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$InitialBasketballPayloadModelImplToJson(
        _$InitialBasketballPayloadModelImpl instance) =>
    <String, dynamic>{
      'plays': instance.plays.map((e) => e.toJson()).toList(),
      'is_covered?': instance.isCovered,
      'stats': instance.stats?.toJson(),
    };
