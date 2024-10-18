import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';
import '../animated_swipe_widget.dart';

class ActiveBasketballTeamStateWidgetMinimized extends ConsumerWidget {
  const ActiveBasketballTeamStateWidgetMinimized({
    super.key,
    required this.isHomeTeam,
    required this.teamName,
    required this.score,
    required this.teamFouls,
    required this.maxWidth,
    required this.league,
    required this.teamBonus,
    required this.teamDoubleBonus,
    required this.period,
    required this.teamColor,
  });

  final bool isHomeTeam;
  final String teamName;
  final int score;
  final int teamFouls;
  final double maxWidth;
  final SportLeague league;
  final bool teamBonus;
  final bool teamDoubleBonus;
  final int period;
  final Color teamColor;

  bool get showTeamDoubleBonus => teamDoubleBonus && league == SportLeague.cbb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    final showBasketballScore =
        ref.watch(gameTrackerSkinProvider).skin.features.showBasketballScore;
    final showBasketballFouls =
        ref.watch(gameTrackerSkinProvider).skin.features.showBasketballFouls;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment:
          isHomeTeam ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          textDirection: isHomeTeam ? TextDirection.rtl : TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              teamName.toUpperCase(),
              style: skin.textStyles.basketballHeader5Bold.copyWith(
                  letterSpacing: 0.8, color: skin.colors.grey1, height: 1),
              textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
            ),
            if (showBasketballFouls)
              Container(
                margin: const EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "F: ",
                      style: skin.textStyles.basketballHeaderBody2Medium
                          .copyWith(color: skin.colors.grey1, height: 1),
                      textScaleFactor:
                          maxWidth / kBasketballTrackerBaseScreenWidth,
                    ),
                    AnimatedSwipe(
                      teamColor: teamColor,
                      maxWidth: maxWidth,
                      key: ValueKey(teamFouls),
                      child: AutoSizeText(
                        teamFouls.toString(),
                        style: skin.textStyles.basketballHeaderBody2Medium
                            .copyWith(color: skin.colors.grey1, height: 1),
                        textScaleFactor:
                            maxWidth / kBasketballTrackerBaseScreenWidth,
                      ),
                    ),
                  ],
                ),
              ),
            AutoSizeText(
              "BONUS${showTeamDoubleBonus ? "+" : ""}", // Bonus+ starts at 10 fouls from opposite team, again, shown at 1 prior
              style: skin.textStyles.basketballHeaderBody2Bold.copyWith(
                  color: teamBonus ? skin.colors.grey1 : Colors.transparent,
                  height: 1),
              textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
            ),
            if (showBasketballScore)
              AnimatedSwipe(
                teamColor: teamColor,
                maxWidth: maxWidth,
                key: ValueKey(score),
                child: AutoSizeText(
                  score.toString(),
                  style: skin.textStyles.basketballHeader5Bold.copyWith(
                      letterSpacing: 0.8, color: skin.colors.grey1, height: 1),
                  textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
