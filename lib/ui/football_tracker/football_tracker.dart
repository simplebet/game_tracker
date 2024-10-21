import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/football_tracker_skewed_view.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/football_tracker_match_state_widget.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/match_status_screens/match_status_screen.dart';
import 'package:game_tracker/ui/football_tracker/full_view/last_play_tray/last_play_tray.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/game_tracker_disabled_widget.dart';

class FootballTracker extends ConsumerStatefulWidget {
  const FootballTracker({required this.size, super.key});

  final Size size;

  @override
  ConsumerState<FootballTracker> createState() => _FootballTrackerState();
}

class _FootballTrackerState extends ConsumerState<FootballTracker> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameTrackerScreenControllerProvider);

    if (state.matchIsDisabled) {
      return GameTrackerUnavailableWidget(
        maxHeight: widget.size.height,
        maxWidth: widget.size.width,
        reason: GameTrackerUnavailableReason.matchDisabled,
      );
    }

    if (!state.matchIsCovered) {
      return GameTrackerUnavailableWidget(
        maxHeight: widget.size.height,
        maxWidth: widget.size.width,
        reason: GameTrackerUnavailableReason.matchNotCovered,
      );
    }

    return Stack(
      children: [
        if (state.match?.status == MatchStatus.active)
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: FootballTrackerMatchStateWidget(
                match: state.match as Match<FootballData>,
                maxWidth: widget.size.width,
                maxHeight: widget.size.height,
                lastFootballPlay: state.footballIncidents?.last,
              ),
            ),
          ),
        if (state.match != null)
          Positioned.fill(
            child: Align(
              child: FootballTrackerSkewedView(
                maxWidth: widget.size.width,
                maxHeight: widget.size.height,
              ),
            ),
          ),
        if (state.match?.status == MatchStatus.preMatch)
          Positioned.fill(
            child: Align(
              child: MatchStatusScreen(
                size: widget.size,
                match: state.match as Match<FootballData>,
              ),
            ),
          ),
        if (state.match != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LastPlayTray(
                size: widget.size,
              ),
            ),
          ),
      ],
    );
  }
}
