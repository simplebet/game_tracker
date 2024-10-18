import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/match_incidents/basketball_match_incident_model.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/stats_update_model.dart';

part 'match_incident_model.freezed.dart';
part 'match_incident_model.g.dart';

@freezed
class InitialFootballPayloadModel with _$InitialFootballPayloadModel {
  const factory InitialFootballPayloadModel({
    required List<FootballMatchIncidentModel> plays,
    @JsonKey(name: 'is_covered?') required bool isCovered,
    required StatsUpdateResponseModel? stats,
  }) = _InitialFootballPayloadModel;

  factory InitialFootballPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$InitialFootballPayloadModelFromJson(json);
}

@freezed
class InitialBasketballPayloadModel with _$InitialBasketballPayloadModel {
  const factory InitialBasketballPayloadModel({
    required List<BasketballMatchIncidentModel> plays,
    @JsonKey(name: 'is_covered?') required bool isCovered,
    required StatsUpdateResponseModel? stats,
  }) = _InitialBasketballPayloadModel;

  factory InitialBasketballPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$InitialBasketballPayloadModelFromJson(json);
}
