import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../store/game_tracker_skin_store.dart';

class FieldGoalAttemptsProgressBarWidget extends ConsumerWidget {
  FieldGoalAttemptsProgressBarWidget(
      {required this.size,
      required this.makesCount,
      required this.attemptsCount,
      required this.attemptsCountPercentage,
      required this.homeOrAway,
      super.key}) {
    progressBarFullWidth = size.width / 2.3;
    isAwayTeam = homeOrAway == HomeOrAway.away;
    makesOrAttemptsIsNotZero = (makesCount != null && makesCount! > 0) ||
        (attemptsCount != null && attemptsCount! > 0);
    percentage = makesOrAttemptsIsNotZero ? '$attemptsCountPercentage%' : 'N/A';
  }

  final Size size;
  final int? makesCount;
  final int? attemptsCount;
  final double? attemptsCountPercentage;
  final HomeOrAway homeOrAway;

  late final double progressBarFullWidth;
  late final bool isAwayTeam;
  late final bool makesOrAttemptsIsNotZero;
  late final String percentage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.read(gameTrackerSkinProvider).skin;

    return Column(
      crossAxisAlignment:
          isAwayTeam ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        /// field goal attemptsCount progress bar
        Stack(
          textDirection: isAwayTeam ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Container(
              height: 4,
              width: progressBarFullWidth,
              decoration: BoxDecoration(
                  color: skin.colors.grey5,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
            Container(
              height: 4,
              width:
                  progressBarFullWidth * (attemptsCountPercentage ?? 0) * 0.01,
              decoration: BoxDecoration(
                  color: skin.colors.grey1,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
          ],
        ),
        Row(
          textDirection: isAwayTeam ? TextDirection.ltr : TextDirection.rtl,
          children: [
            Text(
              '$makesCount/$attemptsCount',
              style: skin.textStyles.basketballHeaderBody1Medium
                  .copyWith(color: skin.colors.basketballGrey2),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              percentage,
              style: skin.textStyles.basketballHeader5Bold
                  .copyWith(color: skin.colors.grey1),
            ),
          ],
        )
      ],
    );
  }
}
