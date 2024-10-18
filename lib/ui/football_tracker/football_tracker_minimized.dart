import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/football_tracker_skewed_view_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/inverted_triangle_widget.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/last_play_tray/last_play_tray_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/rive/transition_overlays_minimized_widget.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/widgets/game_tracker_unavailable_widget_minimized.dart';
import 'package:game_tracker/ui/football_tracker/state_nofitifiers/last_play_tray_state_notifier.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/football_last_play_tray_formatter.dart';

class FootballTrackerMinimized extends ConsumerStatefulWidget {
  const FootballTrackerMinimized({required this.size, super.key});

  final Size size;

  @override
  ConsumerState<FootballTrackerMinimized> createState() =>
      _FootballTrackerMinimizedState();
}

class _FootballTrackerMinimizedState
    extends ConsumerState<FootballTrackerMinimized> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameTrackerScreenControllerProvider);
    final match = state.match as Match<FootballData>?;
    final homeTeam = match?.homeTeam;
    final awayTeam = match?.awayTeam;
    final FootballLastPlayTrayFormatter formatter =
        FootballLastPlayTrayFormatter(
      homeTeam: homeTeam,
      awayTeam: awayTeam,
    );

    if (state.match == null) {
      return const SizedBox.shrink();
    }

    if (state.matchIsDisabled) {
      return const GameTrackerUnavailableWidgetMinimized(
        reason: GameTrackerUnavailableReason.matchDisabled,
      );
    }

    if (!state.matchIsCovered) {
      return const GameTrackerUnavailableWidgetMinimized(
        reason: GameTrackerUnavailableReason.matchNotCovered,
      );
    }

    return Stack(
      children: [
        Stack(
          children: [
            /// Flame game widget
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: FootballTrackerSkewedViewMinimized(
                  maxWidth: widget.size.width,
                  maxHeight: widget.size.height,
                ),
              ),
            ),
          ],
        ),

        /// triangle placeholders to give a edge effect to Last Play Tray
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20, child: InvertedTriangleWidget()),
            SizedBox(
              width: 20,
              child: Transform(
                alignment: Alignment.center,

                /// flip the widget horizontally
                transform: Matrix4.identity()..scale(-1.0, 1, 1),
                child: const InvertedTriangleWidget(),
              ),
            ),
          ],
        ),

        /// Last play tray
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: LastPlayTrayMinimized(
              width: widget.size.width,
              matchStatus: match?.status,
              lastPlay: ref.watch(lastPlayTrayStateProvider).lastPlay ??
                  state.footballIncidents?.last,
              startTime: match!.startTime!,
              formatter: formatter,
              awayTeam: awayTeam,
              homeTeam: homeTeam,
            ),
          ),
        ),

        /// Rive overlay animations
        TransitionOverlaysMinimizedWidget(
          screenWidth: widget.size.width,
        ),
      ],
    );
  }
}
