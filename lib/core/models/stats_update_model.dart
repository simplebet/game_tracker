import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/team_model.dart';

part 'stats_update_model.freezed.dart';

part 'stats_update_model.g.dart';

@freezed
class StatsUpdateResponseModel with _$StatsUpdateResponseModel {
  const factory StatsUpdateResponseModel({
    required SportLeague league,
    StatsUpdateModel? match,
  }) = _StatsUpdateResponseModel;

  factory StatsUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StatsUpdateResponseModelFromJson(json);
}

@freezed
class StatsUpdateModel with _$StatsUpdateModel {
  const factory StatsUpdateModel({
    required TeamModel? awayTeam,
    required String? eventId,
    required TeamModel? homeTeam,
    required String? id,
    required SportLeague? league,
    required List? players,
    required DateTime? startTime,
    required StatsUpdateMatchModel? match,
  }) = _StatsUpdateModel;

  factory StatsUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$StatsUpdateModelFromJson(json);
}

@freezed
class StatsUpdateMatchModel with _$StatsUpdateMatchModel {
  const factory StatsUpdateMatchModel({
    required int awayTwoPointMakes,
    required int homeTwoPointMakes,
    required int awaySteals,
    required int homeSteals,
    required int awayOffensiveRebounds,
    required int homeOffensiveRebounds,
    required int awayFieldGoalMakes,
    required int homeFieldGoalMakes,
    required int awayFieldGoalAttempts,
    required int homeFieldGoalAttempts,
    required int awayTwoPointAttempts,
    required int homeTwoPointAttempts,
    required int awayThreePointMakes,
    required int homeThreePointMakes,
    required int awayScore,
    required int homeScore,
    required double awayFieldGoalPercentage,
    required double homeFieldGoalPercentage,
    required int awayFouls,
    required int homeFouls,
    required int awayTurnovers,
    required int homeTurnovers,
    required int awayFreeThrowAttempts,
    required int homeFreeThrowAttempts,
    required double awayTwoPointPercentage,
    required double homeTwoPointPercentage,
    required int awayAssists,
    required int homeAssists,
    required int awayBlocks,
    required int homeBlocks,
    required int awayFreeThrowMakes,
    required int homeFreeThrowMakes,
    required int awayDefensiveRebounds,
    required int homeDefensiveRebounds,
    required double awayFreeThrowPercentage,
    required double homeFreeThrowPercentage,
    required double awayThreePointPercentage,
    required double homeThreePointPercentage,
    required int awayThreePointAttempts,
    required int homeThreePointAttempts,
    required int currentPeriod,
    required String status,
    required Map<String, PeriodScoreModel> periodScores,
  }) = _StatsUpdateMatchModel;

  factory StatsUpdateMatchModel.fromJson(Map<String, dynamic> json) =>
      _$StatsUpdateMatchModelFromJson(json);
}

@freezed
class PeriodScoreModel with _$PeriodScoreModel {
  const factory PeriodScoreModel({
    required int? away,
    required int? home,
  }) = _PeriodScoreModel;

  factory PeriodScoreModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodScoreModelFromJson(json);
}
