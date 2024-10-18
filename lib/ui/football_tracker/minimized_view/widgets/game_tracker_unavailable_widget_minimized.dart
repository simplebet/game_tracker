import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class GameTrackerUnavailableWidgetMinimized extends ConsumerWidget {
  const GameTrackerUnavailableWidgetMinimized({
    required this.reason,
    super.key,
  });

  final GameTrackerUnavailableReason reason;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
      alignment: Alignment.center,
      child: reason == GameTrackerUnavailableReason.matchDisabled
          ? skin.icons.matchDisabledMinimized.asImage()
          : skin.icons.matchNotCoverdMiniminzed.asImage(),
    );
  }
}
