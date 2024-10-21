import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import 'all_drives_play_tray_widget.dart';
import 'pre_match_play_tray_widget.dart';

class LastPlayTray extends ConsumerWidget {
  const LastPlayTray({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();
    final state = ref.watch(gameTrackerScreenControllerProvider);

    if (state.match?.status == MatchStatus.preMatch) {
      return LastPlayTrayWidgetWrapper(
        maxWidth: size.width,
        maxHeight: size.height,
        child: PreMatchPlayTrayWidget(
          match: state.match as Match<FootballData>,
          maxWidth: size.width,
        ),
      );
    }
    if (state.footballIncidents?.last.event ==
        FootballMatchIncidentEventType.matchEnded) {
      return LastPlayTrayWidgetWrapper(
        maxWidth: size.width,
        maxHeight: size.height,
        child: Center(
          child: Text(
            'MATCH ENDED',
            style: skin.textStyles.body1.copyWith(color: skin.colors.grey1),
          ),
        ),
      );
    }

    return AllDrivesPlayTrayWidget(
      maxWidth: size.width,
      maxHeight: size.height,
    );
  }
}

class LastPlayTrayWidgetWrapper extends ConsumerWidget {
  const LastPlayTrayWidgetWrapper({
    Key? key,
    required this.child,
    required this.maxWidth,
    required this.maxHeight,
  }) : super(key: key);

  final Widget child;
  final double maxWidth, maxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
      color: skin.colors.background,
      width: maxWidth,
      height: maxHeight * kLastPlayTrayWrapperHeightFactor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: child,
    );
  }
}
