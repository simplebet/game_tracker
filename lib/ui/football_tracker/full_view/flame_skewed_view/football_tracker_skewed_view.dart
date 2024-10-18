import 'package:flutter/material.dart';

import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import '../widgets/football_tracker_loading_widget.dart';
import 'football_tracker_flame_game.dart';

class FootballTrackerSkewedView extends ConsumerWidget {
  const FootballTrackerSkewedView({
    Key? key,
    required this.maxWidth,
    required this.maxHeight,
  }) : super(key: key);

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
      margin: EdgeInsets.only(bottom: maxHeight < kSmallerScreenWidth ? 16 : 8),
      child: GameWidget.controlled(
        loadingBuilder: (_) {
          return FootballFieldLoadingWidget(
            screenWidth: maxWidth,
            screenHeight: maxHeight,
          );
        },
        gameFactory: () => FootballTrackerFlameGame(
          ref,
          skin: skin,
        ),
      ),
    );
  }
}
