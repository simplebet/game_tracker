import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../notifiers/court_overlay_state_notifier.dart';
import '../../util/constants.dart';
import '../overlay_text/minimized_view/minimized_field_goal_attempt_text.dart';
import '../overlay_text/minimized_view/minimized_tip_off_won_text.dart';
import '../slide_up_animation.dart';
import '../transformations/half_court_perspective_builder.dart';
import '../transformations/mirror_transform.dart';

class MinimizedHalfCourtTextWidget extends ConsumerWidget {
  const MinimizedHalfCourtTextWidget({
    Key? key,
    required this.maxWidth,
  }) : super(key: key);

  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtOverlayState = ref.watch(courtOverlayStateProvider);

    Widget getTextWidget() {
      switch (courtOverlayState.halfCourtOverlayType) {
        case BasketballMatchIncidentEventType.fieldGoalMadeTwo:
          return MinimizedFieldGoalAttemptText.fieldGoalMadeTwo(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.fieldGoalMissedTwo:
          return MinimizedFieldGoalAttemptText.fieldGoalMissedTwo(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.fieldGoalMadeThree:
          return MinimizedFieldGoalAttemptText.fieldGoalMadeThree(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.fieldGoalMissedThree:
          return MinimizedFieldGoalAttemptText.fieldGoalMissedThree(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.freeThrowMade:
          return MinimizedFieldGoalAttemptText.freeThrowMade(
              courtSide: courtOverlayState.halfCourtSide, maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.freeThrowMissed:
          return MinimizedFieldGoalAttemptText.freeThrowMissed(
              courtSide: courtOverlayState.halfCourtSide, maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.tipOff:
          return MinimizedTipOffWonText(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide);
        default:
          return const SizedBox.shrink();
      }
    }

    Color getOverlayColor() {
      if (courtOverlayState.halfCourtOverlayType.isBallMissedEvents) {
        return fieldGoalMissedFieldColor;
      } else {
        return courtOverlayState.overlayColor;
      }
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideUpAnimation(
        triggerSlideUpAnimation: courtOverlayState.showHalfCourtOverlay,
        child: HalfCourtPerspectiveBuilder(
          isMinimizedView: true,
          isTextOverlay: true,
          isLeftSide: courtOverlayState.halfCourtSide == HomeOrAway.away,
          child: Container(
            padding: const EdgeInsets.only(top: 22, left: 14, right: 14),
            color: getOverlayColor(),
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.fill,
              child: MirrorTransform(
                doFlip: courtOverlayState.halfCourtSide == HomeOrAway.home,
                child: getTextWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
