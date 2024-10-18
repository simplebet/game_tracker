import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../store/game_tracker_skin_store.dart';
import 'basketball_game_clock_widget.dart';
import 'basketball_team_state_widget.dart';

class BasketballMatchStateWidget extends ConsumerWidget {
  const BasketballMatchStateWidget._({
    required this.awayTeamColor,
    required this.homeTeamColor,
    required this.awayTeamName,
    required this.homeTeamName,
    required this.awayScore,
    required this.homeScore,
    required this.awayFouls,
    required this.homeFouls,
    required this.period,
    required this.gameClock,
    required this.status,
    required this.startTime,
    required this.maxWidth,
    required this.maxHeight,
    required this.league,
    required this.awayTeamBonus,
    required this.homeTeamBonus,
    required this.possessionArrow,
    this.homeTeamDoubleBonus = false,
    this.awayTeamDoubleBonus = false,
    this.isClockRunning = false,
  });
  final Color awayTeamColor;
  final Color homeTeamColor;
  final String awayTeamName;
  final String homeTeamName;
  final int awayScore;
  final int homeScore;
  final int awayFouls;
  final int homeFouls;
  final int period;
  final int gameClock;
  final MatchStatus status;
  final DateTime startTime;
  final double maxWidth;
  final double maxHeight;
  final SportLeague league;
  final bool awayTeamBonus;
  final bool homeTeamBonus;
  final bool homeTeamDoubleBonus;
  final bool awayTeamDoubleBonus;
  final HomeOrAway? possessionArrow;
  final bool isClockRunning;

  factory BasketballMatchStateWidget.cbb(
      {required CollegeBasketballMatch match,
      required double maxWidth,
      required double maxHeight}) {
    return BasketballMatchStateWidget._(
      awayTeamColor: match.awayTeam?.primaryColor ?? Colors.blue,
      homeTeamColor: match.homeTeam?.primaryColor ?? Colors.red,
      awayTeamName: match.awayTeam?.shortName ?? '',
      homeTeamName: match.homeTeam?.shortName ?? '',
      awayScore: match.sportData?.awayScore ?? 0,
      homeScore: match.sportData?.homeScore ?? 0,
      awayFouls: match.sportData?.awayTeamFouls ?? 0,
      homeFouls: match.sportData?.homeTeamFouls ?? 0,
      period: match.periodToUse,
      gameClock: match.sportData?.gameClock ?? 0,
      status: match.status ?? MatchStatus.active,
      startTime: match.startTime ?? DateTime.now(),
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      league: match.league ?? SportLeague.unknown,
      awayTeamBonus: match.sportData?.awayTeamBonus ?? false,
      homeTeamBonus: match.sportData?.homeTeamBonus ?? false,
      awayTeamDoubleBonus: match.sportData?.awayTeamDoubleBonus ?? false,
      homeTeamDoubleBonus: match.sportData?.homeTeamDoubleBonus ?? false,
      possessionArrow: match.sportData?.possessionArrow,
      isClockRunning: match.sportData?.clockRunning ?? false,
    );
  }

  factory BasketballMatchStateWidget.nba(
      {required BasketballMatch match,
      required double maxWidth,
      required double maxHeight}) {
    return BasketballMatchStateWidget._(
      awayTeamColor: match.awayTeam?.primaryColor ?? Colors.blue,
      homeTeamColor: match.homeTeam?.primaryColor ?? Colors.red,
      awayTeamName: match.awayTeam?.abbrv ?? '',
      homeTeamName: match.homeTeam?.abbrv ?? '',
      awayScore: match.sportData?.awayScore ?? 0,
      homeScore: match.sportData?.homeScore ?? 0,
      awayFouls: match.sportData?.awayTeamFouls ?? 0,
      homeFouls: match.sportData?.homeTeamFouls ?? 0,
      period: match.periodToUse,
      gameClock: match.sportData?.gameClock ?? 0,
      status: match.status ?? MatchStatus.active,
      startTime: match.startTime ?? DateTime.now(),
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      league: match.league ?? SportLeague.unknown,
      awayTeamBonus: match.sportData?.awayTeamBonus ?? false,
      homeTeamBonus: match.sportData?.homeTeamBonus ?? false,
      possessionArrow: match.sportData?.possessionArrow,
      isClockRunning: match.sportData?.clockRunning ?? false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return SizedBox(
      height: maxHeight < 300 ? maxHeight * 0.18 : maxHeight * 0.16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// away team state
          Flexible(
            flex: 4,
            child: BasketballTeamStateWidget(
              teamColor: awayTeamColor,
              teamName: awayTeamName,
              score: awayScore,
              teamFouls: awayFouls,
              isHomeTeam: false,
              status: status,
              maxWidth: maxWidth,
              league: league,
              period: period,
              teamBonus: awayTeamBonus,
              teamDoubleBonus: awayTeamDoubleBonus,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: skin.colors.basketballTimeContainerBackground,
              child: BasketballGameClockWidget(
                period: period,
                gameClock: gameClock,
                status: status,
                startTime: startTime,
                maxWidth: maxWidth,
                league: league,
                possessionArrow: possessionArrow,
                isClockRunning: isClockRunning,
              ),
            ),
          ),

          /// home team state
          Flexible(
            flex: 4,
            child: BasketballTeamStateWidget(
              teamColor: homeTeamColor,
              teamName: homeTeamName,
              score: homeScore,
              teamFouls: homeFouls,
              isHomeTeam: true,
              status: status,
              maxWidth: maxWidth,
              league: league,
              period: period,
              teamBonus: homeTeamBonus,
              teamDoubleBonus: homeTeamDoubleBonus,
            ),
          ),
        ],
      ),
    );
  }
}
