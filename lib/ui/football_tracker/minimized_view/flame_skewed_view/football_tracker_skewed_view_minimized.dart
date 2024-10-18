import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/football_tracker/controllers/incident_sequence_controller.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/football_tracker_flame_game_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/widgets/football_tracker_loading_widget_minimized.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballTrackerSkewedViewMinimized extends ConsumerWidget {
  const FootballTrackerSkewedViewMinimized({
    required this.maxWidth,
    required this.maxHeight,
    super.key,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();
    final incidentSequenceController =
        ref.read(incidentSequenceControllerProvider);

    return SizedBox(
      height: 20,
      child: GameWidget.controlled(
        loadingBuilder: (_) {
          return FootballFieldLoadingWidgetMinimized(
            screenWidth: maxWidth,
          );
        },
        gameFactory: () => FootballTrackerFlameGameMinimized(
          ref,
          skin: skin,
          incidentSequenceController: incidentSequenceController,
        ),
      ),
    );
  }
}
