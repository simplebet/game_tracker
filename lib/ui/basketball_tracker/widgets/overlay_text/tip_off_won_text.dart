import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class TipOffWonText extends ConsumerWidget {
  const TipOffWonText({
    super.key,
    required this.teamName,
    required this.courtSide,
    required this.maxWidth,
  });
  final String teamName;
  final HomeOrAway courtSide;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return AutoSizeText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: teamName.toUpperCase(),
            style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                height: 1.6, letterSpacing: 1.68, color: skin.colors.grey1),
          ),
          TextSpan(
              text: "\nTIP OFF",
              style: skin.textStyles.basketballHeader2Black.copyWith(
                  height: 0.85, letterSpacing: 1.6, color: skin.colors.grey1)),
          TextSpan(
            text: "\nWON",
            style: skin.textStyles.basketballHeader1Medium.copyWith(
                height: .93,
                letterSpacing: 3.84,
                color: skin.colors.basketballGrey1),
          ),
        ],
      ),
      textAlign: courtSide == HomeOrAway.away ? TextAlign.start : TextAlign.end,
      textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
    );
  }
}
