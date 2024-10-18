// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerEntityImpl _$$PlayerEntityImplFromJson(Map<String, dynamic> json) =>
    _$PlayerEntityImpl(
      league: $enumDecode(_$SportLeagueEnumMap, json['league']),
      label: json['label'] as String?,
      abbrv: json['abbrv'] as String?,
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$EntityTypeEnumMap, json['type']) ??
          EntityType.player,
      teamId: json['team_id'] as String?,
      uuid: json['uuid'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$PlayerEntityImplToJson(_$PlayerEntityImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'label': instance.label,
      'abbrv': instance.abbrv,
      'id': instance.id,
      'type': _$EntityTypeEnumMap[instance.type]!,
      'team_id': instance.teamId,
      'uuid': instance.uuid,
      'image': instance.image,
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

const _$EntityTypeEnumMap = {
  EntityType.unknown: 'unknown',
  EntityType.player: 'player',
  EntityType.team: 'team',
  EntityType.match: 'match',
};

_$TeamEntityImpl _$$TeamEntityImplFromJson(Map<String, dynamic> json) =>
    _$TeamEntityImpl(
      league: $enumDecode(_$SportLeagueEnumMap, json['league']),
      label: json['label'] as String?,
      abbrv: json['abbrv'] as String?,
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$EntityTypeEnumMap, json['type']) ??
          EntityType.team,
      primaryColor: json['primary_color'] as String?,
      secondaryColor: json['secondary_color'] as String?,
      uuid: json['uuid'] as String?,
      image: json['image'] as String?,
      altImage: json['alt_image'] as String?,
    );

Map<String, dynamic> _$$TeamEntityImplToJson(_$TeamEntityImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'label': instance.label,
      'abbrv': instance.abbrv,
      'id': instance.id,
      'type': _$EntityTypeEnumMap[instance.type]!,
      'primary_color': instance.primaryColor,
      'secondary_color': instance.secondaryColor,
      'uuid': instance.uuid,
      'image': instance.image,
      'alt_image': instance.altImage,
    };

_$MatchEntityImpl _$$MatchEntityImplFromJson(Map<String, dynamic> json) =>
    _$MatchEntityImpl(
      league: $enumDecode(_$SportLeagueEnumMap, json['league']),
      label: json['label'] as String?,
      abbrv: json['abbrv'] as String?,
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$EntityTypeEnumMap, json['type']) ??
          EntityType.match,
      uuid: json['uuid'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$MatchEntityImplToJson(_$MatchEntityImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league]!,
      'label': instance.label,
      'abbrv': instance.abbrv,
      'id': instance.id,
      'type': _$EntityTypeEnumMap[instance.type]!,
      'uuid': instance.uuid,
      'image': instance.image,
    };
