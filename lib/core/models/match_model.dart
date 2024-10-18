import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/error_response_model.dart';
import 'package:game_tracker/core/models/foul_details.dart';
import 'package:game_tracker/core/models/team_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchesResponseDataModel with _$MatchesResponseDataModel {
  const factory MatchesResponseDataModel.success({
    required MatchListDataModel data,
    @Default(ResponseStatus.success) ResponseStatus status,
  }) = _MatchesResponseDataModelSuccess;

  const factory MatchesResponseDataModel.error({
    required ErrorResponseModel error,
    @Default(ResponseStatus.error) ResponseStatus status,
  }) = _MatchesResponseDataModelError;

  factory MatchesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$MatchesResponseDataModelFromJson(json);
}

@freezed
class MatchListDataModel with _$MatchListDataModel {
  const factory MatchListDataModel({
    List<MatchModel>? matches,
    MatchModel? match,
  }) = _MatchListDataModel;

  factory MatchListDataModel.fromJson(Map<String, dynamic> json) =>
      _$MatchListDataModelFromJson(json);
}

abstract class Match<T> {
  SportLeague? get league;
  int? get awayScore;
  TeamModel? get awayTeam;
  int? get homeScore;
  TeamModel? get homeTeam;
  String? get id;
  bool get featured;
  DateTime? get startTime;
  int get period;
  MatchStatus? get status;
  ContestData? get contestData;
  String? get network;
  T? get sportData;
}

@Freezed(unionKey: 'league')
class MatchModel with _$MatchModel {
  const factory MatchModel({
    @Default(SportLeague.unknown) SportLeague? league,
    @JsonKey(name: 'away_team_score') int? awayScore,
    TeamModel? awayTeam,
    @JsonKey(name: 'home_team_score') int? homeScore,
    TeamModel? homeTeam,
    String? id,
    @Default(false) bool featured,
    String? prizeSummary,
    DateTime? startTime,
    @Default(1) int period,
    @JsonKey(unknownEnumValue: MatchStatus.unknown) MatchStatus? status,
    ContestData? contestData,
    String? network,
    @Default([]) List<String> categories,
  }) = EmptyMatch;

  @Implements<Match<BasketballData>>()
  const factory MatchModel.nba({
    required TeamModel? awayTeam,
    required TeamModel? homeTeam,
    required String? id,
    required DateTime? startTime,
    required NbaBasketballData? sportData,
    @Default(SportLeague.nba) SportLeague? league,
    @JsonKey(name: 'away_team_score') int? awayScore,
    @JsonKey(name: 'home_team_score') int? homeScore,
    @Default(false) bool featured,
    String? prizeSummary,
    @Default(1) int period,
    @JsonKey(unknownEnumValue: MatchStatus.unknown)
    @Default(MatchStatus.preMatch)
    MatchStatus? status,
    ContestData? contestData,
    String? network,
  }) = BasketballMatch;

  @Implements<Match<BasketballData>>()
  const factory MatchModel.cbb({
    required TeamModel? awayTeam,
    required TeamModel? homeTeam,
    required String? id,
    required DateTime? startTime,
    required CollegeBasketballData? sportData,
    @Default(SportLeague.cbb) SportLeague? league,
    @JsonKey(name: 'away_team_score') int? awayScore,
    @JsonKey(name: 'home_team_score') int? homeScore,
    @Default(false) bool featured,
    String? prizeSummary,
    @Default(1) int period,
    @JsonKey(unknownEnumValue: MatchStatus.unknown)
    @Default(MatchStatus.preMatch)
    MatchStatus? status,
    ContestData? contestData,
    String? network,
  }) = CollegeBasketballMatch;

  @Implements<Match<FootballData>>()
  const factory MatchModel.nfl({
    required TeamModel? awayTeam,
    required TeamModel? homeTeam,
    required String? id,
    required DateTime? startTime,
    required NflFootballData? sportData,
    @Default(SportLeague.nfl) SportLeague? league,
    @JsonKey(name: 'away_team_score') int? awayScore,
    @JsonKey(name: 'home_team_score') int? homeScore,
    @Default(false) bool featured,
    @Default(1) int period,
    @Default(MatchStatus.preMatch) MatchStatus? status,
    ContestData? contestData,
    String? network,
  }) = NflFootballMatch;

  @Implements<Match<FootballData>>()
  const factory MatchModel.cfb({
    required TeamModel? awayTeam,
    required TeamModel? homeTeam,
    required String? id,
    required DateTime? startTime,
    required CollegeFootballData? sportData,
    @Default(SportLeague.cfb) SportLeague? league,
    @JsonKey(name: 'away_team_score') int? awayScore,
    @JsonKey(name: 'home_team_score') int? homeScore,
    @Default(false) bool featured,
    @Default(1) int period,
    @Default(MatchStatus.preMatch) MatchStatus? status,
    ContestData? contestData,
    String? network,
  }) = CollegeFootballMatch;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}

extension MatchCategories on MatchModel {
  int get periodToUse {
    if (status == MatchStatus.preMatch) {
      return 1;
    }
    return period;
  }
}

extension MatchStatusExtension on MatchModel {
  bool get isActive => status == MatchStatus.active;
}

extension TeamByID on MatchModel {
  TeamModel? teamById(String id) => awayTeam?.uuid == id
      ? awayTeam
      : homeTeam?.uuid == id
          ? homeTeam
          : null;
}

extension MatchDefenseExtension on MatchModel {
  TeamModel? get teamOnDefenseForNFL {
    if (league?.isNFL ?? false) {
      final footballMatch = this as NflFootballMatch;
      final possession = footballMatch.sportData?.possession;

      return possession == HomeOrAway.home
          ? footballMatch.awayTeam
          : footballMatch.homeTeam;
    }
    return null;
  }
}

abstract class FootballData {
  SportLeague get league;
  HomeOrAway? get fieldSide;
  HomeOrAway? get possession;
  int? get distance;
  int? get yardline;
  int? get down;
  int? get gameClock;
  int? get awayScore;
  int? get awayTeamTimeoutsLeft;
  bool? get goalToGo;
  bool? get clockRunning;
  int? get homeScore;
  int? get homeTeamTimeoutsLeft;
  int? get period;
}

abstract class BasketballData {
  SportLeague get league;
  int? get gameClock;
  HomeOrAway? get possession;
  FoulDetails? get teamFouls;
  Map<String, BasketballPlayerStats>? get playerStats;
}

@Freezed(unionKey: 'league')
class SportData with _$SportData {
  @Implements<FootballData>()
  const factory SportData.nfl({
    @Default(SportLeague.nfl) SportLeague league,
    HomeOrAway? fieldSide,
    HomeOrAway? possession,
    int? distance,
    int? yardline,
    int? down,
    int? gameClock,
    int? awayScore,
    int? awayTeamTimeoutsLeft,
    bool? goalToGo,
    bool? clockRunning,
    int? homeScore,
    int? homeTeamTimeoutsLeft,
    int? period,
  }) = NflFootballData;

  @Implements<FootballData>()
  const factory SportData.cfb({
    @Default(SportLeague.cfb) SportLeague league,
    HomeOrAway? fieldSide,
    HomeOrAway? possession,
    int? distance,
    int? yardline,
    int? down,
    int? gameClock,
    int? awayScore,
    int? awayTeamTimeoutsLeft,
    bool? clockRunning,
    bool? goalToGo,
    int? homeScore,
    int? homeTeamTimeoutsLeft,
    int? period,
  }) = CollegeFootballData;

  @Implements<BasketballData>()
  const factory SportData.nba({
    @Default(SportLeague.nba) SportLeague league,
    int? gameClock,
    HomeOrAway? possession,
    HomeOrAway? possessionArrow,
    FoulDetails? teamFouls,
    Map<String, BasketballPlayerStats>? playerStats,
    int? homeTeamFouls,
    int? awayTeamFouls,
    bool? homeTeamBonus,
    bool? awayTeamBonus,
    int? homeScore,
    int? awayScore,
    bool? clockRunning,
    int? period,
  }) = NbaBasketballData;

  @Implements<BasketballData>()
  const factory SportData.cbb({
    @Default(SportLeague.cbb) SportLeague league,
    int? gameClock,
    HomeOrAway? possession,
    HomeOrAway? possessionArrow,
    FoulDetails? teamFouls,
    Map<String, BasketballPlayerStats>? playerStats,
    int? homeTeamFouls,
    int? awayTeamFouls,
    bool? homeTeamBonus,
    bool? awayTeamBonus,
    bool? homeTeamDoubleBonus,
    bool? awayTeamDoubleBonus,
    int? homeScore,
    int? awayScore,
    bool? clockRunning,
    int? period,
  }) = CollegeBasketballData;

  factory SportData.fromJson(Map<String, dynamic> json) =>
      _$SportDataFromJson(json);
}

@freezed
class ContestData with _$ContestData {
  const factory ContestData({
    @Default([]) List<String> contestIds,
    @Default(0) int numberOfWageringUsers,
  }) = _ContestData;

  factory ContestData.fromJson(Map<String, dynamic> json) =>
      _$ContestDataFromJson(json);
}

@freezed
class PlayerStats with _$PlayerStats {
  const factory PlayerStats.nba({
    @Default(0) int quarterPoints,
  }) = BasketballPlayerStats;

  factory PlayerStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsFromJson(json);
}
