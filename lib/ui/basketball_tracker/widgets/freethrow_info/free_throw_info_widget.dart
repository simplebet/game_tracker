import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils/utils.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../notifiers/court_state_notifier.dart';
import '../../notifiers/free_throw_state_notifier.dart';
import '../../util/constants.dart';
import 'free_throw_attempts_number_widget.dart';

class FreeThrowInfoWidget extends ConsumerWidget {
  const FreeThrowInfoWidget({
    super.key,
    required this.maxWidth,
    required this.league,
  });

  final double maxWidth;
  final SportLeague? league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (league.isNull) {
      return const SizedBox.shrink();
    }

    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Consumer(builder: (_, ref, __) {
      final courtState = ref.watch(courtStateProvider);
      final freeThrowState = ref.watch(freeThrowStateProvider);

      final HomeOrAway? side = freeThrowState.incident?.meta?.side;

      final Color backgroundColor = side != null
          ? side == HomeOrAway.away
              ? courtState.awayTeamColor
              : courtState.homeTeamColor
          : Colors.transparent;

      final int totalAttempts = freeThrowState.incident?.meta?.attempts ?? 0;

      final int attempt = freeThrowState.incident?.meta?.attempt ?? 0;

      final BasketballMatchIncidentEventType eventType =
          freeThrowState.incident?.event ??
              BasketballMatchIncidentEventType.unknown;

      final isNBA = league == SportLeague.nba;
      final isAwaySide = side == HomeOrAway.away;

      final awayTeamName = isNBA
          ? courtState.awayTeam?.franchiseName
          : courtState.awayTeam?.shortName;
      final homeTeamName = isNBA
          ? courtState.homeTeam?.franchiseName
          : courtState.homeTeam?.shortName;
      final teamName = isAwaySide ? awayTeamName : homeTeamName;

      return AnimatedOpacity(
        opacity: freeThrowState.incident != null &&
                freeThrowState.freeThrowInfoPanelIsActive
            ? 1
            : 0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: 34,
          color: backgroundColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                '${teamName?.toUpperCase()} FREE THROW',
                style: skin.textStyles.basketballHeaderBody1Medium.copyWith(
                    height: 1.4, letterSpacing: 0.12, color: skin.colors.grey1),
                textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (totalAttempts >= 1)
                    FreeThrowAttemptsNumberWidget(
                      isActive: eventType ==
                          BasketballMatchIncidentEventType.playerAtLine,
                      text: '1',
                      madeOrMissed: freeThrowState.firstAttempt,
                      eventType: eventType,
                      attempt: attempt,
                      maxWidth: maxWidth,
                    ),
                  if (totalAttempts >= 2)
                    FreeThrowAttemptsNumberWidget(
                      isActive: attempt == 1,
                      text: '2',
                      madeOrMissed: freeThrowState.secondAttempt,
                      eventType: eventType,
                      attempt: attempt,
                      maxWidth: maxWidth,
                    ),
                  if (totalAttempts >= 3)
                    FreeThrowAttemptsNumberWidget(
                      isActive: attempt == 2,
                      text: '3',
                      madeOrMissed: freeThrowState.thirdAttempt,
                      eventType: eventType,
                      attempt: attempt,
                      maxWidth: maxWidth,
                    ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
