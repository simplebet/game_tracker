import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils/utils.dart';

import '../../../models/models.dart';
import '../../../store/game_tracker_skin_store.dart';
import '../../shared/custom_progress_bar.dart';
import '../util/constants.dart';

class ActiveBasketballGameClockWidget extends StatelessWidget {
  const ActiveBasketballGameClockWidget({
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
    return (league == SportLeague.cbb && possessionArrow != null)
        ? ClockWithPossessionWidget(
            gameClock: gameClock,
            isClockRunning: isClockRunning,
            maxWidth: maxWidth,
            league: league,
            period: period,
            possessionArrow: possessionArrow)
        : ClockWidget(
            gameClock: gameClock,
            isClockRunning: isClockRunning,
            maxWidth: maxWidth,
            league: league,
            period: period,
          );
  }
}

class ClockWithPossessionWidget extends StatelessWidget {
  const ClockWithPossessionWidget({
    super.key,
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ClockWidget(
            gameClock: gameClock,
            maxWidth: maxWidth,
            league: league,
            period: period,
            isClockRunning: isClockRunning,
          ),
        ),
        PossessionWidget(possessionArrow: possessionArrow, maxWidth: maxWidth),
      ],
    );
  }
}

class PossessionWidget extends ConsumerStatefulWidget {
  const PossessionWidget({
    Key? key,
    required this.possessionArrow,
    required this.maxWidth,
  }) : super(key: key);

  final HomeOrAway? possessionArrow;
  final double maxWidth;

  @override
  PossessionWidgetState createState() => PossessionWidgetState();
}

class PossessionWidgetState extends ConsumerState<PossessionWidget> {
  late HomeOrAway? possessionArrow;

  @override
  void initState() {
    super.initState();
    possessionArrow = widget.possessionArrow;
  }

  @override
  void didUpdateWidget(covariant PossessionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// when score changes from match_update
    /// delay the update to widgets for
    /// possessionArrow
    if (widget.possessionArrow != oldWidget.possessionArrow) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          possessionArrow = widget.possessionArrow;
        });
      });
    } else {
      setState(() {
        possessionArrow = oldWidget.possessionArrow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: (widget.possessionArrow == HomeOrAway.away)
                  ? skin.colors.grey1
                  : skin.colors.basketballGrey3,
              size: widget.maxWidth * 0.02,
            ),
            AutoSizeText(
              'POSS',
              style: skin.textStyles.basketballPossessionArrow
                  .copyWith(letterSpacing: 0.12, color: skin.colors.grey1),
              textScaleFactor:
                  widget.maxWidth / kBasketballTrackerBaseScreenWidth,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: (widget.possessionArrow == HomeOrAway.home)
                  ? skin.colors.grey1
                  : skin.colors.basketballGrey3,
              size: widget.maxWidth * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class ClockWidget extends ConsumerWidget {
  const ClockWidget({
    super.key,
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: Row(
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
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: MovingTickerWidget(
                gameClockText: gameClockText,
                maxWidth: maxWidth,
                isClockRunning: isClockRunning),
          ),
        )
      ],
    );
  }
}

class MovingTickerWidget extends ConsumerWidget {
  const MovingTickerWidget(
      {super.key,
      required this.gameClockText,
      required this.maxWidth,
      required this.isClockRunning});

  final String gameClockText;
  final bool isClockRunning;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    if (isClockRunning) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 2.0),
          AutoSizeText(
            gameClockText,
            textAlign: TextAlign.center,
            style: skin.textStyles.basketballClock.copyWith(
                letterSpacing: 0.56,
                height: 1,
                color: skin.colors.basketballGrey4),
            textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
          ),
          const Padding(
              padding: EdgeInsets.only(right: 12.0, left: 12.0, bottom: 3.0),
              child: CustomProgressBar(height: 2))
        ],
      );
    }
    return AutoSizeText(
      gameClockText,
      textAlign: TextAlign.center,
      style: skin.textStyles.basketballClock
          .copyWith(letterSpacing: 0.56, color: skin.colors.basketballGrey4),
      textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
    );
  }
}
