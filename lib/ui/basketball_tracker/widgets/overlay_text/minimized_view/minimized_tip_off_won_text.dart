import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/models.dart';
import '../../../../../store/game_tracker_skin_store.dart';

class MinimizedTipOffWonText extends ConsumerWidget {
  const MinimizedTipOffWonText({
    super.key,
    required this.teamName,
    required this.courtSide,
  });

  final String teamName;
  final HomeOrAway courtSide;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    return Row(
      textDirection:
          courtSide == HomeOrAway.home ? TextDirection.rtl : TextDirection.ltr,
      children: [
        AutoSizeText(
          teamName.toUpperCase(),
          style: skin.textStyles.basketballHeader4Bold
              .copyWith(color: skin.colors.grey1, fontSize: 30),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              'TIP OFF',
              style: skin.textStyles.basketballHeader4Bold
                  .copyWith(color: skin.colors.grey1, fontSize: 14),
            ),
            AutoSizeText(
              'WON',
              style: skin.textStyles.basketballHeader4Medium
                  .copyWith(color: skin.colors.grey1, fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
