import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils/utils.dart';

import '../../../models/models.dart';
import '../notifiers/court_overlay_state_notifier.dart';
import 'overlay_text/foul_text.dart';
import 'overlay_text/free_throw_awarded_text.dart';
import 'overlay_text/period_end_text.dart';
import 'overlay_text/period_start_text.dart';
import 'overlay_text/timeout_text.dart';
import 'slide_up_animation.dart';
import 'transformations/full_court_perspective_builder.dart';

class FullCourtTextWidget extends ConsumerWidget {
  const FullCourtTextWidget(
      {Key? key, required this.maxWidth, required this.league})
      : super(key: key);

  final double maxWidth;
  final SportLeague? league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (league.isNull) {
      return const SizedBox.shrink();
    }

    final courtOverlayState = ref.watch(courtOverlayStateProvider);
    final period = courtOverlayState.period;

    Widget getTextWidget(
        {required BasketballMatchIncidentEventType matchIncidentEventType}) {
      switch (matchIncidentEventType) {
        case BasketballMatchIncidentEventType.foulFlagrant:
        case BasketballMatchIncidentEventType.foulFloor:
        case BasketballMatchIncidentEventType.foulOffensive:
        case BasketballMatchIncidentEventType.foulShootingThree:
        case BasketballMatchIncidentEventType.foulShootingTwo:
        case BasketballMatchIncidentEventType.foulTechnicalA:
        case BasketballMatchIncidentEventType.foulTechnicalB:
        case BasketballMatchIncidentEventType.foulTake:
        case BasketballMatchIncidentEventType.foulUnknown:
          return FoulText(
            teamName: courtOverlayState.teamName,
            foulType: matchIncidentEventType,
            foulRewardType: courtOverlayState.foulRewardType,
            maxWidth: maxWidth,
            league: league!,
          );
        case BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne:
        case BasketballMatchIncidentEventType.freeThrowAwardedOne:
        case BasketballMatchIncidentEventType.freeThrowAwardedTwo:
        case BasketballMatchIncidentEventType.freeThrowAwardedThree:
          return FreeThrowAwardedText(
              teamName: courtOverlayState.teamName,
              teamColor: courtOverlayState.overlayColor,
              freeThrowType: matchIncidentEventType,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.timeoutTeam:
          return TimeoutText.team(
              teamName: courtOverlayState.teamName, maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.timeoutOfficial:
          return TimeoutText.official(maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.periodStart:
          return PeriodStartText(
              period: period, maxWidth: maxWidth, league: league);
        case BasketballMatchIncidentEventType.periodEnd:
          return courtOverlayState.isHalfTime
              ? PeriodEndText.halfTime(
                  maxWidth: maxWidth,
                )
              : PeriodEndText.period(
                  maxWidth: maxWidth,
                  period: period,
                  league: league,
                );
        case BasketballMatchIncidentEventType.awaitingOt:
          return PeriodEndText.overTime(maxWidth: maxWidth);
        default:
          return const SizedBox.shrink();
      }
    }

    return SlideUpAnimation(
      triggerSlideUpAnimation: courtOverlayState.showFullCourtOverlay,
      child: FullCourtPerspectiveBuilder(
        child: AnimatedContainer(
          clipBehavior: Clip.antiAlias,
          duration: Duration(
              milliseconds: courtOverlayState.isAnimatingColor ? 300 : 0),
          color: courtOverlayState.overlayColor,
          child: AnimatedSlide(
            offset: Offset(0, courtOverlayState.isAnimatingHideText ? .75 : 0),
            duration: const Duration(milliseconds: 300),
            child: getTextWidget(
              matchIncidentEventType: courtOverlayState.fullCourtOverlayType,
            ),
          ),
        ),
      ),
    );
  }
}
