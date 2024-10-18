import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:universal_html/html.dart' as html;

import '../../models/models.dart';
import '../../skin/game_tracker_skin.dart';
import '../../store/game_tracker_providers.dart';
import '../../store/game_tracker_service_store.dart';
import '../../store/game_tracker_skin_store.dart';
import '../../store/game_tracker_ui_store.dart';
import '../shared/extensions.dart';
import '../shared/game_tracker_disabled_widget.dart';
import 'animation_sequence/basketball_animation_sequence.dart';
import 'basketball_match_state/basketball_match_state_widget.dart';
import 'notifiers/court_state_notifier.dart';
import 'notifiers/free_throw_state_notifier.dart';
import 'state_machines/ball_state_machine.dart';
import 'state_machines/court_state_machine.dart';
import 'state_machines/slide_in_arrow_state_machine.dart';
import 'util/constants.dart';
import 'widgets/backboard_animation_widget.dart';
import 'widgets/field_goal_attempts_animation_widget.dart';
import 'widgets/free_throws_animation_widget.dart';
import 'widgets/freethrow_info/free_throw_info_widget.dart';
import 'widgets/full_court_text_widget.dart';
import 'widgets/half_court_text_widget.dart';
import 'widgets/possession_arrow_animation_widget.dart';
import 'widgets/stats_view/basketball_tracker_stats_view.dart';

class BasketballTracker extends ConsumerStatefulWidget {
  const BasketballTracker({required this.match, required this.size, super.key});

  final Match<BasketballData> match;
  final Size size;

  @override
  ConsumerState<BasketballTracker> createState() => _BasketballTrackerState();
}

class _BasketballTrackerState extends ConsumerState<BasketballTracker> {
  late CourtStateNotifier stateNotifier;
  late BasketballAnimationSequenceController animationSequence;
  late GameTrackerServiceStore vizServiceStore;
  late FreeThrowStateNotifier freeThrowStateNotifier;
  late StreamSubscription<MatchIncident>? incidentStream;
  late GameTrackerSkin skin = ref.read(gameTrackerSkinProvider).skin;
  late GameTrackerUIStore uiStore;
  late Mixpanel? analytics;
  late bool showBasketballMatchState;
  late StreamSubscription<html.Event> visibilityChangeSubscription;

  @override
  void initState() {
    super.initState();
    vizServiceStore = ref.read(gameTrackerServiceStoreProvider);
    uiStore = ref.read(gameTrackerUIStoreProvider);
    showBasketballMatchState = ref
        .read(gameTrackerSkinProvider)
        .skin
        .features
        .showBasketballMatchState;
    _clearSequenceBackFromStandby();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _trackAnalytics();

      stateNotifier = ref.read(courtStateProvider.notifier);
      freeThrowStateNotifier = ref.read(freeThrowStateProvider.notifier);

      if (widget.match.homeTeam != null && widget.match.awayTeam != null) {
        stateNotifier.setTeams(
          homeTeam: widget.match.homeTeam!,
          awayTeam: widget.match.awayTeam!,
        );
      }

      animationSequence = ref.read(animationSequenceProvider);
      animationSequence.startQueue();

      _animatePreviousIncidents();

      incidentStream = vizServiceStore.vizChannelStreams.matchIncidentStream
          ?.listen((event) {
        final BasketballMatchIncidentModel incidentModel =
            event as BasketballMatchIncidentModel;

        animationSequence.add(incidentModel);
      });
    });
  }

  @override
  void dispose() {
    incidentStream?.cancel();
    vizServiceStore.clearHistoricPlays();
    visibilityChangeSubscription.cancel();
    super.dispose();
  }

  void _animatePreviousIncidents() {
    final plays = vizServiceStore.basketballPlays;

    if (plays.isNotEmpty) {
      /// We receive more than just one previous play for free throw plays
      /// So we loop and add all past plays
      if (plays.first.event.isFreeThrowEvents) {
        for (BasketballMatchIncidentModel incident in plays) {
          animationSequence.add(incident);
        }
      } else {
        animationSequence.add(plays.first);
      }
    }
  }

  void _clearSequenceBackFromStandby() {
    html.document.onVisibilityChange.listen((event) {
      if (html.document.visibilityState == 'visible') {
        animationSequence.clearStream();
      }
    });
  }

  void _trackAnalytics() {
    analytics = ref.read(mixpanelProvider).value;
    analytics?.trackEvent(
        event: AnalyticsEvents.gameTrackerLaunched,
        league: vizServiceStore.match?.league?.name,
        matchId: vizServiceStore.matchId,
        awayTeam: vizServiceStore.match?.awayTeam?.name,
        homeTeam: vizServiceStore.match?.homeTeam?.name,
        status: vizServiceStore.match?.status?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (vizServiceStore.matchDisabled) {
        Sentry.addBreadcrumb(
            Breadcrumb(message: 'GameTrackerUnavailableWidget: matchDisabled'));
        return GameTrackerUnavailableWidget(
            maxHeight: widget.size.height,
            maxWidth: widget.size.width,
            reason: GameTrackerUnavailableReason.matchDisabled);
      }
      if (!vizServiceStore.matchIsCovered) {
        Sentry.addBreadcrumb(Breadcrumb(
            message: 'GameTrackerUnavailableWidget: matchNotCovered'));
        return GameTrackerUnavailableWidget(
            maxHeight: widget.size.height,
            maxWidth: widget.size.width,
            reason: GameTrackerUnavailableReason.matchNotCovered);
      }

      return Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: widget.size.height * 0.06),
              child: FractionallySizedBox(
                widthFactor: .5,
                child: FreeThrowInfoWidget(
                  maxWidth: widget.size.width,
                  league: widget.match.league,
                ),
              ),
            ),
          ),
          SizedBox(
            width: (widget.size.width / 20).floor() *
                20.0, // Round to next lowest 20 increment. We have specific values mapped to specific widths for the overlays
            child: AspectRatio(
              aspectRatio: kBasketballTrackerAspectRatio,
              child: Stack(
                children: [
                  const CourtStateMachine(),
                  PossessionArrowAnimationWidget(
                    maxWidth: widget.size.width,
                  ),
                  HalfCourtTextWidget(
                    maxWidth: widget.size.width,
                  ),
                  FullCourtTextWidget(
                    maxWidth: widget.size.width,
                    league: widget.match.league,
                  ),
                  const SlideInArrowStateMachine(),
                ],
              ),
            ),
          ),
          const FieldGoalAttemptsAnimationWidget(),
          const FreeThrowsAnimationWidget(),
          const BallStateMachine(),
          const BackboardLeftAnimationWidget(),
          const BackboardRightAnimationWidget(),
          if (showBasketballMatchState)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: FractionallySizedBox(
                  widthFactor: .82,
                  child: widget.match.league == SportLeague.cbb
                      ? BasketballMatchStateWidget.cbb(
                          match: widget.match as CollegeBasketballMatch,
                          maxWidth: widget.size.width,
                          maxHeight: widget.size.height,
                        )
                      : BasketballMatchStateWidget.nba(
                          match: widget.match as BasketballMatch,
                          maxWidth: widget.size.width,
                          maxHeight: widget.size.height,
                        ),
                ),
              ),
            ),
          if (widget.match.league == SportLeague.cbb &&
              vizServiceStore.statsUpdate != null)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(bottom: 22),
                child: GestureDetector(
                  onTap: () {
                    analytics?.trackEvent(
                        event: AnalyticsEvents.statsViewClicked,
                        league: vizServiceStore.match?.league?.name,
                        matchId: vizServiceStore.matchId,
                        awayTeam: vizServiceStore.match?.awayTeam?.name,
                        homeTeam: vizServiceStore.match?.homeTeam?.name);
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) {
                          Sentry.addBreadcrumb(Breadcrumb(
                              message: 'BasketballTrackerStatsView'));
                          return BasketballTrackerStatsView(
                            size: widget.size,
                          );
                        });
                  },
                  child:
                      skin.icons.statsViewButton.asImage(width: 36, height: 36),
                ),
              ),
            )
        ],
      );
    });
  }
}
