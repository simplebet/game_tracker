import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../../store/game_tracker_providers.dart';
import '../../store/game_tracker_service_store.dart';
import '../../store/game_tracker_skin_store.dart';
import 'animation_sequence/basketball_animation_sequence.dart';
import 'basketball_match_state/minimized_view/basketball_match_state_widget_minimized.dart';
import 'notifiers/court_state_notifier.dart';
import 'notifiers/free_throw_state_notifier.dart';
import 'state_machines/minimized_view/minimized_ball_state_machine.dart';
import 'state_machines/minimized_view/minimized_court_state_machine.dart';
import 'state_machines/minimized_view/minimized_slide_in_arrow_state_machine.dart';
import 'util/constants.dart';
import 'widgets/minimized_view/freethrow_info/minimized_free_throw_info_widget.dart';
import 'widgets/minimized_view/minimized_backboard_animation_widget.dart';
import 'widgets/minimized_view/minimized_field_goal_attempts_animation_widget.dart';
import 'widgets/minimized_view/minimized_free_throws_animation_widget.dart';
import 'widgets/minimized_view/minimized_full_court_text_widget.dart';
import 'widgets/minimized_view/minimized_half_court_text_widget.dart';
import 'widgets/minimized_view/minimized_possession_arrow_animation_widget.dart';

class BasketballTrackerMinimized extends ConsumerStatefulWidget {
  const BasketballTrackerMinimized(
      {required this.match, required this.size, super.key});

  final Match<BasketballData> match;
  final Size size;

  @override
  ConsumerState<BasketballTrackerMinimized> createState() =>
      _BasketballTrackerState();
}

class _BasketballTrackerState
    extends ConsumerState<BasketballTrackerMinimized> {
  late CourtStateNotifier stateNotifier;
  late BasketballAnimationSequenceController animationSequence;
  late GameTrackerServiceStore vizServiceStore;
  late FreeThrowStateNotifier freeThrowStateNotifier;
  late StreamSubscription<MatchIncident>? incidentStream;
  late bool showBasketballMatchState;

  @override
  void initState() {
    super.initState();
    _clearSequenceBackFromStandby();

    showBasketballMatchState = ref
        .read(gameTrackerSkinProvider)
        .skin
        .features
        .showBasketballMatchState;

    /// it will be called when build method finished it’s rendering
    SchedulerBinding.instance.addPostFrameCallback((_) {
      stateNotifier = ref.read(courtStateProvider.notifier);
      freeThrowStateNotifier = ref.read(freeThrowStateProvider.notifier);
      vizServiceStore = ref.read(gameTrackerServiceStoreProvider);

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

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      /// do not remove: this is to init the courtState
      // ignore: unused_local_variable
      final courtState = ref.watch(courtStateProvider);

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: kBasketballTrackerAspectRatioMinimized,
            child: Stack(
              children: [
                MinimizedCourtStateMachine(
                  maxWidth: widget.size.width,
                ),
                MinimizedHalfCourtTextWidget(
                  maxWidth: widget.size.width,
                ),
                MinimizedFullCourtTextWidget(
                  league: widget.match.league,
                ),
                const MinimizedPossessionArrowAnimationWidget(),
                const MinimizedFieldGoalAttemptsAnimationWidget(),
                const MinimizedBackboardLeftAnimationWidget(),
                const MinimizedBackboardRightAnimationWidget(),
                const MinimizedSlideInArrowStateMachine(),
                const MinimizedFreeThrowsAnimationWidget(),
                const MinimizedBallStateMachine(),
                MinimizedFreeThrowInfoWidget(
                  maxWidth: widget.size.width,
                  league: widget.match.league,
                ),
              ],
            ),
          ),

          /// basketball match state
          if (showBasketballMatchState)
            widget.match.league == SportLeague.cbb
                ? BasketballMatchStateWidgetMinimized.cbb(
                    match: widget.match as CollegeBasketballMatch,
                    maxWidth: widget.size.width,
                    maxHeight: widget.size.height,
                  )
                : BasketballMatchStateWidgetMinimized.nba(
                    match: widget.match as BasketballMatch,
                    maxWidth: widget.size.width,
                    maxHeight: widget.size.height,
                  )
        ],
      );
    });
  }
}
