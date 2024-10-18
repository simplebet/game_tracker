import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';
import 'package:utils/utils.dart';

import '../../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../notifiers/court_overlay_state_notifier.dart';
import '../overlay_text/minimized_view/minimized_foul_text.dart';
import '../overlay_text/minimized_view/minimized_free_throw_awarded_text.dart';
import '../overlay_text/minimized_view/minimized_period_end_text.dart';
import '../overlay_text/minimized_view/minimized_period_start_text.dart';
import '../overlay_text/minimized_view/minimized_timeout_text.dart';
import '../slide_up_animation.dart';
import '../transformations/full_court_perspective_builder.dart';

class MinimizedFullCourtTextWidget extends ConsumerWidget {
  const MinimizedFullCourtTextWidget({Key? key, required this.league})
      : super(key: key);

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
          return MinimizedFoulText(
            teamName: courtOverlayState.teamName,
            foulType: matchIncidentEventType,
            foulRewardType: courtOverlayState.foulRewardType,
            league: league!,
          );
        case BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne:
        case BasketballMatchIncidentEventType.freeThrowAwardedOne:
        case BasketballMatchIncidentEventType.freeThrowAwardedTwo:
        case BasketballMatchIncidentEventType.freeThrowAwardedThree:
          return MinimizedFreeThrowAwardedText(
            teamName: courtOverlayState.teamName,
            teamColor: courtOverlayState.overlayColor,
            freeThrowType: matchIncidentEventType,
          );
        case BasketballMatchIncidentEventType.timeoutTeam:
          return MinimizedTimeoutText.team(
            teamName: courtOverlayState.teamName,
          );
        case BasketballMatchIncidentEventType.timeoutOfficial:
          return MinimizedTimeoutText.official();
        case BasketballMatchIncidentEventType.periodStart:
          return MinimizedPeriodStartText(period: period, league: league);
        case BasketballMatchIncidentEventType.periodEnd:
          return courtOverlayState.isHalfTime
              ? MinimizedPeriodEndText.halfTime()
              : MinimizedPeriodEndText.period(
                  period: period,
                  league: league,
                );
        case BasketballMatchIncidentEventType.awaitingOt:
          return MinimizedPeriodEndText.overTime();
        default:
          return const SizedBox.shrink();
      }
    }

    return SlideUpAnimation(
      triggerSlideUpAnimation: courtOverlayState.showFullCourtOverlay,
      child: FullCourtPerspectiveBuilder(
        isMinimizedView: true,
        isTextOverlay: true,
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
