import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/error_response_model.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamsResponseDataModel with _$TeamsResponseDataModel {
  const factory TeamsResponseDataModel.success({
    required TeamListDataModel data,
    @Default(ResponseStatus.success) ResponseStatus status,
  }) = _TeamsResponseDataModelSuccess;

  const factory TeamsResponseDataModel.error({
    required ErrorResponseModel error,
    @Default(ResponseStatus.error) ResponseStatus status,
  }) = _TeamsResponseDataModelError;

  factory TeamsResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$TeamsResponseDataModelFromJson(json);
}

@freezed
class TeamListDataModel with _$TeamListDataModel {
  const factory TeamListDataModel({
    List<TeamModel>? teams,
    TeamModel? team,
  }) = _TeamListDataModel;

  factory TeamListDataModel.fromJson(Map<String, dynamic> json) =>
      _$TeamListDataModelFromJson(json);
}

@freezed
class TeamModel with _$TeamModel {
  const factory TeamModel({
    SportLeague? league,
    String? abbrv,
    String? colorHexPrimary,
    String? colorHexSecondary,
    @JsonKey(name: 'logo') String? logoUrl,
    @JsonKey(name: 'logo_alt') String? logoAltUrl,
    @JsonKey(name: 'official_logo') String? officialLogo,
    String? teamNumber,
    String? uuid,
    String? name,
    String? shortName,
    String? franchiseName,
    String? city,
    TeamMetadata? metadata,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      const TeamModelConverter().fromJson(json);

  factory TeamModel.baseFromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}

class TeamModelConverter
    implements JsonConverter<TeamModel, Map<String, dynamic>> {
  const TeamModelConverter();

  @override
  TeamModel fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> newJson = Map.from(json);
    final Map<String, dynamic> metadata = {};
    json['metadata']?.forEach((k, v) => metadata[k as String] = v);
    metadata['league'] = json['league'];
    newJson['metadata'] = metadata;

    /// we get `id` from away/home_team response from match_viz
    if (newJson['uuid'] == null && json['id'] != null) {
      newJson['uuid'] = json['id'];
    }

    return TeamModel.baseFromJson(newJson);
  }

  @override
  Map<String, dynamic> toJson(TeamModel data) => data.toJson();
}

@Freezed(unionKey: 'league')
class TeamMetadata with _$TeamMetadata {
  const factory TeamMetadata.cfb({
    ConferenceDetails? conference,
    @Default(null) int? apRanking,
  }) = _CfbTeamMetadata;

  const factory TeamMetadata.nfl({
    ConferenceDetails? conference,
  }) = _NflTeamMetadata;

  const factory TeamMetadata.nba({
    ConferenceDetails? conference,
  }) = _NbaTeamMetadata;

  const factory TeamMetadata.cbb({
    ConferenceDetails? conference,
  }) = _CbbTeamMetadata;

  const factory TeamMetadata.ifl({
    ConferenceDetails? conference,
  }) = _IflTeamMetadata;

  const factory TeamMetadata.mlb({
    ConferenceDetails? conference,
  }) = _MlbTeamMetadata;

  const factory TeamMetadata.liv({
    ConferenceDetails? conference,
  }) = _GolfTeamMetadata;

  factory TeamMetadata.fromJson(Map<String, dynamic> json) =>
      _$TeamMetadataFromJson(json);
}

@freezed
class ConferenceDetails with _$ConferenceDetails {
  const factory ConferenceDetails({
    String? name,
    String? id,
    String? abbreviation,
    String? slug,
  }) = _ConferenceDetails;

  factory ConferenceDetails.fromJson(Map<String, dynamic> json) =>
      _$ConferenceDetailsFromJson(json);
}

extension TeamResidence on TeamModel {
  String get residence => name?.split(' ').first ?? '';
  String? get longName => name?.substring(residence.length).trim() ?? '';
  String? get teamShortName {
    final bool isCfb = league == SportLeague.cfb;
    final bool isIfl = league == SportLeague.ifl;

    // CFB shortNames are formatted differently, so we take out the city from the name to just get the team name e.g. Penn State Nittany Lions -> Nittany Lions
    if (isCfb) return name?.replaceFirst('${city!} ', '');
    //IFL shortNames do not contain city names, so we don't need to take out the city.
    if (isIfl) return shortName;
    // Remove first part of short name e.g. DAL Cowboys -> Cowboys
    return shortName?.split(' ').sublist(1).join(' ');
  }
}
