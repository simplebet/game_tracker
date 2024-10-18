import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/error_response_model.dart';

part 'league_model.freezed.dart';
part 'league_model.g.dart';

@freezed
class LeaguesResponseDataModel with _$LeaguesResponseDataModel {
  const factory LeaguesResponseDataModel.success({
    required LeagueListDataModel data,
    @Default(ResponseStatus.success) ResponseStatus status,
  }) = _LeaguesResponseDataModelSuccess;

  const factory LeaguesResponseDataModel.error({
    required ErrorResponseModel error,
    @Default(ResponseStatus.error) ResponseStatus status,
  }) = _LeaguesResponseDataModelError;

  factory LeaguesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$LeaguesResponseDataModelFromJson(json);
}

@freezed
class LeagueListDataModel with _$LeagueListDataModel {
  const factory LeagueListDataModel({
    List<LeagueModel>? leagues,
    LeagueModel? league,
  }) = _LeagueListDataModel;

  factory LeagueListDataModel.fromJson(Map<String, dynamic> json) =>
      _$LeagueListDataModelFromJson(json);
}

@freezed
class LeagueModel with _$LeagueModel {
  const factory LeagueModel({
    required SportLeague name,
    @Default('') String title,
    @Default('') String offSeasonMessage,
    @Default(false) bool isBeta,
    String? icon,
    @Default(false) bool isDefault,
    @Default(true) bool isEnabled,
    @Default(false) bool isOffSeason,
    int? expectedPeriods,
  }) = _LeagueModel;

  factory LeagueModel.fromJson(Map<String, dynamic> json) =>
      const LeagueDataConverter().fromJson(json);

  factory LeagueModel.fromSportLeague(SportLeague sportLeague) =>
      LeagueModel(name: sportLeague);

  factory LeagueModel.baseFromJson(Map<String, dynamic> json) =>
      _$LeagueModelFromJson(json);
}

class LeagueDataConverter
    implements JsonConverter<LeagueModel, Map<String, dynamic>> {
  const LeagueDataConverter();

  @override
  LeagueModel fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> newJson = Map.from(json);
    final String? name = json['name'] as String?;
    if (name != null) {
      newJson = addTitle(newJson, name);

      switch (name) {
        case 'nfl':
          newJson = addIcon(newJson, 'football');
        case 'cfb':
          newJson = addIcon(newJson, 'cfb');
        case 'ifl':
          newJson = addIcon(newJson, 'football');
        case 'nba':
          newJson = addIcon(newJson, 'basketball');
        case 'mlb':
          newJson = addIcon(newJson, 'baseball');
        case 'cbb':
          newJson = addIcon(newJson, 'collegeBasketball');
        default:
          newJson = newJson;
      }
    }

    return LeagueModel.baseFromJson(newJson);
  }

  Map<String, dynamic> addTitle(Map<String, dynamic> json, String name) {
    String title = name.toUpperCase();
    if (name == 'cfb') {
      title = 'NCAA Football';
    }

    if (name == 'cbb') {
      title = 'NCAA Basketball';
    }

    json['title'] = title;
    return json;
  }

  Map<String, dynamic> addIcon(Map<String, dynamic> json, String icon) {
    json['icon'] = icon;
    return json;
  }

  @override
  Map<String, dynamic> toJson(LeagueModel data) => data.toJson();
}
