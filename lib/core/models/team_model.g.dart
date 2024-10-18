// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamsResponseDataModelSuccessImpl
    _$$TeamsResponseDataModelSuccessImplFromJson(Map<String, dynamic> json) =>
        _$TeamsResponseDataModelSuccessImpl(
          data:
              TeamListDataModel.fromJson(json['data'] as Map<String, dynamic>),
          status:
              $enumDecodeNullable(_$ResponseStatusEnumMap, json['status']) ??
                  ResponseStatus.success,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$TeamsResponseDataModelSuccessImplToJson(
        _$TeamsResponseDataModelSuccessImpl instance) =>
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

_$TeamsResponseDataModelErrorImpl _$$TeamsResponseDataModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamsResponseDataModelErrorImpl(
      error: ErrorResponseModel.fromJson(json['error'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$ResponseStatusEnumMap, json['status']) ??
          ResponseStatus.error,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TeamsResponseDataModelErrorImplToJson(
        _$TeamsResponseDataModelErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
      'status': _$ResponseStatusEnumMap[instance.status]!,
      'runtimeType': instance.$type,
    };

_$TeamListDataModelImpl _$$TeamListDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamListDataModelImpl(
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => TeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: json['team'] == null
          ? null
          : TeamModel.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TeamListDataModelImplToJson(
        _$TeamListDataModelImpl instance) =>
    <String, dynamic>{
      'teams': instance.teams?.map((e) => e.toJson()).toList(),
      'team': instance.team?.toJson(),
    };

_$TeamModelImpl _$$TeamModelImplFromJson(Map<String, dynamic> json) =>
    _$TeamModelImpl(
      league: $enumDecodeNullable(_$SportLeagueEnumMap, json['league']),
      abbrv: json['abbrv'] as String?,
      colorHexPrimary: json['color_hex_primary'] as String?,
      colorHexSecondary: json['color_hex_secondary'] as String?,
      logoUrl: json['logo'] as String?,
      logoAltUrl: json['logo_alt'] as String?,
      officialLogo: json['official_logo'] as String?,
      teamNumber: json['team_number'] as String?,
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      shortName: json['short_name'] as String?,
      franchiseName: json['franchise_name'] as String?,
      city: json['city'] as String?,
      metadata: json['metadata'] == null
          ? null
          : TeamMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TeamModelImplToJson(_$TeamModelImpl instance) =>
    <String, dynamic>{
      'league': _$SportLeagueEnumMap[instance.league],
      'abbrv': instance.abbrv,
      'color_hex_primary': instance.colorHexPrimary,
      'color_hex_secondary': instance.colorHexSecondary,
      'logo': instance.logoUrl,
      'logo_alt': instance.logoAltUrl,
      'official_logo': instance.officialLogo,
      'team_number': instance.teamNumber,
      'uuid': instance.uuid,
      'name': instance.name,
      'short_name': instance.shortName,
      'franchise_name': instance.franchiseName,
      'city': instance.city,
      'metadata': instance.metadata?.toJson(),
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

_$CfbTeamMetadataImpl _$$CfbTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CfbTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      apRanking: (json['ap_ranking'] as num?)?.toInt() ?? null,
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$CfbTeamMetadataImplToJson(
        _$CfbTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'ap_ranking': instance.apRanking,
      'league': instance.$type,
    };

_$NflTeamMetadataImpl _$$NflTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$NflTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$NflTeamMetadataImplToJson(
        _$NflTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'league': instance.$type,
    };

_$NbaTeamMetadataImpl _$$NbaTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$NbaTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$NbaTeamMetadataImplToJson(
        _$NbaTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'league': instance.$type,
    };

_$CbbTeamMetadataImpl _$$CbbTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CbbTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$CbbTeamMetadataImplToJson(
        _$CbbTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'league': instance.$type,
    };

_$IflTeamMetadataImpl _$$IflTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$IflTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$IflTeamMetadataImplToJson(
        _$IflTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'league': instance.$type,
    };

_$MlbTeamMetadataImpl _$$MlbTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$MlbTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$MlbTeamMetadataImplToJson(
        _$MlbTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'league': instance.$type,
    };

_$GolfTeamMetadataImpl _$$GolfTeamMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$GolfTeamMetadataImpl(
      conference: json['conference'] == null
          ? null
          : ConferenceDetails.fromJson(
              json['conference'] as Map<String, dynamic>),
      $type: json['league'] as String?,
    );

Map<String, dynamic> _$$GolfTeamMetadataImplToJson(
        _$GolfTeamMetadataImpl instance) =>
    <String, dynamic>{
      'conference': instance.conference?.toJson(),
      'league': instance.$type,
    };

_$ConferenceDetailsImpl _$$ConferenceDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ConferenceDetailsImpl(
      name: json['name'] as String?,
      id: json['id'] as String?,
      abbreviation: json['abbreviation'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$ConferenceDetailsImplToJson(
        _$ConferenceDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'abbreviation': instance.abbreviation,
      'slug': instance.slug,
    };
