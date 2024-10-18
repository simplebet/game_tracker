import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';

part 'football_match_incident_drive_list_model.freezed.dart';
part 'football_match_incident_drive_list_model.g.dart';

@freezed
class FootballMatchIncidentDriveListModel
    with _$FootballMatchIncidentDriveListModel {
  const factory FootballMatchIncidentDriveListModel({
    required String driveId,
    required List<FootballMatchIncidentModel> plays,
  }) = _FootballMatchIncidentDriveListModel;

  factory FootballMatchIncidentDriveListModel.fromJson(
          Map<String, dynamic> json) =>
      _$FootballMatchIncidentDriveListModelFromJson(json);
}
