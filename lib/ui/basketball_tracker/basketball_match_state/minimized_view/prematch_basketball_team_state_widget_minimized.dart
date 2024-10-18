import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class PrematchBasketballTeamStateWidgetMinimized extends ConsumerWidget {
  const PrematchBasketballTeamStateWidgetMinimized(
      {super.key,
      required this.isHomeTeam,
      required this.teamName,
      required this.maxWidth});
  final bool isHomeTeam;
  final String teamName;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment:
          isHomeTeam ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment:
              isHomeTeam ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            AutoSizeText(
              teamName.toUpperCase(),
              style: skin.textStyles.basketballHeader4Bold.copyWith(
                  letterSpacing: 0.8, color: skin.colors.grey1, height: 1),
              textScaleFactor:
                  maxWidth / kBasketballTrackerBaseScreenWidth * 0.76,
            ),
          ],
        ),
        AutoSizeText(
          isHomeTeam ? 'HOME' : 'AWAY',
          style: skin.textStyles.basketballHeaderBody2Medium.copyWith(
              letterSpacing: 0.1, color: skin.colors.grey1, height: 1),
          textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth * 0.76,
        ),
      ],
    );
  }
}
