// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'football_match_incident_drive_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FootballMatchIncidentDriveListModelImpl
    _$$FootballMatchIncidentDriveListModelImplFromJson(
            Map<String, dynamic> json) =>
        _$FootballMatchIncidentDriveListModelImpl(
          driveId: json['drive_id'] as String,
          plays: (json['plays'] as List<dynamic>)
              .map((e) => FootballMatchIncidentModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$FootballMatchIncidentDriveListModelImplToJson(
        _$FootballMatchIncidentDriveListModelImpl instance) =>
    <String, dynamic>{
      'drive_id': instance.driveId,
      'plays': instance.plays.map((e) => e.toJson()).toList(),
    };
