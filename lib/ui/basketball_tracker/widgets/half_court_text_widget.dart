import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../notifiers/court_overlay_state_notifier.dart';
import '../util/constants.dart';
import 'overlay_text/field_goal_attempt_text.dart';
import 'overlay_text/tip_off_won_text.dart';
import 'slide_up_animation.dart';
import 'transformations/half_court_perspective_builder.dart';
import 'transformations/mirror_transform.dart';

class HalfCourtTextWidget extends ConsumerWidget {
  const HalfCourtTextWidget({
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
          return FieldGoalAttemptText.fieldGoalMadeTwo(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.fieldGoalMissedTwo:
          return FieldGoalAttemptText.fieldGoalMissedTwo(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.fieldGoalMadeThree:
          return FieldGoalAttemptText.fieldGoalMadeThree(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.fieldGoalMissedThree:
          return FieldGoalAttemptText.fieldGoalMissedThree(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.freeThrowMade:
          return FieldGoalAttemptText.freeThrowMade(
              courtSide: courtOverlayState.halfCourtSide, maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.freeThrowMissed:
          return FieldGoalAttemptText.freeThrowMissed(
              courtSide: courtOverlayState.halfCourtSide, maxWidth: maxWidth);
        case BasketballMatchIncidentEventType.tipOff:
          return TipOffWonText(
              teamName: courtOverlayState.teamName,
              courtSide: courtOverlayState.halfCourtSide,
              maxWidth: maxWidth);
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
          isLeftSide: courtOverlayState.halfCourtSide == HomeOrAway.away,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: .5),
            color: getOverlayColor(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                      child: MirrorTransform(
                        doFlip:
                            courtOverlayState.halfCourtSide == HomeOrAway.home,
                        child: getTextWidget(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
