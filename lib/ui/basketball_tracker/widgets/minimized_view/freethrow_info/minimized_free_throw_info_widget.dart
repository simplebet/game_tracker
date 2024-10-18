import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';
import 'package:utils/utils.dart';

import '../../../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../../../../store/game_tracker_skin_store.dart';
import '../../../notifiers/court_state_notifier.dart';
import '../../../notifiers/free_throw_state_notifier.dart';
import '../../slide_up_animation.dart';
import '../../transformations/half_court_perspective_builder.dart';
import 'minimized_free_throw_attempts_number_widget.dart';

class MinimizedFreeThrowInfoWidget extends ConsumerWidget {
  const MinimizedFreeThrowInfoWidget({
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

      final Color teamColor = side == HomeOrAway.away
          ? courtState.awayTeamColor
          : courtState.homeTeamColor;

      final Color backgroundColor =
          side != null ? teamColor : Colors.transparent;

      final Color textColor =
          side != null ? skin.colors.basketballGrey1 : Colors.transparent;

      final int totalAttempts = freeThrowState.incident?.meta?.attempts ?? 0;

      final int attempt = freeThrowState.incident?.meta?.attempt ?? 0;

      final BasketballMatchIncidentEventType eventType =
          freeThrowState.incident?.event ??
              BasketballMatchIncidentEventType.unknown;

      final isAwaySide = side == HomeOrAway.away;

      final isNBA = league == SportLeague.nba;

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
        duration: const Duration(milliseconds: 200),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SlideUpAnimation(
            triggerSlideUpAnimation: true,
            child: Stack(
              children: [
                HalfCourtPerspectiveBuilder(
                  isMinimizedView: true,
                  isTextOverlay: true,
                  isLeftSide: isAwaySide,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 14, right: 14),
                    color: backgroundColor,
                  ),
                ),
                Container(
                  width: maxWidth,
                  alignment: Alignment.center,
                  padding: isAwaySide
                      ? const EdgeInsets.only(left: 35)
                      : const EdgeInsets.only(right: 35),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection:
                        isAwaySide ? TextDirection.ltr : TextDirection.rtl,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: teamName?.toUpperCase() ?? "",
                              style: skin.textStyles.body4Medium
                                  .copyWith(color: textColor),
                            ),
                            TextSpan(
                              text: "\nFREE THROW",
                              style: skin.textStyles.body4Thin
                                  .copyWith(color: textColor, height: 0.85),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (totalAttempts >= 1)
                            MinimizedFreeThrowAttemptsNumberWidget(
                              isActive: eventType ==
                                  BasketballMatchIncidentEventType.playerAtLine,
                              text: '1',
                              madeOrMissed: freeThrowState.firstAttempt,
                              eventType: eventType,
                              attempt: attempt,
                              maxWidth: maxWidth,
                            ),
                          if (totalAttempts >= 2)
                            MinimizedFreeThrowAttemptsNumberWidget(
                              isActive: attempt == 1,
                              text: '2',
                              madeOrMissed: freeThrowState.secondAttempt,
                              eventType: eventType,
                              attempt: attempt,
                              maxWidth: maxWidth,
                            ),
                          if (totalAttempts >= 3)
                            MinimizedFreeThrowAttemptsNumberWidget(
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
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
