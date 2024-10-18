import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import 'active_basketball_game_clock_widget_minimized.dart';
import 'ended_basketball_game_clock_widget_minimized.dart';
import 'prematch_basketball_game_clock_widget_minimized.dart';

class BasketballGameClockWidgetMinimized extends ConsumerWidget {
  const BasketballGameClockWidgetMinimized(
      {super.key,
      required this.period,
      required this.gameClock,
      required this.status,
      required this.startTime,
      required this.maxWidth,
      required this.league,
      required this.possessionArrow,
      this.isClockRunning = false});
  final int period;
  final int gameClock;
  final bool isClockRunning;
  final MatchStatus status;
  final DateTime startTime;
  final double maxWidth;
  final SportLeague league;
  final HomeOrAway? possessionArrow;

  Widget get gameClockWidget {
    switch (status) {
      case MatchStatus.preMatch:
        return PrematchBasketballGameClockWidgetMinimized(
          startTime: startTime,
          maxWidth: maxWidth,
        );
      case MatchStatus.active:
        return ActiveBasketballGameClockWidgetMinimized(
          period: period,
          gameClock: gameClock,
          maxWidth: maxWidth,
          league: league,
          possessionArrow: possessionArrow,
          isClockRunning: isClockRunning,
        );
      case MatchStatus.ended:
        return EndedBasketballGameClockWidgetMinimized(
          maxWidth: maxWidth,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      color: skin.colors.basketballGrey3,
      child: gameClockWidget,
    );
  }
}
