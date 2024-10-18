import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils/utils.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class ActiveBasketballGameClockWidgetMinimized extends StatelessWidget {
  const ActiveBasketballGameClockWidgetMinimized({
    super.key,
    required this.period,
    required this.gameClock,
    required this.maxWidth,
    required this.league,
    required this.possessionArrow,
    this.isClockRunning = false,
  });

  final int period;
  final int gameClock;
  final bool isClockRunning;
  final double maxWidth;
  final SportLeague league;
  final HomeOrAway? possessionArrow;

  @override
  Widget build(BuildContext context) {
    final isClockWithPossesissonArrow =
        league == SportLeague.cbb && possessionArrow != null;
    return isClockWithPossesissonArrow
        ? _ClockWithPossessionWidgetMinimized(
            gameClock: gameClock,
            isClockRunning: isClockRunning,
            maxWidth: maxWidth,
            league: league,
            period: period,
            possessionArrow: possessionArrow)
        : _ClockWidgetMinimized(
            gameClock: gameClock,
            isClockRunning: isClockRunning,
            maxWidth: maxWidth,
            league: league,
            period: period,
          );
  }
}

class _ClockWithPossessionWidgetMinimized extends ConsumerWidget {
  const _ClockWithPossessionWidgetMinimized({
    required this.gameClock,
    required this.maxWidth,
    required this.league,
    required this.period,
    required this.possessionArrow,
    this.isClockRunning = false,
  });

  final int gameClock;
  final bool isClockRunning;
  final double maxWidth;
  final SportLeague league;
  final int period;
  final HomeOrAway? possessionArrow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _PossessionAwayWidget(
              maxWidth: maxWidth,
              color: possessionArrow == HomeOrAway.away
                  ? skin.colors.grey1
                  : Colors.transparent),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: _ClockWidgetMinimized(
            gameClock: gameClock,
            maxWidth: maxWidth,
            league: league,
            period: period,
            isClockRunning: isClockRunning,
          ),
        ),
        Expanded(
          child: _PossessionHomeWidget(
            maxWidth: maxWidth,
            color: possessionArrow == HomeOrAway.home
                ? skin.colors.grey1
                : Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class _PossessionHomeWidget extends ConsumerWidget {
  const _PossessionHomeWidget({required this.maxWidth, required this.color});

  final double maxWidth;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'P',
            style: skin.textStyles.basketballHeaderBody2Medium
                .copyWith(letterSpacing: 0.12, color: color),
            textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: color,
            size: maxWidth * 0.02,
          ),
        ],
      ),
    );
  }
}

class _PossessionAwayWidget extends ConsumerWidget {
  const _PossessionAwayWidget({
    required this.maxWidth,
    required this.color,
  });

  final double maxWidth;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios_new,
            color: color,
            size: maxWidth * 0.02,
          ),
          AutoSizeText(
            'P',
            style: skin.textStyles.basketballHeaderBody2Medium
                .copyWith(letterSpacing: 0.12, color: color),
            textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
          ),
        ],
      ),
    );
  }
}

class _ClockWidgetMinimized extends ConsumerWidget {
  const _ClockWidgetMinimized({
    required this.maxWidth,
    required this.league,
    required this.period,
    required this.gameClock,
    this.isClockRunning = false,
  });

  final double maxWidth;
  final SportLeague league;
  final int period;
  final int gameClock;
  final bool isClockRunning;

  String get periodText {
    if (league == SportLeague.nba) {
      switch (period) {
        case 1:
        case 2:
        case 3:
        case 4:
          return period.toString();
        case 5:
          return 'OT';
        default:
          return "OT${period - 4}";
      }
    }

    switch (period) {
      case 1:
      case 2:
        return period.toString();
      case 3:
        return "OT";
      default:
        return "OT${period - 2}";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    final showCBBSuffix =
        league == SportLeague.cbb && (period == 1 || period == 2);
    final showNBASuffix = league == SportLeague.nba && period < 5;
    final gameClockText =
        "${gameClock ~/ 60}:${(gameClock % 60).toString().padLeft(2, "0")}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          periodText.toString(),
          style: skin.textStyles.basketballHeaderBody1Medium
              .copyWith(letterSpacing: 0.12, color: skin.colors.grey1),
          textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
        ),
        if (showCBBSuffix || showNBASuffix)
          AutoSizeText(
            formatOrdinalSuffix(period).toUpperCase(),
            style: skin.textStyles.basketballHeaderBody3Medium
                .copyWith(color: skin.colors.grey1),
            textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
          ),
        const SizedBox(width: 5),
        Column(
          children: [
            const SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: _MovingTickerWidgetMinimized(
                  gameClockText: gameClockText,
                  maxWidth: maxWidth,
                  isClockRunning: isClockRunning),
            ),
          ],
        )
      ],
    );
  }
}

class _MovingTickerWidgetMinimized extends ConsumerWidget {
  const _MovingTickerWidgetMinimized(
      {required this.gameClockText,
      required this.maxWidth,
      required this.isClockRunning});

  final String gameClockText;
  final bool isClockRunning;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return AutoSizeText(
      gameClockText,
      textAlign: TextAlign.center,
      style: skin.textStyles.basketballHeader6Bold.copyWith(
        letterSpacing: 0.56,
        height: 1.1,
        color: skin.colors.basketballGrey4,
        fontSize: 12,
      ),
      textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
    );
  }
}
