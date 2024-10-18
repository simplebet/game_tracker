import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../store/game_tracker_skin_store.dart';
import '../util/constants.dart';

class EndedBasketballTeamStateWidget extends ConsumerWidget {
  const EndedBasketballTeamStateWidget(
      {super.key,
      required this.isHomeTeam,
      required this.teamName,
      required this.score,
      required this.maxWidth});
  final bool isHomeTeam;
  final String teamName;
  final int score;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Row(
      textDirection: isHomeTeam ? TextDirection.rtl : TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          teamName.toUpperCase(),
          style: skin.textStyles.basketballHeader4Bold
              .copyWith(letterSpacing: 0.8, color: skin.colors.grey1),
          textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
        ),
        AutoSizeText(
          score.toString(),
          style: skin.textStyles.basketballHeader4Bold
              .copyWith(letterSpacing: 0.8, color: skin.colors.grey1),
          textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
        ),
      ],
    );
  }
}
